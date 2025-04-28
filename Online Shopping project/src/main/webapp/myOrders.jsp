<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
	while(rst.next()){
		sno=sno+1;
%>
          <tr>
            <td><%out.println(sno);%></td>
            <td><%=rst.getString(17)%></td>
            <td><%=rst.getString(18)%></td>
            <td><i class="fa fa-inr"></i><%=rst.getString(19)%></td>
            <td><%=rst.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rst.getString(5)%></td>
             <td><%=rst.getString(11)%></td>
              <td><%=rst.getString(12)%></td>
               <td><%=rst.getString(13)%></td>
               <td><%=rst.getString(15)%></td>
            </tr>
         <%
         }
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