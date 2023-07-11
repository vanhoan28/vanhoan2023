<%@page import="java.util.*"%>
<%@page import="web_shopping_cart.connect.dataBaseConn"%>
<%@page import="web_shopping_cart.Dao.productDao"%>
<%@page import="java.util.List"%>
<%@page import="web_shopping_cart.model.*"%>
    <%
    	User auth = (User) request.getSession().getAttribute("auth");
    	if(auth != null){
    		request.setAttribute("auth",auth);
    	}
    	String query="select * from products";
    	productDao prodd = new productDao(dataBaseConn.getConnection());
		List<Product> products = prodd.getAllProducts(query);
		
		
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    	if(cart_list != null){
    		request.setAttribute("cart_list",cart_list);
    	}
    %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  


  
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@include file="components/head.jsp" %>
</head>
<body style="max-width: 1920px;">
<div style="width: 100%; margin: auto;">
	<div >
		<%@include file="components/header.jsp" %>	
	</div>
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product p:products){%>
				<div class="col-lg-3 col-md-6 col-sm-12 my-3">
					<div class="card h-100 text-center p-4" style="width: 18rem;">
					  <img src="<%= p.getImage() %>" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title"><%= p.getName() %></h5>
					    <h6 class="price">Price: $<%= p.getPrice() %></h6>
					    <h6 class="category">Category: <%= p.getCategory() %></h6>
					    <p class="description mr-3"><%= p.getDescription() %></p>
					    <div class="mt-3 d-flex justify-content-between">
					    	<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
					    	<a href="SelectByIdDetail?id=<%= p.getId() %>" class="btn btn-dark">Detail</a>			    	
					    </div>
					  </div>
					</div>
				</div> 
				<%}
			}
		%>
			  
		</div>
	</div>
		
	
	<%@include file="components/footer.jsp" %>
</div>
</body>
</html>