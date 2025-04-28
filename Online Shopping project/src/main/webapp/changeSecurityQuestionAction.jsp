<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String securityQuestion=request.getParameter("securityQuestion");
String newAnswer=request.getParameter("newAnswer");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rst.next()){
		check=1;
		PreparedStatement pst=con.prepareStatement("update users set securityQuestion='"+securityQuestion+"',answer='"+newAnswer+"' where email='"+email+"'");
		pst.executeUpdate();
		response.sendRedirect("changeSecurityQuestion.jsp?msg=valid");
		pst.close();
	}
	rst.close();
	st.close();
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=invalid");
	}
}catch(Exception e){
	
	e.printStackTrace();
}
%>