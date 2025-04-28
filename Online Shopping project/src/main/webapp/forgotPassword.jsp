<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mycss/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="forgotPasswordAction.jsp" method="post">
  <input type="email" name="email" placeholder="Enter Email" required>
  <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
  <select name="securityQuestion">
  <option value="What is the name of your first childhood pet?">What is the name of your first childhood pet?</option>
  <option value="What is the middle name of your oldest sibling?">What is the middle name of your oldest sibling?</option>
  <option value="In what city did your parents meet?">In what city did your parents meet?</option>
  <option value="What is the name of your favorite childhood character?">What is the name of your favorite childhood character?</option>
  </select>
  <input type="text" name="answer" placeholder="Enter Answer">
  <input type="password" name="password" placeholder="Enter New Password To Set">
  <input type="submit" name="Save">
  </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <%
   String msg=request.getParameter("msg");
   if("done".equals(msg)){
   %>
<h1>Password Changed Successfully!</h1>
<%}%>
<%if("invalid".equals(msg)){%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%}%>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>