<%@page import="web_shopping_cart.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>       
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null && auth.getPhanQuyen() == 1){
		request.setAttribute("auth",auth);	
	}else{
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add product</title>
<%@include file="components/head.jsp" %>
</head>
<body>

	<div class="bg-secondary text-center" style="height:75px;padding-top:10px;">
		<h1>ADMIN PANEL</h1>
	</div>

	<form action="Add-Product" method="get" >
		<div align="center">
			<table class=" table d-flex justify-content-center">
				<tr class="form-group"><td>Id <br><input class="form-control" style="width: 300px" type="number" name="p_id"></td></tr>
				<tr class="form-group"><td>Name <br><input class="form-control" type="text" name="p_name"></td></tr>
				<tr class="form-group"><td>Category <br><input class="form-control" type="text" name="p_category"></td></tr>
				<tr class="form-group"><td>Price <br><input class="form-control" type="number" name="p_price"></td></tr>
				<tr class="form-group"><td>Image <br><input class="form-control" type="text" name="p_image"></td></tr>
				<tr class="form-group"><td>Description <br><textarea class="form-control" name="p_description"></textarea></td></tr>
			</table>
		</div>
		<div class="d-flex justify-content-center">
			<input class=" btn btn-secondary" type="submit" name="Add" value="Add Product">
		</div>
	</form>
	
	<div style="margin-top: 100px;">
		<%@include file="components/footer.jsp" %>	
	</div>
	
</body>
</html>