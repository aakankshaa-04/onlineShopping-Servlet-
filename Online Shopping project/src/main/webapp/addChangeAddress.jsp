<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="mycss/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<title>Add or Change Password</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from users where email='"+email+"'");
	while(rst.next()){
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rst.getString(7)%>" placeholder="Enter Address" required>
 <hr>
 <h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rst.getString(8)%>" placeholder="Enter city" required>
<hr>
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rst.getString(9)%>" placeholder="Enter state" required>
<hr>
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rst.getString(10)%>" placeholder="Enter country">
<hr>
<button class="button" type="submit">Save</button><i class='far fa-arrow-alt-circle-right'></i>
</form>
<%}
}catch(Exception e){
		
}%>
</body>
<br><br><br>
<br>
</html>