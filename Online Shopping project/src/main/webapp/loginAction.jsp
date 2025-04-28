<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email)&&"admin".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}else{
	int z=0;
	try{
		Connection con=DbConnectivity.getConnection();
		Statement st=con.createStatement();
		ResultSet rst=st.executeQuery("select * from users where email='"+email+"'and password='"+password+"'");
		while(rst.next()){
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0){
			response.sendRedirect("login.jsp?msg=notExist");
		}
	}catch(Exception e){
		response.sendRedirect("login.jsp?msg=invalid");
		e.printStackTrace();
	}
}
%>