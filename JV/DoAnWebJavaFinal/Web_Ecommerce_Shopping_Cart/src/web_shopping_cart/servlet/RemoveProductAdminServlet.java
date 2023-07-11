package web_shopping_cart.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.productDao;

/**
 * Servlet implementation class RemoveProductAdminServlet
 */
@WebServlet(urlPatterns ="/Remove-Product-Admin")
public class RemoveProductAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public RemoveProductAdminServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			productDao.removeProductAdmin(id);
			response.sendRedirect("Admin-Index");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
