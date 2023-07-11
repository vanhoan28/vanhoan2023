package web_shopping_cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.userDao;
import web_shopping_cart.connect.dataBaseConn;
import web_shopping_cart.model.User;
import java.sql.PreparedStatement;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(urlPatterns ="/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static PreparedStatement pst;
	private static Connection conn;
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			if(request.getParameter("r_register") != null) {
			String name = request.getParameter("r_name");
			String email = request.getParameter("r_email");
			String password = request.getParameter("r_password");
			int phanquyen = Integer.parseInt(request.getParameter("r_phanquyen"));
			
			try {
				userDao dao = new userDao(dataBaseConn.getConnection());
				User check = dao.checkAccountExist(email);
				
					if(check == null) {
						User u = new User();		
						u.setName(name);
						u.setEmail(email);
						u.setPassword(password);
						u.setPhanQuyen(phanquyen);
						userDao.userRegister(u);
						
						//response.sendRedirect("");
						out.print("<h3>Register successfull.<a href='login.jsp'>click to go to login.</a></h3>");
					}else if(check != null) {
						//response.sendRedirect("register.jsp");
						out.println("<h3 style='color: dark; text-align: center'>register failed, email already exist!!!pls try another email. <a href='register.jsp'> return to Register</a></h3>");
					}
				}catch(Exception e) {
					e.printStackTrace();
					
				}			
			}
		}		
		//request.getRequestDispatcher("user-login").forward(request, response);
		//response.sendRedirect("login.jsp");
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

}
