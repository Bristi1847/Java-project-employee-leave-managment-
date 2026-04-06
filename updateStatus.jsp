<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("role")==null || 
   !session.getAttribute("role").equals("admin")){
    response.sendRedirect("login.jsp");
}

int id = Integer.parseInt(request.getParameter("id"));
String status = request.getParameter("status");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"UPDATE leave_requests SET status=? WHERE id=?");

ps.setString(1,status);
ps.setInt(2,id);

ps.executeUpdate();

response.sendRedirect("pending_leaves.jsp");
%>