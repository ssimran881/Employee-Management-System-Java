

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/viewServlet")
public class viewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems_db", "root", "");
            
            // Database se saara data nikalne ki query
            PreparedStatement ps = con.prepareStatement("select * from employees");
            ResultSet rs = ps.executeQuery();
            
            // Data ko JSP par bhej rahe hain
            request.setAttribute("employeeList", rs);
            request.getRequestDispatcher("viewEmployee.jsp").forward(request, response);
            
        } catch (Exception e) {
            out.print(e);
        }
    }
}