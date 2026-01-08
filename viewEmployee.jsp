<%@ page import="java.sql.*" %>
<html>
<head>
    <title>View Employees</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid black; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .edit-btn { color: blue; }
        .delete-btn { color: red; }
    </style>
</head>
<body>
    <h2>Employee List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Department</th>
            <th>Actions</th>
        </tr>
        <%
            // Servlet se bheja gaya data pakadna
            ResultSet rs = (ResultSet) request.getAttribute("employeeList");
            if(rs != null) {
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("department") %></td>
            <td>
                <a href="updateEmployee.jsp?id=<%= rs.getInt("id") %>" class="edit-btn">Update</a> | 
                <a href="deleteServlet?id=<%= rs.getInt("id") %>" class="delete-btn" onclick="return confirm('Pakka delete karna hai?')">Delete</a>
            </td>
        </tr>
        <% 
                }
            } 
        %>
    </table>
    <br>
    <a href="index.jsp">Add New Employee</a>
</body>
</html>