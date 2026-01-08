

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL se employee ki ID nikalna
        String id = request.getParameter("id");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems_db", "root", "");
            
            // Delete query
            PreparedStatement ps = con.prepareStatement("delete from employees where id=?");
            ps.setString(1, id);
            ps.executeUpdate();
            
            // Delete hone ke baad wapas list par bhejna
            response.sendRedirect("viewServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}