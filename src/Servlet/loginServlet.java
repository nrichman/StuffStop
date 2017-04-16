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

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String url = "jdbc:mysql://ec2-52-10-150-59.us-west-2.compute.amazonaws.com:3306/myDB";
	static String user = "newremoteuser";
	static String password = "password";
	static Connection connection = null;

	public loginServlet() {
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
			response.getWriter().println("Connection Failed! Check output console");
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
		}
		if (connection != null) {
			response.getWriter().println("You made it, take control your database now!<br>");
		} else {
			System.out.println("Failed to make connection!");
		}

		response.getWriter().println("Made it to Servlet 5!");

		String id = request.getParameter("loginName");
		String pass = request.getParameter("pass");
		/*
		 * response.getWriter().append("ID: " + id + "<br>"); String firstname =
		 * request.getParameter("firstname");
		 * response.getWriter().append("First Name: " + firstname + "<br>");
		 * String lastname = request.getParameter("lastname");
		 * response.getWriter().append("Last Name: " + lastname + "<br>");
		 * String email = request.getParameter("email");
		 * response.getWriter().append("Email: " + email + "<br>");
		 * 
		 * response.getWriter().append("Pass: " + pass + "<br>");
		 * 
		 * int itemQuantity = Integer.parseInt(Quantity);
		 */

		try {

			/*
			 * String insertSQL =
			 * "INSERT INTO user (username,firstname,lastname,email, pass) VALUES ('"
			 * +id+"','"+firstname+"', '"+lastname+"','"+email+"', '"+pass+"') "
			 * ;
			 * 
			 * PreparedStatement preparedStatement =
			 * connection.prepareStatement(insertSQL);
			 * preparedStatement.execute();
			 */

			String selectSQL = "SELECT * FROM user where username='" + id + "' ";

			PreparedStatement preparedStatement2 = connection.prepareStatement(selectSQL);
			// preparedStatement2.execute();

			ResultSet rs = preparedStatement2.executeQuery();
			/*
			 * while (rs.next()) { String id = rs.getString("ID"); String
			 * username = rs.getString("MYUSER"); String email =
			 * rs.getString("EMAIL"); String phone = rs.getString("PHONE");
			 * response.getWriter().append("USER ID: " + id + ", ");
			 * response.getWriter().append("USER NAME: " + username + ", ");
			 * response.getWriter().append("USER EMAIL: " + email + ", ");
			 * response.getWriter().append("USER PHONE: " + phone + "<br>"); }
			 */

			request.setAttribute("resultSet", rs);
			request.setAttribute("enteredPass", pass);

			request.getRequestDispatcher("index.jsp").forward(request, response);
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