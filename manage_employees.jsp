<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("role")==null || 
   !session.getAttribute("role").equals("admin")){
    response.sendRedirect("login.jsp");
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement("SELECT * FROM employees");
ResultSet rs = ps.executeQuery();
%>

<html>
<head>
<title>Manage Employees</title>
<style>
body { font-family: Arial; background:#f4f6f9; }
.container { width:80%; margin:auto; }
table { width:100%; border-collapse:collapse; }
th,td { padding:10px; border:1px solid #ddd; text-align:center; }
th { background:#2c3e50; color:white; }
button { padding:5px 10px; border:none; border-radius:5px; cursor:pointer; }
.add { background:#2ecc71; color:white; }
.delete { background:#e74c3c; color:white; }
</style>
</head>
<body>

<div class="container">
<h2>Manage Employees</h2>

<a href="add_employee.jsp">
<button class="add">+ Add Employee</button>
</a>

<br><br>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Role</th>
<th>Action</th>
</tr>

<%
while(rs.next()){
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("role") %></td>
<td>
<% if(!rs.getString("role").equals("admin")){ %>
<a href="delete_employee.jsp?id=<%= rs.getInt("id") %>"
onclick="return confirm('Delete this employee?')">
<button class="delete">Delete</button>
</a>
<% } %>
</td>
</tr>
<%
}
%>

</table>

<br>
<a href="admin_dashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>