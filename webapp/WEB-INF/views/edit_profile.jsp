<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Enable Bootstrap -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="/css/style2.css" rel="stylesheet" />
        <script src="/js/custom.js"></script>
    <style>
         body {
      	background-color: #1c0d342a;
    }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp"%>
    
    <div class="container">
        <form action="/updateProfile" method="post" onsubmit="return validateForm()">
            <h2>Edit Profile</h2>
            <!-- CSRF token -->
            <input type="hidden" name="id" value="${user.id}">
            <form:hidden path="id" />
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${user.username}" required>
                <!-- Display username error message -->
                <c:if test="${not empty usernameError}">
                    <div class="error-message">${usernameError}</div>
                </c:if>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
                <!-- Display email error message -->
                <c:if test="${not empty emailError}">
                    <div class="error-message">${emailError}</div>
                </c:if>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                        <i class="bi bi-eye"></i>
                    </span>
                <!-- Display password error message -->
                <div class="error-message" id="passwordError"></div>
            </div>
            <div class="form-group">
                <h5><input type="checkbox" name="rememberMe">Remember Me</h5>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Update</button>
                <input type="button" class="btn btn-default" value="Back" onclick="goBack()">

                <script>
                    function goBack() {
                        window.location.href = "/profile";
                    }
                </script>

            </div>
        </form>
    </div>
    
        
    </div>
    <script src="js/scripts.js"></script>
    <script>
        function togglePasswordVisibility(inputId) {
            const passwordInput = document.getElementById(inputId);
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
        }
    
        function validateForm() {
            var password = document.getElementById("password").value;
            var passwordError = document.getElementById("passwordError");
            var pattern = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]{6,}$/;
    
            if (password.length < 6) {
                passwordError.innerHTML = "Password must be at least 6 characters long.";
                return false;
            } else if (!/\d/.test(password)) {
                passwordError.innerHTML = "Password must contain at least one number.";
                return false;
            } else if (!/[a-zA-Z]/.test(password)) {
                passwordError.innerHTML = "Password must contain at least one letter.";
                return false;
            } else {
                passwordError.innerHTML = "";
                return true;
            }
        }
    </script>
    
</body>
</html>
