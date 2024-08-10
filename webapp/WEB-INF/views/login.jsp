<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style2.css">
    <style>
        body {
            position: relative;
            background: url('../images/welcome-hero/welcome-banner.jpg') no-repeat;
            background-position: center;
            background-size: cover;
            z-index: 1;
        }
        body:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(42, 45, 84, 0.60);
            z-index: 0;
        }
    </style>
</head>
<body>
    <div class="navbar-header" style="position: relative; z-index: 1000;">
        <a class="navbar-brand" href="/home" style="color: #FFC23C; padding-left: 180px;">ABC CARS<span></span></a>
    </div>
    
    <!-- FORM HERE -->
    <div class="container">
        <!-- Display error message if present -->
        
        <form action="/login" method="post">
            <input type="hidden" name="id" value="${user.id}">
            <h2>Login Form</h2>

            <c:if test="${param.error eq 'true'}">
                <div class="error-message">Invalid username or password.</div>
            </c:if>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <h5><input type="checkbox" name="rememberMe">Remember Me</h5>
            </div>  
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
            <div>
                <p>Don't have an account? <a href="/registration">Register here</a></p>
            </div>
        </form>
    </div>
</body>
</html>
