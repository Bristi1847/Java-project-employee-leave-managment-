<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("role")==null || 
   !session.getAttribute("role").equals("admin")){
    response.sendRedirect("login.jsp");
}

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/leave_db","root","Root@123");

    ps = con.prepareStatement(
    "SELECT * FROM leave_requests WHERE status=?");

    ps.setString(1, "Pending");

    rs = ps.executeQuery();

}catch(Exception e){
    out.println("<h3 style='color:red'>Error: "+e.getMessage()+"</h3>");
}
%>

<html>
<head>
<title>Pending Leave Requests</title>

<style>
body{
    font-family: Arial;
    background:#f4f6f9;
}
.container{
    width:90%;
    margin:40px auto;
}
table{
    width:100%;
    border-collapse:collapse;
    background:white;
}
th{
    background:#2c3e50;
    color:white;
    padding:10px;
}
td{
    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;
}
tr:hover{
    background:#f1f1f1;
}
.btn{
    padding:6px 10px;
    text-decoration:none;
    color:white;
    border-radius:4px;
}
.approve{ background:#27ae60; }
.reject{ background:#c0392b; }
</style>

</head>

<body>

<div class="container">

<h2>Pending Leave Requests</h2>

<table>
<tr>
<th>ID</th>
<th>Employee ID</th>
<th>Leave Type</th>
<th>From</th>
<th>To</th>
<th>Days</th>
<th>Reason</th>
<th>Action</th>
</tr>

<%
if(rs != null){
while(rs.next()){
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getInt("employee_id") %></td>
<td><%= rs.getString("leave_type") %></td>
<td><%= rs.getDate("from_date") %></td>
<td><%= rs.getDate("to_date") %></td>
<td><%= rs.getInt("days") %></td>
<td><%= rs.getString("reason") %></td>
<td>
<a class="btn approve"
href="updateStatus.jsp?id=<%= rs.getInt("id") %>&status=Approved">
Approve</a>

<a class="btn reject"
href="updateStatus.jsp?id=<%= rs.getInt("id") %>&status=Rejected">
Reject</a>
</td>
</tr>

<%
}
}
%>

</table>

<br>
<a href="admin_dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>