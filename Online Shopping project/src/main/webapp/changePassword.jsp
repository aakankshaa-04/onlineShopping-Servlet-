<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="mycss/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg)){
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%}%>
<%if("wrong".equals(msg)){ %>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>
<%if("done".equals(msg)){%>
<h3 class="alert">Password change successfully!</h3>
<%}%>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%}%>

<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
<input type="password" name="oldPassword" class="input-style" placeholder="Enter Old Password" required>
  <hr>
 <h3>Enter New Password</h3>
 <input type="password" name="newPassword" class="input-style" placeholder="Enter New Password" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input type="password" name="confirmPassword" class="input-style" placeholder="Enter Confirm Password" required>
<hr>
 <button class="button" type="submit"><i class='far fa-arrow-alt-circle-right'></i> Save</button>
</form>
</body>
<br><br><br>
</html>