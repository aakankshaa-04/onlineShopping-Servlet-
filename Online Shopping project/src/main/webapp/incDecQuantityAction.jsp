<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
	while(rst.next()){
		price=rst.getInt(4);
		total=rst.getInt(5);
		quantity=rst.getInt(3);
	}
	if(quantity==1&& incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
	}else if(quantity!=1&& incdec.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id="+id+" and address is NULL");
		response.sendRedirect("myCart.jsp?msg=dec");
	}else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id="+id+" and address is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
}catch(Exception e){
	e.printStackTrace();
}
%>