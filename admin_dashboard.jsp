<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")){
    response.sendRedirect("login.jsp");
    return;
}
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background: #1f3c88;
            color: white;
            position: fixed;
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background: #163172;
        }

        .main {
            margin-left: 250px;
            padding: 30px;
        }

        .cards {
            display: flex;
            gap: 20px;
        }

        .card {
            flex: 1;
            padding: 25px;
            border-radius: 10px;
            color: white;
            text-align: center;
            font-size: 18px;
        }

        .blue { background: #3498db; }
        .green { background: #27ae60; }
        .orange { background: #e67e22; }
        .red { background: #e74c3c; }

        .card h1 {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

Statement stmt = con.createStatement();

ResultSet empRS = stmt.executeQuery("SELECT COUNT(*) FROM employees");
empRS.next();
int totalEmployees = empRS.getInt(1);

ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM leave_requests WHERE status='Approved'");
rs1.next();
int approved = rs1.getInt(1);

ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM leave_requests WHERE status='Pending'");
rs2.next();
int pending = rs2.getInt(1);

ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM leave_requests WHERE status='Rejected'");
rs3.next();
int rejected = rs3.getInt(1);

con.close();
%>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="admin_dashboard.jsp">Dashboard</a>
    <a href="manage_employees.jsp">Manage Employees</a>
    <a href="pending_leaves.jsp">Approve Leave</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="main">
    <h1>Admin Dashboard</h1>

    <div class="cards">
        <div class="card blue">
            Total Employees
            <h1><%= totalEmployees %></h1>
        </div>

        <div class="card green">
            Approved Leaves
            <h1><%= approved %></h1>
        </div>

        <div class="card orange">
            Pending Requests
            <h1><%= pending %></h1>
        </div>

        <div class="card red">
            Rejected Leaves
            <h1><%= rejected %></h1>
        </div>
    </div>
</div>

</body>
</html>