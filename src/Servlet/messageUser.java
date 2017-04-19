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

@WebServlet("/messageUser")
public class messageUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String url = "jdbc:mysql://ec2-52-10-150-59.us-west-2.compute.amazonaws.com:3306/myDB";
	static String user = "newremoteuser";
	static String password = "password";
	static Connection connection = null;

	public messageUser() {
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

		String toUser = request.getParameter("toUser");
		String fromUser = request.getParameter("fromUser");
		String message = request.getParameter("message");
		try {
			String insertSQL = "INSERT INTO MESSAGE (toUser,fromUser,message) VALUES (\"" + toUser + "\",\"" + fromUser + "\",\"" + message + "\")";
			System.out.println(insertSQL);
			PreparedStatement preparedStatement1 = connection.prepareStatement(insertSQL);
			preparedStatement1.execute();
			
			request.setAttribute("toUser",toUser);
			request.setAttribute("fromUser", fromUser);
			request.getRequestDispatcher("/WEB-INF/addedMessage.jsp").forward(request, response);
			
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
