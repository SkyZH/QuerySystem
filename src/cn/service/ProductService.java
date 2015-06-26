package cn.service;

import java.sql.SQLException;
import java.util.List;

import cn.dao.ProductDao;
import cn.domain.Product;

public class ProductService {
	private ProductDao productDao = new ProductDao();
	
	public List<Product> find(String sqlCommand) {
		try {
			return productDao.find(sqlCommand);
		} catch (Exception e) {
			throw new RuntimeException(e);
			
		} 
	}
	
}

