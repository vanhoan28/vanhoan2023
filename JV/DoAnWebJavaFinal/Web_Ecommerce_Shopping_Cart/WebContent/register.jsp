<%@page import="web_shopping_cart.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    
    User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null){
		request.setAttribute("auth",auth);
	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Now</title>
<%@include file="components/head.jsp" %>
</head>
<body>
	<div >
		<%@include file="components/header.jsp" %>	
	</div>
	
	<form action="RegisterServlet" method="get">
		<div>
			<h1 style="text-align: center; margin-top: 100px;">REGISTER</h1>
			<table class="table d-flex justify-content-center">
				<tr class="form-group"><td>Name<br>
					<input class="form-control" type="text" name="r_name"></td></tr>
				<tr class="form-group"><td>Email<br>
					<input class="form-control" type="email" name="r_email"></td></tr>
				<tr class="form-group"><td>Password<br>
					<input class="form-control" type="password" name="r_password"></td></tr>	
				<tr class="form-group"><td><input type="hidden" value="0" name="r_phanquyen"></td></tr>
			</table>	
			<div class="d-flex justify-content-center">
				<input class=" btn btn-secondary" type="submit" name="r_register" value="Submit">
			</div>	
		</div>
	</form>
	
	
	
	<div style=" margin-top: 200px;">
		<%@include file="components/footer.jsp" %>
	</div>
</body>
</html>