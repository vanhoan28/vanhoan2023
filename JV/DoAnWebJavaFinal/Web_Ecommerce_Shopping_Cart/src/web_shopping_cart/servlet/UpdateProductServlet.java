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
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet(urlPatterns ="/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	if(request.getParameter("update") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		Double price = Double.parseDouble(request.getParameter("price"));
		String image = request.getParameter("image");
		String description = request.getParameter("description");
		
		Product p = new Product();
		p.setId(id);
		p.setName(name);
		p.setCategory(category);
		p.setPrice(price);
		p.setImage(image);
		p.setDescription(description);
		try {
			productDao.updateProductAdmin(p);
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
		super.doPost(request, response);
	}

}
