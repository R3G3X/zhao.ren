package zhao_ren_db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

public class db_connector {
    Connection conn = null;
    final static int NUMBER_PER_PAGE = 12;

    public db_connector() {
        //加载数据库驱动类
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        //数据库连接URL
        String url = "jdbc:mysql://kaitohh.com:3306/zhao_ren?autoReconnect=true&useSSL=false";
        //数据库用户名和密码
        String user = "root";
        String password = "zhao.ren.admin";
        //根据数据库参数取得一个数据库连接值
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connection Success. Result is: " + conn.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean login(String username, String password) throws SQLException {
        String sql = "SELECT password FROM user WHERE username = \'" + username + "\';";
        String passDb = getSingleQuery(sql);
        String passCur = Hash.encode(username, password);
        sql = "select status from user where username = '" + username + "'";
        String status = getSingleQuery(sql);
        if (status.equals("0") && passDb.equals(passCur))
            return true;
        else
            return false;
    }

    public boolean register(String username, String password, String email) throws Exception {
        String code = Hash.encode(username, password);
        String sql = String.format(
                "INSERT INTO user(username,password,email,avatar,status) VALUES (\"%s\",\"%s\",\"%s\",concat((floor(rand()*8)+1),'.jpg'),\"%d\")",
                username, code, email, 1);
        System.out.println(sql);
        return update(sql) == 1;
    }

    public String mail(String username, String password) throws Exception {
        return Hash.encode(username, password);
    }

    public boolean confirm(String username, String Hash) throws Exception {
        String sql = String.format("update user set status = 0 where username = '%s' and password = '%s'", username, Hash);
        return update(sql) == 1;
    }

    public ResultSet index_project_qry() throws SQLException {
        String sql = "SELECT id,name,intro,visits,count(user_id) as people FROM project,project_member WHERE id = project_id GROUP BY project_id ORDER BY visits/log(datediff(curtime(),create_time)+1.01) desc LIMIT 6;";
        return query(sql);
    }

    public int count_project_num(int pid) throws NumberFormatException, SQLException {
        String sql = "SELECT count(user_id) FROM project_member WHERE project_id = " + pid + ";";
        return Integer.parseInt(getSingleQuery(sql));
    }

    String getSingleQuery(String sql) throws SQLException {
        ResultSet ret = query(sql);
        if (ret.next())
            return ret.getString(1);
        else
            return "";
    }


    ResultSet query(String sql) throws SQLException {
        Statement statement = conn.createStatement();
        ResultSet ret = statement.executeQuery(sql);
        return ret;
    }

    int update(String sql) throws Exception {
        Statement statement = conn.createStatement();
        int d = statement.executeUpdate(sql);
        return d;
    }

    public ResultSet userInfo(int id) throws SQLException {
        String sql = "SELECT * FROM user WHERE id = " + id;
        return query(sql);
    }

    public String finished_count(int id) throws SQLException {
        String sql = "SELECT COUNT(project_id) FROM user_space WHERE isFinshed=2 AND user_id = " + id + ";";
        return getSingleQuery(sql);
    }

    public String ongoing_count(int id) throws SQLException {
        String sql = "SELECT COUNT(project_id) FROM project_member,project WHERE id=project_id AND isFinshed=0 AND user_id="
                + id + ";";
        return getSingleQuery(sql);
    }

    public String processing_count(int id) throws SQLException {
        String sql = "SELECT COUNT(id) FROM message_queue WHERE needConfirm = 1 AND isRead = 0 AND sender_id=" + id
                + ";";
        return getSingleQuery(sql);
    }

    public ResultSet project_as_founder(int id) throws SQLException {
        String sql = "SELECT id,name FROM project WHERE founder_id=" + id + ";";
        return query(sql);
    }

    public ResultSet project_as_member(int id) throws SQLException {
        String sql = "SELECT project_id,name FROM project_member,project WHERE project_id=id AND premission!=1 AND user_id="
                + id + ";";
        return query(sql);
    }

    public ResultSet project_info(int id) throws SQLException {
        String sql = "SELECT * FROM project WHERE id = " + id + ";";
        return query(sql);
    }

    public String project_tech(int id) throws SQLException {
        String sql = "SELECT * FROM project_tech WHERE project_id = " + id;
        String techs = "";
        ResultSet set = query(sql);
        while (set.next()) {
            techs += "," + set.getString("tech");
        }
        techs = techs.substring(1);
        return techs;
    }

