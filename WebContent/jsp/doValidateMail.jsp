<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
        // 配置文件对象  
        Properties props = new Properties();  
        // 邮箱服务地址  
        props.put( "mail.smtp.host ", "kaitohh.com ");       
        // 是否进行验证  
        props.put("mail.smtp.auth", "true");  
        // 创建一个会话  
        Session s = Session.getInstance(props);  
        // 打开调试，会打印与邮箱服务器回话的内容  
        s.setDebug(true);  
        Message message = new MimeMessage(s);  
        // 如果发送人没有写对，那么会出现 javamail 550 Invalid User  
        // 如果发送人写的和使用的帐号不一致，则会出现 553 Mail from must equal authorized user  
        InternetAddress from = new InternetAddress("user@kaitohh.com");  
        from.setPersonal(MimeUtility.encodeText("zhao.ren用户验证"));  
        message.setFrom(from);  
        InternetAddress to = new InternetAddress("502597562@qq.com");  
        message.setRecipient(Message.RecipientType.TO, to);  
        message.setSubject(MimeUtility.encodeText("[zhao.ren]请验证你的账户"));  
        message.setText("您好，欢迎您注册zhao.ren，请点击以下链接验证您的账户 http://www.baidu.com");
        message.setSentDate(new Date());  
        Transport transport = s.getTransport("smtp");  
        // 具体你使用邮箱的smtp地址和端口，应该到邮箱里面查看，如果使用了SSL，网易的端口应该是 465/994  
        transport.connect("kaitohh.com", 25, "user@kaitohh.com", "zhao.ren.user");  
        transport.sendMessage(message, message.getAllRecipients());  
        transport.close();  
%>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<% 
   //out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>