<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="cancel";
try{
	Connection con=DbConnectivity.getConnection();
	PreparedStatement pst=con.prepareStatement("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not null");
	pst.executeUpdate();
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("odersReceived.jsp?msg=invalid");
}
%>