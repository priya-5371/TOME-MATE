<%@ page import="java.sql.*"%>
<html>
<body>
<%! String usr,pwd;
boolean b;
%>
<%
usr=request.getParameter("username");
pwd=request.getParameter("password");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?useSSL=false","root","priya");
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from user where username='"+usr+"'and password='"+pwd+"'");
if(rs.next()){
response.sendRedirect("homepage.html");
}else{
response.sendRedirect("signup.html");
}con.close();
}catch(Exception e){
System.out.println(e.getMessage());}
%>
</body>
</html>