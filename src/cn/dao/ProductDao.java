package cn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.domain.Product;

public class ProductDao {
	private QueryRunner qr= new QueryRunner();
	
	public List<Product> find(String sqlCommand) throws SQLException, ClassNotFoundException{
		String sql=sqlCommand;
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=product";
		String username="sa";
		String password="huangping1993327";
		Connection con=null;
		
		Class.forName(driverName);
		con=DriverManager.getConnection(dbURL, username, password);
		
		List<Product> list=qr.query(con,sql, new BeanListHandler<Product>(Product.class));
		
		return list;
		
	}
	
}
