<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
String type = request.getParameter("type");
String from = request.getParameter("from");
String to = request.getParameter("to");
String reason = request.getParameter("reason");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"UPDATE leave_requests SET leave_type=?, from_date=?, to_date=?, reason=? WHERE id=? AND status='Pending'");

ps.setString(1,type);
ps.setString(2,from);
ps.setString(3,to);
ps.setString(4,reason);
ps.setInt(5,id);

ps.executeUpdate();

response.sendRedirect("view_leave.jsp");
%>