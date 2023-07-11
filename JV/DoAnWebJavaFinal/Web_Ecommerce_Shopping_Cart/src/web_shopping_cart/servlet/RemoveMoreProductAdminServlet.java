package web_shopping_cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.productDao;

/**
 * Servlet implementation class RemoveMoreProductAdminServlet
 */
@WebServlet("/Remove-More-Product-Admin")
public class RemoveMoreProductAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String removeMore[] = request.getParameterValues("RemoveCheck");
		for(String remove : removeMore) {
			try {
				productDao.removeProductAdmin(remove);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		response.sendRedirect("Admin-Index");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
