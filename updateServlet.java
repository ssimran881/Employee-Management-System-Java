

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Form se data nikalna
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String dept = request.getParameter("department");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems_db", "root", "");
            
            // Update query chalana
            String query = "update employees set name=?, email=?, mobile=?, department=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, dept);
            ps.setString(5, id);
            
            ps.executeUpdate();
            
            // Update hone ke baad wapas list page par bhejna
            response.sendRedirect("viewServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}