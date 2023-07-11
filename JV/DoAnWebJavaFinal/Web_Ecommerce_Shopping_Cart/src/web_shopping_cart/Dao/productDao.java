package web_shopping_cart.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import web_shopping_cart.connect.dataBaseConn;
import web_shopping_cart.model.*;

public class productDao {
	private static Connection conn;
	private static String query;
	private static PreparedStatement pst;
	private static ResultSet rs;
	public productDao(Connection conn) {
		this.conn = conn;
	}
	
	// Load toan` bo san pham len trang index
	public static List<Product> getAllProducts(String query){
		List<Product> products = new ArrayList<Product>();
		
		try {
			//query = "select * from products";
			pst = conn.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				
				Product row = new Product();
				
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;		
	}
	
	public static List<Product> productById(String id){
		query="select * from products where id='" + id + "'";
		List<Product> proId = getAllProducts(query);
		return proId;
	}
	
	// load san pham da chon vao gio hang
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		try {
			if(cartList.size()>0) {
				for(Cart item: cartList) {
					query= "select * from products where id=?";
					pst = this.conn.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setImage(rs.getString("image"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return products;
	}
	
	public Product getSingleProduct(int id) {
		Product row = null;
		try {
			
			query="select * from products where id=?";
			pst = this.conn.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query= "select price from products where id=?";
					pst = this.conn.prepareStatement(query);
					pst .setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum += rs.getDouble("price") * item.getQuantity();
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
	
	public static void addProductAdmin(Product p) {
		try(Connection conn = dataBaseConn.getConnection()){
			
			query="insert into products(id, name, category, price, image, description) values (?,?,?,?,?,?)";
			pst = conn.prepareStatement(query);
			pst.setInt(1, p.getId());
			pst.setString(2, p.getName());
			pst.setString(3, p.getCategory());
			pst.setDouble(4, p.getPrice());
			pst.setString(5, p.getImage());
			pst.setString(6, p.getDescription());
			pst.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void removeProductAdmin(String id) throws SQLException {
		query="delete from products where id=?";
		try(Connection conn = dataBaseConn.getConnection()){
			pst = conn.prepareStatement(query);
			pst.setString(1, id);
			pst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void updateProductAdmin(Product p) throws SQLException {
		query="update products set name=?, category=?, price=?, image=?, description=? where id=?";
		
		try(Connection conn = dataBaseConn.getConnection()) {
			pst = conn.prepareStatement(query);
			
			pst.setString(1, p.getName());
			pst.setString(2, p.getCategory());
			pst.setDouble(3, p.getPrice());
			pst.setString(4, p.getImage());
			pst.setString(5, p.getDescription());
			pst.setInt(6, p.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
