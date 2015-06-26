package cn.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.domain.Product;
import cn.service.ProductService;

public class findAllServlet extends HttpServlet {

	private ProductService productService = new ProductService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlCommand = "";
		
		String Level = request.getParameter("a");
		String input=request.getParameter("c");
		String capacity1=request.getParameter("d");
		String capacity2=request.getParameter("e");
		String current1=request.getParameter("f");
		String current2=request.getParameter("g");
		String motorpower1=request.getParameter("h");
		String motorpower2=request.getParameter("i");
		String weight1=request.getParameter("j");
		String weight2=request.getParameter("k");
		
		sqlCommand += "select * from productname where ";
		
		//Level
		if(!Level.equals("0")) sqlCommand += "c_id = " + Level + " and ";
		//input
		if(input.equals("1")) sqlCommand += "p_input <= 6.0 and ";
		if(input.equals("2")) sqlCommand += "p_input >= 6.0 and ";
		
		//Capacity
		
		sqlCommand += "(p_capacity between " + capacity1 + " and " + capacity2 + ") and ";
		//Current
		sqlCommand += "(p_current between " + current1 + " and " + current2 + ") and ";
		//motorpower
		sqlCommand += "(p_motorpower between " + motorpower1 + " and " + motorpower2 + ") and ";
		//weight
		sqlCommand += "(p_weight between " + weight1 + " and " + weight2 + ") ";
		
		if(sqlCommand.equals("select * from productname where "))sqlCommand="select * from productname";
		
		List<Product> productList=productService.find(sqlCommand);
		
		request.setAttribute("log", sqlCommand);
		request.setAttribute("productList", productList);
		
		request.getRequestDispatcher("/query.jsp").forward(request, response);
	}

}





