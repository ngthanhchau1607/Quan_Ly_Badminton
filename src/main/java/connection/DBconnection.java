package connection;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBconnection {
	public Connection getConnection() throws Exception{
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://ADMIN:1433;databaseName=QuanLyBadminton;encrypt=false";
        String userName = "sa";
        String password = "123456";
        Connection conn = DriverManager.getConnection(url, userName, password);
		return conn;
	}
    public static void main(String[] args) {
        try {
        	System.out.println(new DBconnection().getConnection());
            System.out.println("Ket noi thanh cong");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
