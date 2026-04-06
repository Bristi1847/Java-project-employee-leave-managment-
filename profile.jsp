<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>My Profile</title>
<style>
body { font-family: 'Segoe UI'; background:#eef2f7; }
.container {
    width: 400px;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
}
button {
    padding: 8px 15px;
    background:#1f3c88;
    color:white;
    border:none;
    border-radius:5px;
}
</style>
</head>
<body>

<%
Integer employeeId = (Integer) session.getAttribute("employee_id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM employees WHERE id=?");
ps.setInt(1, employeeId);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<div class="container">
    <h2>My Profile</h2>
    <p><b>Name:</b> <%= rs.getString("name") %></p>
    <p><b>Email:</b> <%= rs.getString("email") %></p>
    <p><b>Role:</b> <%= rs.getString("role") %></p>

    <a href="edit_profile.jsp">
        <button>Edit Profile</button>
    </a>
</div>

</body>
</html>
<a href="employee_dashboard.jsp" class="back-btn"></a>