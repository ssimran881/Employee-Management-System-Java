

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/saveEmployee")
public class saveEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String dept = request.getParameter("dept");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems_db", "root", "");
            
            // Query for your 'employees' table
            PreparedStatement ps = con.prepareStatement("insert into employees(name, email, mobile, department) values(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, dept);
            
            ps.executeUpdate();
            response.sendRedirect("index.jsp"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}