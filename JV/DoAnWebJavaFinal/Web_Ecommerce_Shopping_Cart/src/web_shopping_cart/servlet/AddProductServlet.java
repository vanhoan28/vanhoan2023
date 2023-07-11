package web_shopping_cart.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_shopping_cart.Dao.productDao;
import web_shopping_cart.model.Product;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet(urlPatterns ="/Add-Product")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AddProductServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("Add") != null) {
			int id = Integer.parseInt(request.getParameter("p_id"));
			String name = request.getParameter("p_name");
			String category = request.getParameter("p_category");
			Double price = Double.parseDouble(request.getParameter("p_price"));
			String image = request.getParameter("p_image");
			String description = request.getParameter("p_description");
			
			Product product = new Product();
			product.setId(id);
			product.setName(name);
			product.setCategory(category);
			product.setPrice(price);
			product.setImage(image);
			product.setDescription(description);
			productDao.addProductAdmin(product);
			
		}
		request.getRequestDispatcher("Admin-Index").forward(request, response);
		//response.sendRedirect("Admin-Index");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

}
