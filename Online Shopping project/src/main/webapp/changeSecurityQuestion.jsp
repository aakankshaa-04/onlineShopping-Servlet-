<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="mycss/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Your Password is wrong!</h3>
<%}%>
<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
<select class="input-style" name="securityQuestion">
<option value="What is the name of your first childhood pet?">What is the name of your first childhood pet?</option> 
    <option value="What is the middle name of your oldest sibling?">What is the middle name of your oldest sibling?</option> 
    <option value="In what city did your parents meet?">In what city did your parents meet?</option> 
    <option value="What is the name of your favorite childhood character?">What is the name of your favorite childhood character?</option>
</select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter New Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter Password(For Security)" required>
<hr>
<button class="button" type="submit">Submit<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>