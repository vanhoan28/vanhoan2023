package web_shopping_cart.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import web_shopping_cart.model.*;

public class orderDao {
	
	private Connection conn;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	 
	public orderDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean insertOrder(Order model) {
		
		boolean result = false;
		
		try {
			
			query="insert into orders (p_id, u_id, o_quantity, o_date) values(?, ?, ?, ?)";
			pst = this.conn.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			pst.executeUpdate();
			result = true;
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}
	
	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList<>();
			
			try {
				
				query="select * from orders where u_id=? order by orders.o_id desc";
				pst = this.conn.prepareStatement(query);
				pst.setInt(1, id);
				rs = pst.executeQuery();
				
				while(rs.next()) {
					Order order = new Order();
					productDao productD = new productDao(this.conn);
					int pId = rs.getInt("p_id");
					
					Product product = productD.getSingleProduct(pId);
					order.setOrderid(rs.getInt("o_id"));
					order.setName(product.getName());
					order.setCategory(product.getCategory());
					order.setPrice(product.getPrice() * rs.getInt("o_quantity"));
					order.setQuantity(rs.getInt("o_quantity"));
					order.setDate(rs.getString("o_date"));
					list.add(order);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	public void cancelOrder(int id) {
		try {
			query="delete from orders where o_id=?";
			pst = this.conn.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
