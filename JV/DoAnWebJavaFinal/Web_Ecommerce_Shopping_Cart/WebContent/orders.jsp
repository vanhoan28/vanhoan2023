<%@page import="web_shopping_cart.connect.dataBaseConn"%>
<%@page import="web_shopping_cart.Dao.orderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="web_shopping_cart.model.*"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);	
%>
    <%
    	List<Order> orders = null;
    	User auth = (User) request.getSession().getAttribute("auth");
    	if(auth != null){
    		request.setAttribute("auth",auth);
    		orders = new orderDao(dataBaseConn.getConnection()).userOrders(auth.getId());
    		
    	}else{
    		response.sendRedirect("login.jsp");
    	}
    	
    	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    	if(cart_list != null){
    		request.setAttribute("cart_list",cart_list);
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<title>Order page</title>
<%@include file="components/head.jsp" %>
</head>
<body style="max-width: 1920px;">
	<div style="width: 100%; margin: auto !important;">
		<%@include file="components/header.jsp" %>
	</div>
	
	<div class="container">
		<div class="card-header my-3">
			All Orders
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
					if(orders != null){
						for(Order o:orders){%>
						<tr>
							<td><%= o.getDate() %></td>
							<td><%= o.getName() %></td>
							<td><%= o.getCategory() %></td>
							<td><%= o.getQuantity() %></td>
							<td><%= dcf.format(o.getPrice())  %></td>
							<td><a class="btn btn-sm btn-danger" href="cancel-Order?id=<%= o.getOrderid() %>">Cancel</a></td>
						</tr>
						<%}
					}					
					%>
			</tbody>
		</table>
	</div>
	
	<div style="margin-top: 700px;">
		<%@include file="components/footer.jsp" %>	
	</div>
</body>
</html>