<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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
<div style="color: black; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
<h3 class="alert">Product added successfully!</h3>
<%}%>
<%if("exist".equals(msg)){ %>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%}%>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Something Went Wrong!</h3>
<%}%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from product where active='yes'");
	while(rst.next()){
%>
          <tr>
            <td><%=rst.getString(1)%></td>
            <td><%=rst.getString(2)%></td>
            <td><%=rst.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rst.getString(4)%> </i></td>
            <td><a href="addToCartAction.jsp?id=<%=rst.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
}
}catch(Exception e){
	
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>