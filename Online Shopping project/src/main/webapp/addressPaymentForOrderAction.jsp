<%@page import="java.io.PrintWriter"%>
<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId="";
transactionId=request.getParameter("transactionId");
String status="bill";
try{
	Connection con=DbConnectivity.getConnection();
	PreparedStatement pst=con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	pst.setString(1, address);
	pst.setString(2, city);
	pst.setString(3, state);
	pst.setString(4, country);
	pst.setString(5, mobileNumber);
	pst.setString(6, email);
	pst.executeUpdate();
	System.out.println("updated users");
	String sql = "UPDATE cart SET address=?, city=?, state=?, country=?, mobilenumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY), paymentMethod=?, transactionId=?,status=? WHERE email=? and address is NULL";
	PreparedStatement ps = con.prepareStatement(sql);

	// Set parameters in order
	ps.setString(1, address);
	ps.setString(2, city);
	ps.setString(3, state);
	ps.setString(4, country);
	ps.setString(5, mobileNumber);
	ps.setString(6, paymentMethod);
	ps.setString(7, transactionId);
	ps.setString(8, status);
	ps.setString(9, email);
	ps.executeUpdate();

	System.out.println("updated cart");
	response.sendRedirect("bill.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>