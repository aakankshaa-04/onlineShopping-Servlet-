<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%}%>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%}%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con=DbConnectivity.getConnection();
    	   Statement st=con.createStatement();
    	   ResultSet rst=st.executeQuery("select * from product");
    	   while(rst.next()){
       %>
          <tr>
            <td><%=rst.getString(1) %></td>
            <td><%=rst.getString(2) %></td>
            <td><%=rst.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rst.getString(4) %></td>
            <td><%=rst.getString(5) %></td>
            <td><a href="editProduct.jsp?id=<%=rst.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
    	   }
       }catch(Exception e){
    	   e.printStackTrace(); 
       }%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>