    public ResultSet project_list(int pages) throws SQLException {
        String sql = String.format("SELECT * FROM project WHERE isFinshed = 0 ORDER BY id DESC LIMIT %d,%d",
                (pages - 1) * NUMBER_PER_PAGE, NUMBER_PER_PAGE);
        return query(sql);
    }

    public ResultSet project_list(int pages, String words, String method, String crew, String cycle) throws SQLException {
        String[] word = words.split(" ");
        String sql = String.format(
                "SELECT * FROM project WHERE isFinshed = 0 AND ((name LIKE \"%%%s%%\" OR intro LIKE \"%%%s%%\")",
                word[0], word[0]);
        for (int i = 1; i < word.length; i++) {
            sql += String.format(" OR (name LIKE \"%%%s%%\" OR intro LIKE \"%%%s%%\")", word[i], word[i]);
        }
        sql += String.format(") AND ((require_num <= " + crew + ")) AND ((round_time <= " + cycle + ")) ORDER BY " + method + " DESC LIMIT %d,%d;", (pages - 1) * NUMBER_PER_PAGE, NUMBER_PER_PAGE);
        System.out.println(sql);
        return query(sql);
    }

    public int all_pages() throws SQLException {
        String sql = "SELECT COUNT(id) FROM project;";
        return (int) Math.ceil(Integer.parseInt(getSingleQuery(sql)) / 1.0 / NUMBER_PER_PAGE);
    }

    public int all_pages(String words, String crew, String cycle) throws SQLException {
        String sql = String.format(
                "SELECT COUNT(id) FROM project WHERE isFinshed = 0 AND ((name LIKE \"%%%s%%\" OR intro LIKE \"%%%s%%\")) AND ((require_num < \"s\")) AND ((round_time < \"s\")) ;",
                words, words, crew, cycle);
        return (int) Math.ceil(Integer.parseInt(getSingleQuery(sql)) / 1.0 / NUMBER_PER_PAGE);
    }

    public String whois(String username) throws SQLException {
        String sql = "SELECT id FROM user WHERE username = \'" + username + "\';";
        return getSingleQuery(sql);
    }

    public int add_visits(int id) throws Exception {
        String sql = "UPDATE project SET visits = visits + 1 WHERE id = " + id + ";";
        return update(sql);
    }

    public int add_project(String name, int founder_id, String intro, String num, String time, String detail) {
        if (Integer.parseInt(num) <= 1 || Integer.parseInt(time) <= 0) return -1;
        String pid;
        try {
            String sql = "INSERT INTO project(name,create_time,founder_id,intro,require_num,round_time,detail,image)"
                    + " VALUES(\"" + name + "\",curdate()," + founder_id + ",\"" + intro + "\"," + Integer.parseInt(num)
                    + "," + Integer.parseInt(time) + ",\"" + detail + "\",concat((floor(rand()*8)+1),'.jpg'));";
            update(sql);
            pid = getSingleQuery("SELECT max(id) FROM project;");
            sql = "INSERT INTO project_member(project_id,user_id,premission) " + "VALUES (" + pid + "," + founder_id
                    + ",1);";
            update(sql);
            sql = "INSERT INTO user_space VALUES(" + founder_id + ",curdate(),0," + pid + ")";
            update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return -2;
        }

        return Integer.valueOf(pid);
    }

    public ResultSet user_space(int id) throws SQLException {
        String sql = "SELECT *,DATEDIFF(curdate(),time) as diff FROM zhao_ren.user_space WHERE user_id = " + id
                + " ORDER BY diff LIMIT 0,15;";
        return query(sql);
    }

