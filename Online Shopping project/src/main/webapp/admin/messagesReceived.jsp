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
	color: yellow;
	text-align: center;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
<%
try{
Connection con=DbConnectivity.getConnection();
Statement st=con.createStatement();
ResultSet rst=st.executeQuery("select * from message");
while(rst.next()){
%>   
          <tr>
            <td><%=rst.getString(1)%></td>
            <td><%=rst.getString(2)%></td>
            <td><%=rst.getString(3)%></td>
            <td><%=rst.getString(4)%></td>
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