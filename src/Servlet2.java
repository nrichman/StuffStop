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

@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
    private static final long        serialVersionUID    = 1L;
    static String            url        = "jdbc:mysql://cmkoesters.ddns.net:3306/myDB";
    static String            user        = "newremoteuser";
    static String            password        = "password";
    static Connection            connection    = null;

    public Servlet2() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        
        response.getWriter().println("Made it to Servlet 2!");
        
        String itemNumber = request.getParameter("number");
        response.getWriter().append("number: " + itemNumber + "<br>");
        String itemName = request.getParameter("name");
        response.getWriter().append("Name: " + itemName + "<br>");
        String itemDistributor = request.getParameter("dist");
        response.getWriter().append("Distributor: " + itemDistributor + "<br>");
        String itemDescription = request.getParameter("desc");
        response.getWriter().append("Description: " + itemDescription + "<br>");
        String Quantity = request.getParameter("quantity");
        response.getWriter().append("Quantity: " + Quantity + "<br>");
        int itemQuantity = Integer.parseInt(Quantity);
        

        
         
        try {
            String insertSQL = "INSERT INTO inventory (NUMBER,NAME,DISTRIBUTOR,DESCRIPTION,QUANTITY) VALUES ('"+itemNumber+"','"+itemName+"', '"+itemDistributor+"','"+itemDescription+"', '"+itemQuantity+"') ";
            
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.execute();
            
            String selectSQL = "SELECT * FROM inventory";
            
            PreparedStatement preparedStatement2 = connection.prepareStatement(selectSQL);
            // preparedStatement2.execute();
            
            ResultSet rs = preparedStatement2.executeQuery();
            /*
            while (rs.next()) {
                String id = rs.getString("ID");
                String username = rs.getString("MYUSER");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                response.getWriter().append("USER ID: " + id + ", ");
                response.getWriter().append("USER NAME: " + username + ", ");
                response.getWriter().append("USER EMAIL: " + email + ", ");
                response.getWriter().append("USER PHONE: " + phone + "<br>");
            }
            */
            String message = "New Entry Added";
            request.setAttribute("message", message);
            request.setAttribute("resultSet", rs);
            
            request.getRequestDispatcher("/WEB-INF/Page1.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().append("SQL Exception!");

        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
