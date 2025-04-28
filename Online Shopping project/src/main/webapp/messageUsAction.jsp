<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{
	Connection con=DbConnectivity.getConnection();
	PreparedStatement pst=con.prepareStatement("insert into message (email,subject,body) values(?,?,?)");
	pst.setString(1, email);
	pst.setString(2, subject);
	pst.setString(3, body);
	pst.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}catch(Exception e){
	
}
%>