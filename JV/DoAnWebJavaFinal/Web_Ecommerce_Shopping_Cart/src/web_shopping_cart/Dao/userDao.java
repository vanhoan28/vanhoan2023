package web_shopping_cart.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import web_shopping_cart.connect.dataBaseConn;
import web_shopping_cart.model.User;

public class userDao {
	private Connection conn;
	private static String query;
	private static PreparedStatement pst;
	private ResultSet rs;
	public userDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
		
		try{
			query = "select * from users where email=? and password=?";
			pst = this.conn.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhanQuyen(rs.getInt("phanquyen"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return user;
	}
	
	
	public User checkAccountExist(String email) {
		User user = null;
		
		try{
			query = "select * from users where email=?";
			pst = this.conn.prepareStatement(query);
			pst.setString(1, email);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User(); 
				user.setEmail(rs.getString("email"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return user;
	}
	
	
	
	
	public static void userRegister(User u) {		
		try(Connection conn = dataBaseConn.getConnection()) {	
			
			query="insert into users( name, email, password, phanquyen) values (?, ?, ?, ?)";
			pst = conn.prepareStatement(query);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getPassword());
			pst.setInt(4, u.getPhanQuyen());
			pst.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
