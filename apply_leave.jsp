<!DOCTYPE html>
<html>
<head>
<title>Apply Leave</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

.sidebar {
    width: 250px;
    height: 100vh;
    background: #1f3c88;
    color: white;
    position: fixed;
    padding-top: 20px;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar a {
    display: block;
    color: white;
    padding: 15px 20px;
    text-decoration: none;
}

.sidebar a:hover {
    background: #163172;
}

.main {
    margin-left: 250px;
    padding: 40px;
}

.form-box {
    width: 500px;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.form-box input,
.form-box select,
.form-box textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.form-box button {
    width: 100%;
    padding: 10px;
    background: #1f3c88;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.form-box button:hover {
    background: #163172;
}
</style>
</head>

<body>

<div class="sidebar">
    <h2>Employee Panel</h2>
    <a href="employee_dashboard.jsp">Dashboard</a>
    <a href="apply_leave.jsp">Apply Leave</a>
    <a href="view_leave.jsp">View Leave Status</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="main">
    <h2>Apply Leave</h2>

    <div class="form-box">
        <form action="leaveProcess.jsp" method="post">

<select name="leave_type" required>
    <option value="Sick Leave">Sick Leave</option>
    <option value="Casual Leave">Casual Leave</option>
</select>

<input type="date" name="from_date" required>
<input type="date" name="to_date" required>

<textarea name="reason" required></textarea>

<button type="submit">Submit</button>

</form>
    </div>
</div>

</body>
</html>