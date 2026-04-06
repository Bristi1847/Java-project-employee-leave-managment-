<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("role")==null){
    response.sendRedirect("login.jsp");
    return;
}

int empId = (int)session.getAttribute("employee_id");

String search = request.getParameter("search");
String status = request.getParameter("status");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

String query = "SELECT * FROM leave_requests WHERE employee_id=?";
if(search!=null && !search.equals("")){
    query += " AND (leave_type LIKE ? OR reason LIKE ?)";
}
if(status!=null && !status.equals("")){
    query += " AND status=?";
}

PreparedStatement ps = con.prepareStatement(query);

int i=1;
ps.setInt(i++, empId);

if(search!=null && !search.equals("")){
    ps.setString(i++, "%"+search+"%");
    ps.setString(i++, "%"+search+"%");
}
if(status!=null && !status.equals("")){
    ps.setString(i++, status);
}

ResultSet rs = ps.executeQuery();
%>

<html>
<head>
<style>
body{font-family:Arial;background:#f4f6f9;}
table{width:90%;margin:auto;border-collapse:collapse;background:white;}
th{background:#2c3e50;color:white;padding:10px;}
td{padding:10px;text-align:center;border-bottom:1px solid #ddd;}
.delete{background:red;color:white;padding:5px;border-radius:5px;text-decoration:none;}
.filter{width:90%;margin:auto;text-align:center;margin-bottom:15px;}
</style>
</head>

<body>

<h2 style="text-align:center;">My Leave Status</h2>

<form class="filter">
<input type="text" name="search" placeholder="Search">
<select name="status">
<option value="">All</option>
<option>Pending</option>
<option>Approved</option>
<option>Rejected</option>
</select>
<button>Filter</button>
</form>

<table>

<tr>
<th>ID</th>
<th>Type</th>
<th>From</th>
<th>To</th>
<th>Days</th>
<th>Reason</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
while(rs.next()){
String st = rs.getString("status");
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("leave_type") %></td>
<td><%= rs.getDate("from_date") %></td>
<td><%= rs.getDate("to_date") %></td>
<td><%= rs.getInt("days") %></td>
<td><%= rs.getString("reason") %></td>
<td><%= st %></td>

<td>
<% if(st.equals("Pending")) { %>
<a class="delete"
href="delete_leave.jsp?id=<%= rs.getInt("id") %>"
onclick="return confirm('Delete?')">Delete</a>
<% } else { %>
-
<% } %>
</td>

</tr>

<%
}
%>

</table>

</body>
</html>
<a href="employee_dashboard.jsp" class="back-btn"></a>