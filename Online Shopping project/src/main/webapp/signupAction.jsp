<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
try{
	Connection con=DbConnectivity.getConnection();
	PreparedStatement pst=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	pst.setString(1, name);
	pst.setString(2, email);
	pst.setString(3, mobilenumber);
	pst.setString(4, securityQuestion);
	pst.setString(5, answer);
	pst.setString(6, password);
	pst.setString(7, address);
	pst.setString(8, city);
	pst.setString(9, state);
	pst.setString(10, country);
	pst.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>