<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Member Login</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f7f7f7;
      margin: 0;
      font-family: Arial, sans-serif;
    }
    .login-container {
      display: flex;
      align-items: center;
      background: white;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
      border-radius: 10px;
    }
    .login-container .login-image {
      margin-right: 50px;
    }
    .login-container .login-image img {
      width: 150px;
      height: 150px;
    }
    .login-form {
      width: 300px;
    }
    .login-form h2 {
      margin-bottom: 20px;
    }
    .login-form input {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .login-form button {
      width: 100%;
      padding: 10px;
      background-color: #28a745;
      border: none;
      color: white;
      border-radius: 5px;
      cursor: pointer;
    }
    .login-form button:hover {
      background-color: #218838;
    }
    .login-form .forgot-password {
      display: block;
      text-align: center;
      margin-top: 10px;
      color: #007bff;
      text-decoration: none;
    }
    .login-form .create-account {
      display: block;
      text-align: center;
      margin-top: 10px;
      color: #007bff;
      text-decoration: none;
    }
  </style>
</head>
<body>
<div class="login-container">
  <div class="login-image">
    <img src="https://th.bing.com/th/id/R.3872bffce414ea312c58606d5f65bb8e?rik=D3ScYlcWOqPiVA&pid=ImgRaw&r=0" alt="Login Image">
  </div>
  <div class="login-form">
    <h2>Member Login</h2>
    <form action="login" method="POST">
      <input name="user" value="${username}" id="inputEmail" type="text" placeholder="Username">
      <input name="pass" value="${password}" id="inputPassword" type="password" placeholder="Password">
      <button type="submit">LOGIN</button>
    </form>
    <c:if test="${not empty error}">
      <p style="color: red;">${error}</p>
    </c:if>
    <a href="#" class="forgot-password">Forgot Username / Password?</a>
    <a href="#" class="create-account">Create your Account</a>
  </div>
</div>
</body>
</html>
