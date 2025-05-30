<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: red;
	text-align: center;
}
</style>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%
}%>
<%
if("inc".equals(msg)){
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%}%>
<%
if("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%}%>
<%
if("removed".equals(msg)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%}%>
<table>
<thead>
<%
int total=0;
int sno=0;
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rst.next()){
		total=rst.getInt(1);
	}
%>
          <tr>
            <th scope="col" style="background-color: black;">Total: <i class="fa fa-inr"> <%out.println(total); %></i> </th>
            <%if(total>0){%><th scope="col" ><a href="addressPaymentForOrder.jsp" >Proceed to order</a></th><%}%>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rst1=st.executeQuery("select * from product inner join cart on product.id=cart.product_id where cart.email='"+email+"' and cart.address is NULL");
      while(rst1.next()){
      %>
          <tr>
          <%sno= sno+1;%>
           <td><%=rst1.getString(sno)%></td>
            <td><%=rst1.getString(2)%></td>
            <td><%=rst1.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rst1.getString(4)%> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rst1.getString(1)%>&quantity=inc"><i class="fas fa-plus-circle"></i></a> <%=rst1.getString(8)%> <a href="incDecQuantityAction.jsp?id=<%=rst1.getString(1)%>&quantity=dec"><i class="fas fa-minus-circle"></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rst1.getString(10)%></td>
            <td><a href="removeFromCartAction.jsp?id=<%=rst1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%}
}catch(Exception e){
	e.printStackTrace();
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>