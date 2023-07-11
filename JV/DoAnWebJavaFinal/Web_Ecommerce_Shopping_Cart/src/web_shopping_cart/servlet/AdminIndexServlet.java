package web_shopping_cart.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.productDao;
import web_shopping_cart.model.Product;

/**
 * Servlet implementation class AdminIndexServlet
 */
@WebServlet(urlPatterns ="/Admin-Index")
public class AdminIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query="select * from products";
		List<Product> products = productDao.getAllProducts(query);
		request.setAttribute("products", products);
		request.getRequestDispatcher("admin-index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
