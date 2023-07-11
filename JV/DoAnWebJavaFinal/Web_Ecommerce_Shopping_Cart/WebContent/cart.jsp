<%@page import="java.text.DecimalFormat"%>
<%@page import="web_shopping_cart.connect.dataBaseConn"%>
<%@page import="web_shopping_cart.Dao.productDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="web_shopping_cart.model.*"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);	
%>
    <%
    	User auth = (User) request.getSession().getAttribute("auth");
    	if(auth != null){
    		request.setAttribute("auth",auth);
    	}
    	
    	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    	List<Cart> cartProduct = null;
    	if(cart_list != null){
    		productDao pDao = new productDao(dataBaseConn.getConnection());
    		cartProduct = pDao.getCartProducts(cart_list);
    		double total = pDao.getTotalCartPrice(cart_list);
    		
    		request.setAttribute("cart_list", cart_list);
       		request.setAttribute("total",total);

    	}
    %>
<!DOCTYPE html>
<html>	
<head>
<title>Cart page</title>
<%@include file="components/head.jsp" %>
<style type="text/css">
	.table tbody td{
		vartical-align: middle;
	}
	.btn-incre, .btn-decre{
		box-shadow: none;
		font-size: 25px;
	}
</style>
</head>
<body style="max-width: 1920px;">
	<div style="width: 100%; margin: auto !important;">
		<%@include file="components/header.jsp" %>
	</div>
	
	<div class="container">
		<div class="d-flex py-3">
			<h3>Total price: $ ${(total>0)?dcf.format(total):0 }</h3>
			<a class="btn mx-3 btn-primary" href="Check-Out">Check Out</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<% if(cart_list != null){
				for(Cart c:cartProduct){%>
					<tr>
						<td><img src="<%= c.getImage() %>" width="50px"/></td>
						<td><%= c.getName() %></td>
						<td><%= c.getCategory() %></td>
						<td>$<%= dcf.format(c.getPrice()) %></td>
						<td>
							<form action="Order-Now" method="post" class="form-inline">
								<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input"/>
								<div class="form-group d-flex justify-content-between">
									<a class="btn btn-sm btn-incre" href="Inc-Dec?action=inc&id=<%= c.getId()%>">
										<i class="fas fa-plus-square"></i>
									</a>
									<input type="text" name="quantity" class="form-control" value="<%= c.getQuantity()%>" readonly/>
									<a class="btn btn-sm btn-incre" href="Inc-Dec?action=dec&id=<%= c.getId()%>">
										<i class="fas fa-minus-square"></i>
									</a>
								</div>
								<button type="submit" class="btn btn-dark btn-md">Buy Now</button>
							</form>
						</td>
						<td>
							<a class="btn btn-sm btn-danger" href="Remove-Item?id=<%= c.getId() %>">Remove</a>
						</td>
						
					</tr>
				<%}			
			}
			%>
				
			</tbody>
		</table>
	</div>
	<div style="margin-top: 600px;">
		<%@include file="components/footer.jsp" %>	
	</div>
</body>
</html>