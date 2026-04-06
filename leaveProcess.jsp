<%@ page import="java.sql.*,java.time.*,java.time.temporal.ChronoUnit" %>

<%
Integer employeeId = (Integer) session.getAttribute("employee_id");

if(employeeId == null){
    response.sendRedirect("login.jsp");
    return;
}

String leaveType = request.getParameter("leave_type");
String fromDate = request.getParameter("from_date");
String toDate = request.getParameter("to_date");
String reason = request.getParameter("reason");

/* Calculate Days */
LocalDate start = LocalDate.parse(fromDate);
LocalDate end = LocalDate.parse(toDate);
long days = ChronoUnit.DAYS.between(start, end) + 1;

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"INSERT INTO leave_requests(employee_id,leave_type,from_date,to_date,reason,status,days) VALUES(?,?,?,?,?,?,?)");

ps.setInt(1, employeeId);
ps.setString(2, leaveType);
ps.setString(3, fromDate);
ps.setString(4, toDate);
ps.setString(5, reason);
ps.setString(6, "Pending");   // IMPORTANT
ps.setLong(7, days);

ps.executeUpdate();

con.close();

response.sendRedirect("employee_dashboard.jsp");
%>