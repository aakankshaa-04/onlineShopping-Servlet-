<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mycss/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter Name" required>
    <input type="email" name="email" placeholder="Enter Email" required>
    <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
    <select name="securityQuestion" required>
    <option value="What is the name of your first childhood pet?">What is the name of your first childhood pet?</option> 
    <option value="What is the middle name of your oldest sibling?">What is the middle name of your oldest sibling?</option> 
    <option value="In what city did your parents meet?">In what city did your parents meet?</option> 
    <option value="What is the name of your favorite childhood character?">What is the name of your favorite childhood character?</option> 
    </select>
    <input type="text" name="answer" placeholder="Enter Answer" required>
    <input type="password" name="password" placeholder="Enter password" required>
    <input type="submit" value="SignUp">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h1>Successfully Updated</h1>
<%
}
%>
<% if("invalid".equals(msg)){%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%
}
%>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>