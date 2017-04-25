package Servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addForum")
public class addForum extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String url = "jdbc:mysql://ec2-52-10-150-59.us-west-2.compute.amazonaws.com:3306/myDB";
	static String user = "newremoteuser";
	static String password = "password";
	static Connection connection = null;

	public addForum() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("-------- MySQL JDBC Connection Testing ------------<br>");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			return;
		}
		response.getWriter().println("MySQL JDBC Driver Registered!<br>");
		connection = null;
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
		}
		if (connection != null) {
			response.getWriter().println("You made it, take control your database now!<br>");
		} else {
			System.out.println("Failed to make connection!");
		}
		String userName = request.getParameter("loginName");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String tag = request.getParameter("tag");
		String location = "notyet";
		try {
			String nextID = "SELECT MAX(ID) FROM THREAD";
			PreparedStatement preparedStatement0 = connection.prepareStatement(nextID);
			ResultSet rs0 = preparedStatement0.executeQuery();
		    rs0.next();
		    int ID = rs0.getInt(1) + 1;
		    System.out.println(ID);
			
			String insertSQL = "INSERT INTO THREAD (ID,location,user,title,description,tag) VALUES ('" + ID + "','" + location + "', '" + userName + "','" + title + "', '" + description + "', '" + tag + "') ";
			PreparedStatement preparedStatement1 = connection.prepareStatement(insertSQL);
			preparedStatement1.execute();

			request.getRequestDispatcher("/WEB-INF/addedForum.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().append("SQL Exception!");

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
