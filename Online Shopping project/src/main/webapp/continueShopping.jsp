<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String status="processing";
try{
	Connection con=DbConnectivity.getConnection();
	PreparedStatement pst=con.prepareStatement("update cart set status=? where email='"+email+"' and status='bill'");
	pst.setString(1, status);
	pst.executeUpdate();
	response.sendRedirect("home.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>