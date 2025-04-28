<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../mycss/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
          </tr>
<%
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not null and cart.status='delivered'");
	while(rst.next()){
%>    
        
          <tr>
          <td><%=rst.getString(10)%></td>
            <td><%=rst.getString(17)%></td>
            <td><%=rst.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rst.getString(5)%></td>
                <td><%=rst.getString(6)%></td>
               <td><%=rst.getString(7)%></td>
                <td><%=rst.getString(8)%></td>
                 <td><%=rst.getString(9)%></td>
             <td><%=rst.getString(11)%></td>
              <td><%=rst.getString(12)%></td>
               <td><%=rst.getString(13)%></td>
               <td><%=rst.getString(14)%></td>
               <td><%=rst.getString(15)%></td>
              </tr>
<%}
}catch(Exception e){
e.printStackTrace();
}%>      
        </table>
      <br>
      <br>
      <br>

</body>
</html>