<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Management Dashboard</title>
<style>
    body { font-family: Arial; display: flex; margin: 0; }
    .sidebar { width: 200px; background: #2c3e50; color: white; height: 100vh; padding: 20px; position: fixed; }
    .sidebar a { color: white; text-decoration: none; display: block; padding: 10px 0; border-bottom: 1px solid #34495e; }
    .main-content { margin-left: 240px; padding: 20px; width: 100%; }
    .form-box { background: #f4f4f4; padding: 20px; border-radius: 8px; max-width: 400px; }
    input, select { width: 100%; padding: 8px; margin: 10px 0; }
    .btn { background: #27ae60; color: white; border: none; padding: 10px; cursor: pointer; }
</style>
</head>
<body>

<div class="sidebar">
    <h3>EMS Dashboard</h3>
    <a href="#">Home</a>
    <a href="viewServlet">View Employees</a>
    <a href="#">Settings</a>
</div>

<div class="main-content">
    <h2>Add New Employee</h2>
    <div class="form-box">
        <form action="saveEmployee" method="post">
            Name: <input type="text" name="name" required>
            
            Email: <input type="email" name="email" required placeholder="example@mail.com">
            
            Mobile: <input type="text" name="mobile" pattern="[0-9]{10}" title="Please enter 10 digits" required>
            
            Department:
            <select name="dept">
                <option>IT</option>
                <option>HR</option>
                <option>Support</option>
            </select>
            
            <button type="submit" class="btn">Register Employee</button>
        </form>
    </div>
</div>

</body>
</html>