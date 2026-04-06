<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("role")==null || 
   !session.getAttribute("role").equals("admin")){
    response.sendRedirect("login.jsp");
}

int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"DELETE FROM employees WHERE id=?");

ps.setInt(1,id);
ps.executeUpdate();

response.sendRedirect("manage_employees.jsp");
%>