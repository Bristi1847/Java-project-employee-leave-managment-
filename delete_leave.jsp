<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"DELETE FROM leave_requests WHERE id=? AND status='Pending'");

ps.setInt(1,id);
ps.executeUpdate();

response.sendRedirect("view_leave.jsp");
%>