<%@page import="java.util.*"%>
<%@page import="web_shopping_cart.connect.dataBaseConn"%>
<%@page import="web_shopping_cart.Dao.productDao"%>
<%@page import="java.util.List"%>
<%@page import="web_shopping_cart.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<%

	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null && auth.getPhanQuyen() == 1){
		request.setAttribute("auth",auth);	
	}else{
		response.sendRedirect("login.jsp");
	}
	String query="select * from products";
	productDao prodd = new productDao(dataBaseConn.getConnection());
	List<Product> products = prodd.getAllProducts(query);


%>

<%@include file="components/head.jsp" %>
</head>
<body>
	<div class="bg-secondary text-center" style="height:120px;padding-top:10px;">
		<h1>ADMIN PANEL</h1>
		<a class="btn btn-primary mr-3" style="float: right;" href="log-out">Logout</span></a>
	</div>
	
	<form action="Remove-More-Product-Admin" method="get">
		<div class="container">
			<div class="py-3 text-center">
					<h3>All Product</h3>				
			</div>
			<table class="table table-loght">		
				<thead>
					<tr>
						<th scope="col"><input class="btn btn-dark" type="submit" value="Remove Check" ></th>
						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Image</th>
						<th scope="col">Description</th>
						<th scope="col">Update</th>
						<th scope="col">Remove</th>
					</tr>
				</thead>
				<tbody>
					

<%if(!products.isEmpty()){
						for(Product p:products){%>	
							<tr>
								<td><input type="checkbox" name="RemoveCheck" value="<%=p.getId() %>"></td>
								<td><%= p.getId() %></td>
								<td><%= p.getName() %></td>
								<td><%= p.getCategory() %></td>
								<td><%= p.getPrice() %></td>
								<td><img src="<%= p.getImage() %>"style="width:50px;" alt="..."></td>
								<td><%= p.getDescription() %></td> 
								<td><a class="btn btn-sm btn-secondary" href="SelectProductByIdServlet?id=<%=p.getId()%>"> Update </a></td>
								<td><a class="btn btn-sm btn-danger" href="Remove-Product-Admin?id=<%=p.getId()%>"> Remove </a></td>
							</tr>
						<%}
					} 
					%>
				</tbody>
			</table>	
			<a class="btn btn-dark" href="add-product-admin.jsp">Add Product</a>
		</div>
	</form>
	
	<div style="margin-top: 200px;">
		<%@include file="components/footer.jsp" %>	
	</div>	
</body>
</html>