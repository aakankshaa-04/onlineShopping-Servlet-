<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");
if(!confirmPassword.equals(newPassword)){
	response.sendRedirect("changePassword.jsp?msg=notMatch");
}else{
	int check=0;
	try{
		Connection con=DbConnectivity.getConnection();
		Statement st=con.createStatement();
		ResultSet rst=st.executeQuery("select * from users where email='"+email+"' and password='"+oldPassword+"'");
		while(rst.next()){
			check=1;
			PreparedStatement pst=con.prepareStatement("update users set password='"+newPassword+"' where email='"+email+"'");
			pst.executeUpdate();
			response.sendRedirect("changePassword.jsp?msg=done");
			pst.close();
		}
		if(check==0){
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
		rst.close();
		st.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
}
%>