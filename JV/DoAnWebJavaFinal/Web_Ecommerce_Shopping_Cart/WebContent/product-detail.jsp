<%@page import="web_shopping_cart.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <%
    
    User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null){
		request.setAttribute("auth",auth);
	}
    
    %>
<%@include file="components/head.jsp" %>
</head>
<body>
	<div >
		<%@include file="components/header.jsp" %>	
	</div>
	<h1 style="text-align: center;">Detail</h1>
	<div class="container d-flex justify-content-center">
		
		<div class="row mt-5" style="border-top: 1px solid black !important; margin-top: 100px !important; ">	
			<c:forEach items="${proId}" var="p">
				<div class="col-md-6" style="padding-top: 10px !important;">
					<img src="${p.image }" style="height: 400px; width: 400px;"/>
				</div>
				<div class="col-md-6" style="padding-top: 50px !important;">
					<h1>${p.name }</h1>
					<h4 class="text-uppercase text-black-50" style="color: red !important;">${p.category }</h4>
					<h3 class="display-6 fw-bold my-4">$ ${p.price }</h3>
					<p class="lead">${p.description }</p>
					<div class="mt-3 d-flex justify-content-between">
					    <a href="add-to-cart?id=${p.id }" class="btn btn-dark">Add to Cart</a>
					    <a href="Order-Now?quantity=1&id=${p.id }" class="btn btn-dark">Buy Now</a>				    	
					</div>
				</div>			
			</c:forEach>
		</div>		
	</div>
	
	<div style=" margin-top: 150px;">
		<%@include file="components/footer.jsp" %>
	</div>
</body>
</html>