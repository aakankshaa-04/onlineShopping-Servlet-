<%@page import="java.awt.Taskbar.State"%>
<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="mycss/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from users where email='"+email+"'");
	while(rst.next()){
%>
<h3>Name:<%=rst.getString(1)%> </h3>
<hr>
 <h3>Email:<%=rst.getString(2)%></h3>
 <hr>
 <h3>Mobile Number:<%=rst.getString(3)%> </h3>
 <hr>
<h3>Security Question:<%=rst.getString(4)%> </h3>
<hr>
      <br>
      <br>
      <br>
<%}
	}catch(Exception e){
	e.printStackTrace();
	}%>
</body>
</html>