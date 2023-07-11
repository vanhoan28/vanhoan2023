package web_shopping_cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.userDao;
import web_shopping_cart.connect.dataBaseConn;
import web_shopping_cart.model.User;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/user-login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			 try(PrintWriter out = response.getWriter()){
				 String email = request.getParameter("login-Email");
				 String password = request.getParameter("login-Password");
				 
				  try {
					userDao userdao = new userDao(dataBaseConn.getConnection());
					User user = userdao.userLogin(email, password);
					
					if(user != null && user.getPhanQuyen() == 0) {
						request.getSession().setAttribute("auth", user);
						response.sendRedirect("index.jsp");
					}else if(user != null && user.getPhanQuyen() == 1) {
						request.getSession().setAttribute("auth", user);
						response.sendRedirect("admin-index.jsp");
					}else {
						out.println("<h3>user login failed</h3>");
					}
					
				} catch (Exception e) {
					
					e.printStackTrace();	
				}
				 
			 }
	}

}
