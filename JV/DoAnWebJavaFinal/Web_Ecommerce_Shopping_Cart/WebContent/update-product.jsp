<%@page import="web_shopping_cart.model.User"%>
<%@page import="web_shopping_cart.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="web_shopping_cart.connect.dataBaseConn"%>
<%@page import="web_shopping_cart.Dao.productDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
		User auth = (User) request.getSession().getAttribute("auth");
		if(auth != null && auth.getPhanQuyen() == 1){
			request.setAttribute("auth",auth);	
		}else{
			response.sendRedirect("login.jsp");
		}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update product</title>
<%@include file="components/head.jsp" %>
</head>
<body>
	<div class="bg-secondary text-center" style="height:75px;padding-top:10px;">
		<h1>ADMIN PANEL</h1>
	</div>

	<form action="UpdateProductServlet" method="get" >
		<div>
			<h1 style="text-align: center;">update</h1>
			<c:forEach items="${proId}" var="p">
			<table class=" table d-flex justify-content-center">
				<tr class="form-group"><td>Id <br><input class="form-control" style="width: 300px" type="text" name="id" value="${p.id}"></td></tr>
				<tr class="form-group"><td>Name<br><input class="form-control" type="text" name="name" value="${p.name}"></td></tr>
				<tr class="form-group"><td>category<br><input class="form-control" type="text" name="category" value="${p.category }"></td></tr>
				<tr class="form-group"><td>Price<br><input class="form-control" type="text" name="price" value="${p.price }"></td></tr>
				<tr class="form-group"><td>Image<br><input class="form-control" type="text" name="image" value="${p.image }"></td></tr>
				<tr class="form-group"><td>Description<br><textarea class="form-control" name="description">${p.description }</textarea></td></tr>
			</table>
			</c:forEach>
		</div>
		<div class="d-flex justify-content-center">	
			<input class="btn btn-secondary mr-3" type="submit" name="update" value="Update">
			<a class="btn btn-dark" href="Admin-Index">Show Product List</a>		
		</div>
			
	</form>
	
	<div style="margin-top: 200px;">
		<%@include file="components/footer.jsp" %>	
	</div>

</body>
</html>