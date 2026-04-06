<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("role")==null){
    response.sendRedirect("login.jsp");
    return;
}

int empId = (int)session.getAttribute("employee_id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/leave_db","root","Root@123");

// count query
int pending=0, approved=0, rejected=0;

PreparedStatement ps1 = con.prepareStatement(
"SELECT status, COUNT(*) FROM leave_requests WHERE employee_id=? GROUP BY status");
ps1.setInt(1, empId);
ResultSet rs1 = ps1.executeQuery();

while(rs1.next()){
    if(rs1.getString(1).equals("Pending")) pending = rs1.getInt(2);
    if(rs1.getString(1).equals("Approved")) approved = rs1.getInt(2);
    if(rs1.getString(1).equals("Rejected")) rejected = rs1.getInt(2);
}

// table data
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM leave_requests WHERE employee_id=?");
ps.setInt(1, empId);
ResultSet rs = ps.executeQuery();
%>

<html>
<head>
<title>Employee Dashboard</title>

<style>
body{
    font-family:Segoe UI;
    background:#f4f6f9;
    margin:0;
}

/* Sidebar */
.sidebar{
    width:220px;
    height:100vh;
    background:#2c3e50;
    position:fixed;
    color:white;
}
.sidebar h2{
    text-align:center;
    padding:15px;
}
.sidebar a{
    display:block;
    padding:12px;
    color:white;
    text-decoration:none;
}
.sidebar a:hover{
    background:#34495e;
}

/* Main */
.main{
    margin-left:220px;
    padding:20px;
}

/* Cards */
.cards{
    display:flex;
    gap:20px;
}
.card{
    flex:1;
    padding:20px;
    border-radius:10px;
    color:white;
    text-align:center;
}
.blue{background:#3498db;}
.green{background:#2ecc71;}
.red{background:#e74c3c;}

/* Table */
table{
    width:100%;
    margin-top:30px;
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
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
<h2>Employee</h2>

<a href="employee_dashboard.jsp">Dashboard</a>
<a href="apply_leave.jsp">Apply Leave</a>
<a href="view_leave.jsp">View Leave Status</a>
<a href="profile.jsp">Profile</a>
<a href="change_password.jsp">Change Password</a>
<a href="logout.jsp">Logout</a>

</div>

<!-- Main -->
<div class="main">

<h2>Welcome <%= session.getAttribute("name") %></h2>

<!-- Summary Cards -->
<div class="cards">
<div class="card blue">Pending<br><h2><%= pending %></h2></div>
<div class="card green">Approved<br><h2><%= approved %></h2></div>
<div class="card red">Rejected<br><h2><%= rejected %></h2></div>
</div>

<!-- Table -->


</div>

</body>
</html>