<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
try{
	Connection con=DbConnectivity.getConnection();
	PreparedStatement pst=con.prepareStatement("update users set address=?,city=?,state=?,country=? where email=?");
	pst.setString(1, address);
	pst.setString(2, city);
	pst.setString(3, state);
	pst.setString(4, country);
	pst.setString(5, email);
	pst.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
}catch(Exception e){
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
	e.printStackTrace();
}
%>