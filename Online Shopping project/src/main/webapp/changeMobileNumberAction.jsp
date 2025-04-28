<%@page import="project.DbConnectivity"%>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String mobileNumber=request.getParameter("mobileNumber");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=DbConnectivity.getConnection();
	Statement st=con.createStatement();
	ResultSet rst=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rst.next()){
		check=1;
		PreparedStatement pst=con.prepareStatement("update users set mobileNumber='"+mobileNumber+"' where email='"+email+"'");
		pst.executeUpdate();
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
		pst.close();
	}
	rst.close();
	st.close();
	if(check==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>