<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("role")==null){
    response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Change Password</title>

<style>
body {
    font-family: 'Segoe UI';
    background:#f4f6f9;
}

.box {
    width:400px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    text-align:center;
}

input {
    width:100%;
    padding:10px;
    margin:10px 0;
}

button {
    padding:10px;
    width:100%;
    background:#3498db;
    color:white;
    border:none;
}
</style>
</head>

<body>

<div class="box">

<h2>Change Password</h2>

<form action="update_password.jsp" method="post">

<input type="password" name="oldPassword" placeholder="Old Password" required>

<input type="password" name="newPassword" placeholder="New Password" required>

<button type="submit">Update Password</button>

</form>

<br>
<a href="employee_dashboard.jsp">Back</a>

</div>

</body>
</html>