<%@ page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM employees WHERE email=? AND password=?");

ps.setString(1, email);
ps.setString(2, password);

ResultSet rs = ps.executeQuery();

if(rs.next()){

	session.setAttribute("employee_id", rs.getInt("id"));
	session.setAttribute("name", rs.getString("name"));
	session.setAttribute("role", rs.getString("role"));

    if(rs.getString("role").equals("admin")){
        response.sendRedirect("admin_dashboard.jsp");
    } else {
        response.sendRedirect("employee_dashboard.jsp");
    }

} else {
    out.println("<h3 style='color:red;text-align:center;'>Invalid Login</h3>");
}
%>