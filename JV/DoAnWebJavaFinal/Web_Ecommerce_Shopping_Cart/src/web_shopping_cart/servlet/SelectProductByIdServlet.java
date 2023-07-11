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
 * Servlet implementation class SelectProductByIdServlet
 */
@WebServlet(urlPatterns ="/SelectProductByIdServlet")
public class SelectProductByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SelectProductByIdServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		List<Product> proId = productDao.productById(id);
		request.setAttribute("proId", proId);
		request.getRequestDispatcher("update-product.jsp").forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

}
