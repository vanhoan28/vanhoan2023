<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="web_shopping_cart.model.*"%>
    <%
    	User auth = (User) request.getSession().getAttribute("auth");
    	if(auth != null){
    		response.sendRedirect("index.jsp");
    	}
    	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    	if(cart_list != null){
    		request.setAttribute("cart_list",cart_list);
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<title>Login page</title>
<%@include file="components/head.jsp" %>
</head>
<body style="max-width: 1920px;">
	
		<div style="width: 100%; margin: auto !important;">
			<%@include file="components/header.jsp" %>
			<div class="card w-50 mx-auto my-5" style="margin-top: 100px !important;" >
				<div class="card-header text-center">
					User Login
				</div>
				<div class="card-body">
					<form action="user-login" method="post">
					
						<div class="form-group">
							<label>Email:</label>
							<input type="email" class="form-control" name="login-Email" placeholder="Enter your Email" required/>
						</div>
						<div class="form-group">
							<label>Password:</label>
							<input type="password" class="form-control" name="login-Password" placeholder="Enter your Password" required/>
						</div>
						<div class="text-center d-flex justify-content-center">
							<button class="btn btn-primary mr-3" type="submit">Login</button>
							<a class="btn btn-secondary" href="register.jsp">Register Now</a>
							
						</div>
					
					</form>
				</div>
			</div>
		</div>
	
	
	
	<div style="margin-top: 300px;">
		<%@include file="components/footer.jsp" %>	
	</div>
</body>
</html>