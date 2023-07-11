package web_shopping_cart.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dataBaseConn {
	private static Connection connection ;
	
	public static Connection getConnection() {
		try {
			 
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/ecommerce_cart?useUnicode=true&characterEncoding=UTF-8";
			connection = DriverManager.getConnection(url, "root", "");			
		}catch(ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		return connection;
	}
}
