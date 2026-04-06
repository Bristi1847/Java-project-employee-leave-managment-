<!DOCTYPE html>
<html>
<head>
    <title>Employee Leave System</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4e73df, #224abe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: #f8f9fc;
            padding: 40px;
            width: 420px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #1a2c56;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        select, input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: 2px solid #2e4a7d;
            font-size: 15px;
        }

        button {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: #2e4a7d;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #1f3560;
        }
    </style>
</head>

<body>

<div class="login-box">
    <h2>Employee Leave System</h2>

    <form action="loginProcess.jsp" method="post">

        <label>Login As</label>
        <select name="role" required>
            <option value="admin">Admin</option>
            <option value="employee">Employee</option>
        </select>

        <label>Username (Email)</label>
        <input type="text" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>

    </form>
</div>

</body>
</html>