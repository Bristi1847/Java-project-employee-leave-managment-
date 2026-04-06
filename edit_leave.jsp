<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM leave_requests WHERE id=?");

ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<html>
<body>

<h2>Edit Leave</h2>

<form action="update_leave.jsp" method="post">

<input type="hidden" name="id" value="<%= id %>">

Type: <input name="type" value="<%= rs.getString("leave_type") %>"><br>

From: <input type="date" name="from" value="<%= rs.getDate("from_date") %>"><br>

To: <input type="date" name="to" value="<%= rs.getDate("to_date") %>"><br>

Reason: <input name="reason" value="<%= rs.getString("reason") %>"><br>

<button>Update</button>

</form>

</body>
</html>
<a href="employee_dashboard.jsp" class="back-btn"></a>