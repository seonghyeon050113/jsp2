package DBcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class  DBcon {
	private static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/ezen";
	public static Connection getDBcon() throws SQLException{
		try {
			Class.forName(DRIVER_NAME);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			return DriverManager.getConnection(URL,"root","r1r2r3");
		}
	}

