<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Edit Employee</title>
</head>
<body>
    <h2>Update Employee Details</h2>
    <%
        // URL se ID pakadna
        String id = request.getParameter("id"); 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems_db", "root", "");
            
            // Us specific ID ka data nikalna
            PreparedStatement ps = con.prepareStatement("select * from employees where id=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
    %>
    <form action="updateServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        
        Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br><br>
        Email: <input type="email" name="email" value="<%= rs.getString("email") %>"><br><br>
        Mobile: <input type="text" name="mobile" value="<%= rs.getString("mobile") %>"><br><br>
        Department: <input type="text" name="department" value="<%= rs.getString("department") %>"><br><br>
        
        <input type="submit" value="Save Changes">
    </form>
    <% 
            }
        } catch(Exception e) { out.print(e); } 
    %>
</body>
</html>