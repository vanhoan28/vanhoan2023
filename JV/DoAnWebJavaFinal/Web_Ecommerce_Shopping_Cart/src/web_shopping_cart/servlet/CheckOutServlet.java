package web_shopping_cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.orderDao;
import web_shopping_cart.connect.dataBaseConn;
import web_shopping_cart.model.*;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/Check-Out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");			
			Date date;
			date = new Date();
			
			//Lay lai list data o trang cart
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			//Xac thuc nguoi dung
			User auth = (User) request.getSession().getAttribute("auth");
			//kiem tra xac thuc va list gio hang
			if(cart_list != null && auth != null) {
				
				
				for(Cart c:cart_list) {
					//tao oject cho order
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					// them oject vao database
					orderDao orderD = new orderDao(dataBaseConn.getConnection());
					//goi phuong thuc insert trong orderDao
					boolean result = orderD.insertOrder(order);
					if(!result) break;
				}
				
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
			}else {
				if(auth == null) response.sendRedirect("login.jsp");
				response.sendRedirect("cart.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
