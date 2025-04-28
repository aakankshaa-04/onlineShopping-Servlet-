<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../mycss/addNewProduct-style.css">
<title>Add New Product</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%}%>
<% 
int id=1;
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select max(id) from product");
	while(rst.next()){
		id=rst.getInt(1);
		id=id+1;
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: blue;">Product ID:<%out.println(id);%> </h3>
<input type="hidden" name="id" value="<%out.println(id);%>">

 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
<hr>


<h3>Enter Category</h3>
<input class="input-style" type="text" name="category" placeholder="Enter Category" required>
<hr>



<h3>Enter Price</h3>
<input class="input-style" type="number" name="price" placeholder="Enter Price" required>
<hr>


<h3>Active</h3>
<select class="input-style" name="active">
<option value="yes">yes</option>
<option value="no">no</option>
</select>
<hr>

 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>