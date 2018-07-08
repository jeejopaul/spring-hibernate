package com.luv2code.testdb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		// set up DB
		String jdbcUrl = "jdbc:sqlserver://localhost:1433;user=hbstudent;password=hbstudent";

		try {
			PrintWriter out = response.getWriter();
			out.println("Connecting to databse... " + jdbcUrl);
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(jdbcUrl);
			
			out.println(" Connected ");
			
			con.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new ServletException();
	}
	}
}
