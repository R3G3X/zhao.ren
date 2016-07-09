<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="zhao_ren_db.*"%>
<%
        db_connector db = new db_connector();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        password = db.mail(username,password);
        String url = "http://localhost:8080/zhao.ren/jsp/doValidate.jsp?username="+ username + "&password=" + password;
        // 配置文件对象  
        String body = "<!DOCTYPE html><html><head><meta charset=\"utf-8\"></head><body><div style=\"margin-top:50px;width:50%;margin-left:25%;height:600px;border:1px solid #6C6C6C;\"><div style=\"width:100%;height:10%;background-color:#6C6C6C;color:#fff;\"><p style=\"margin:0px;line-height:100%;height:100%;padding-top:2.5%;padding-left:3%;font-size:20px;font-weight:bold;\">欢迎加入 zhao.ren</p></div><div style=\"width:100%;height:71.6%;text-align:center;padding-top:50px\"><p>请点击以下链接完成注册</p><p>"+url+"</p></div><div style=\"width:100%;height:10%;background-color:#6C6C6C;color:#fff;\"><p style=\"margin:0px;line-height:100%;height:100%;padding-top:3%;padding-left:0%;text-align:center\">by ZHAO.REN</p></div></div></body></html>";
        Properties props = new Properties();  
        // 邮箱服务地址  
        props.put( "mail.smtp.host ", "smtp.qq.com");       
        // 是否进行验证  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.ssl.enable","true");
        // 创建一个会话  
        Session s = Session.getInstance(props);  
        // 打开调试，会打印与邮箱服务器回话的内容  
        s.setDebug(true);  
        Message message = new MimeMessage(s);  
        // 如果发送人没有写对，那么会出现 javamail 550 Invalid User  
        // 如果发送人写的和使用的帐号不一致，则会出现 553 Mail from must equal authorized user  
        InternetAddress from = new InternetAddress("1738505152@qq.com");  
        from.setPersonal(MimeUtility.encodeText("用户验证"));  
        message.setFrom(from);  
        InternetAddress to = new InternetAddress(email);  
        message.setRecipient(Message.RecipientType.TO, to);  
        message.setSubject(MimeUtility.encodeText("你好"));  
        message.setContent(body, "text/html;charset = utf-8");
        message.setSentDate(new Date());  
        Transport transport = s.getTransport("smtp");  
        // 具体你使用邮箱的smtp地址和端口，应该到邮箱里面查看，如果使用了SSL，网易的端口应该是 465/994  
        transport.connect("smtp.qq.com", 465, "1738505152", "ulgokrkiklmmcbhj");  
        transport.sendMessage(message, message.getAllRecipients());  
        transport.close();  
%>
<html>
<head>
</head>
<body>
</body>
</html>