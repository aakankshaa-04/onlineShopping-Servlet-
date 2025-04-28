<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
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
int z=0;
try{
	String search=request.getParameter("search");
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='yes'");
	while(rst.next()){
		z=1;
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
e.printStackTrace();
}
%> 
        </tbody>
      </table>
      	<%if(z==0){%>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>