    public boolean user_edit(int id, String username, String oldpass, String password, String realname, String intro,
                             String tech_intro, String phone, String email, String major) throws SQLException {
        boolean changed = true;
        if (oldpass.equals("") && password.equals("")) {
            password = getSingleQuery("SELECT password FROM user WHERE id = " + id);
            changed = false;
        } else if (!login(username(id), oldpass)) return false;
        String sql = String.format(
                "UPDATE user SET username=\"%s\",password=\"%s\",realName=\"%s\",userintro=\"%s\",tech_intro=\"%s\",phone=%s,email=\"%s\",major=\"%s\" WHERE id = %d",
                username, changed ? Hash.encode(username, password) : password, realname, intro, tech_intro, phone,
                email, major, id);
        try {
            update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;

    }

    public String username(int id) throws SQLException {
        String sql = "SELECT username FROM user WHERE id = " + id + ";";
        return getSingleQuery(sql);
    }

    public int message_pid(int mid) throws SQLException {
        String sql = "SELECT message FROM message_queue WHERE id = " + mid + ";";
        String q = getSingleQuery(sql);
        int k = q.indexOf("project.jsp?id=");
        q = q.substring(k + 15);
        int k2 = q.indexOf('>');
        q = q.substring(0, k2);
        return Integer.parseInt(q);
    }

    public ResultSet user_message(int id) throws SQLException {
        String sql = "SELECT * FROM message_queue WHERE isRead = 0 AND receiver_id = " + id + " ORDER BY time;";
        return query(sql);
    }

    public String project_name(int pid) throws SQLException {
        String sql = "SELECT name FROM project WHERE id = " + pid + ";";
        return getSingleQuery(sql);
    }

    public void hasRead(int mid) throws Exception {
        String sql = "UPDATE message_queue SET isRead = 1 WHERE id = " + mid + ";";
        update(sql);
    }

    boolean needConfirm(int mid) throws SQLException {
        String sql = "SELECT needConfirm FROM message_queue WHERE id = " + mid + ";";
        return getSingleQuery(sql).equals("1");
    }

    int whose_message(int mid) throws NumberFormatException, SQLException {
        String sql = "SELECT receiver_id FROM message_queue WHERE id = " + mid + ";";
        return Integer.parseInt(getSingleQuery(sql));
    }

    int taken_message(int mid) throws NumberFormatException, SQLException {
        String sql = "SELECT sender_id FROM message_queue WHERE id = " + mid + ";";
        return Integer.parseInt(getSingleQuery(sql));
    }

    public void processing_msg(int mid, int par, int id) throws Exception {
        if (whose_message(mid) == id) {
            if (needConfirm(mid)) {
                int pid = message_pid(mid);
                int sid = taken_message(mid);
                if (par == 1) {
                    project_add_person(sid, pid);
                } else {
                    project_deny_person(sid, pid);
                }
            }
            hasRead(mid);

        }
    }

    public int founder_of_project(int pid) throws NumberFormatException, SQLException {
        String sql = "SELECT founder_id FROM project WHERE id = " + pid + ";";
        return Integer.parseInt(getSingleQuery(sql));
    }

    public boolean join_project(int id, int pid) {
        try {
            if (founder_of_project(pid) == id) {
                return false;
            }
            add_message(user_href(id) + "想要加入" + project_href(pid), 1, founder_of_project(pid), id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    String user_href(int id) throws SQLException {
        return "<a href=../user/user.jsp?id=" + id + ">" + username(id) + "</a>";
    }

    String project_href(int pid) throws SQLException {
        return "<a href=../project/project.jsp?id=" + pid + ">" + project_name(pid) + "</a>";
    }

    int project_requirednum(int pid) throws NumberFormatException, SQLException {
        String sql = "SELECT require_num FROM project WHERE id = " + pid + ";";
        return Integer.parseInt(getSingleQuery(sql));
    }

    public boolean project_add_person(int id, int pid) {
        try {
            if (count_project_num(pid) >= project_requirednum(pid)) return false;
        } catch (NumberFormatException | SQLException e1) {
            e1.printStackTrace();
        }
        String s2 = String.format("INSERT INTO project_member VALUES(%d,%d,%d)", pid, id, 2);
        String s3 = String.format("INSERT INTO user_space VALUES(%d,curdate(),0,%d)", id, pid);
        try {
            update(s2);
            update(s3);
            add_message("您[" + user_href(id) + "]已加入" + project_href(pid), 0, id, id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean project_deny_person(int id, int pid) {
        try {
            add_message("您[" + user_href(id) + "]被拒绝加入" + project_href(pid), 0, id, id);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    void add_message(String msg, int needConform, int rid, int sid) throws Exception {
        String sql = "INSERT INTO message_queue(message,needConfirm,receiver_id,sender_id,time) " + "VALUES(\"" + msg
                + "\"," + needConform + "," + rid + "," + sid + ",now())";
        update(sql);
    }

    public boolean project_leave(int op, int id, int pid, boolean isleave) {
        boolean success = false;
        try {
            if (op != id && op != founder_of_project(pid)) return success;
            if (id != founder_of_project(pid) || !isleave) {
                String sql = "DELETE FROM project_member WHERE project_id = " + pid + " AND user_id = " + id + ";";
                String s3 = String.format("INSERT INTO user_space VALUES(%d,curdate()," + (isleave ? 1 : 2) + ",%d)",
                        id, pid);

                update(sql);
                update(s3);
                if (isleave) {
                    add_message("您[" + user_href(id) + "]已离开" + project_href(pid), 0, id, id);
                    add_message(user_href(id) + "已经离开" + project_href(pid), 0, founder_of_project(pid), id);
                } else {
                    add_message("恭喜！您[" + user_href(id) + "]完成了" + project_href(pid), 0, id, id);
                }
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    public boolean project_finsh(int id, int pid) {
        try {
            if (founder_of_project(pid) == id) {
                String sql = "SELECT * FROM project_member WHERE project_id = " + pid + ";";
                ResultSet set = query(sql);
                while (set.next()) {
                    project_leave(id, set.getInt("user_id"), pid, false);
                }
                sql = "UPDATE project SET isFinshed = 1 WHERE id = " + pid + ";";
                update(sql);
                sql = "UPDATE project SET fin_time = curdate() WHERE id = " + pid + ";";
                update(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public int unread_message_count(int id) throws NumberFormatException, SQLException {
        String sql = "SELECT COUNT(id) FROM message_queue WHERE isRead=0 AND receiver_id=" + id + ";";
        return Integer.parseInt(getSingleQuery(sql));
    }

    public ResultSet project_of(int id) throws SQLException {
        String sql = "SELECT project_id FROM project_member WHERE user_id=" + id + ";";
        return query(sql);
    }

    public boolean project_info_edit(int id, int pid, String name, String intro, int require_num, int round_time,
                                     String detail) {
        try {
            if (require_num <= 1 || founder_of_project(pid) != id) return false;
            String sql = String.format(
                    "UPDATE project SET name = \"%s\",intro=\"%s\",require_num=%d,round_time=%d,detail=\"%s\" WHERE id = %d",
                    name, intro, require_num, round_time, detail, pid);

            update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public ResultSet member_of_project(int pid) throws SQLException {
        String sql = "SELECT user_id\r\n" + "FROM project_member\r\n" + "WHERE project_id=" + pid + "\r\n"
                + "ORDER BY premission;\r\n";
        return query(sql);

    }

    public void close() throws SQLException {
        conn.close();
    }

    public ResultSet project_comment(int pid) throws SQLException {
        String sql = "SELECT * FROM project_comment WHERE project_id = " + pid + ";";
        return query(sql);
    }

    public boolean project_add_comment(int id, int pid, String msg, int pre_id) throws Exception {
        String sql = "{call add_project_comment(?,?,?,?,?)}";
        int cnt;
        CallableStatement cst = conn.prepareCall(sql);
        cst.setInt(1, id);
        cst.setInt(2, pid);
        cst.setInt(3, pre_id);
        cst.setString(4, msg);
        cst.registerOutParameter(5, Types.INTEGER);
        try {
            cst.execute();
            cnt = cst.getInt(5);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            cst.close();
        }
        ResultSet set = member_of_project(pid);
        while (set.next()) {
            int uid = set.getInt("user_id");
            if (id != uid)
                add_message(user_href(id) + "评论了你[" + user_href(uid) + "]加入的" + project_href(pid) + "(" + cnt + "楼)", 0,
                        uid, id);
        }
        return true;
    }

    public int add_chat_person(int id, int to) {
        String sql = "INSERT INTO user_chat_list VALUE(" + id + "," + to + ")";
        try {
            return update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int delete_chat_person(int id, int target) {
        String sql = "DELETE FROM user_chat_list WHERE user_id=" + id + " AND to_id = " + target + ";";
        try {
            return update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public ResultSet get_chat_info_person(int id, int to) throws SQLException {
        String sql = "SELECT * FROM user_chat WHERE user_id=" + id + " AND to_id = " + to + ";";
        return query(sql);
    }

    public ResultSet get_all_chat_person(int id) throws SQLException {
        String sql = "SELECT * FROM user_chat_list WHERE user_id=" + id + ";";
        return query(sql);
    }

    public boolean add_project_tech(int id, String tech) {
        if (tech == null || tech.equals("")) return true;
        String[] techs = tech.split(",");
        try {
            update("DELETE FROM project_tech WHERE project_id=" + id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String SQL = "INSERT INTO project_tech VALUES(" + id + ",\"?\")";
        for (String str : techs) {
            String cur = SQL.replaceAll("[?]", str.toUpperCase());
            try {
                update(cur);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            //System.out.println(cur);
        }
        return true;
    }

    public static void main(String[] args) throws Exception {
        db_connector db = new db_connector();
        //db.project_list(1, "c++", "visits,id", "100000", "10000");
        System.out.println(db.project_tech(34));
    }
}
