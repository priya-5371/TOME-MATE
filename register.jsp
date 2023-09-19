<%@ page import="java.sql.*"%>
<html>
<head>
</head>
<body bgcolor="yellow">
<%!String username,password;
int x;%>
<%
username=request.getParameter("username");
password=request.getParameter("password");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?useSSL=false","root","priya");
String q="insert into user(username,password) values (?,?)";
PreparedStatement stm=con.prepareStatement(q);
stm.setString(1,username);
stm.setString(2,password);
int x=stm.executeUpdate();
System.out.println("suucessfull executed="+x);
if(x>0){
response.sendRedirect("login.html");
}
else{
out.println("invalid user");
}
con.close();
}catch(Exception e){
System.out.println(e.getMessage());
}
%>
</body>
</html>