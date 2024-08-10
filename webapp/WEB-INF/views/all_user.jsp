<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <!-- Link to static resources -->
    <link href="/css/style.css" rel="stylesheet" />
    <script src="/js/custom.js"></script>
    <style>
        body {
            background-color: #1c0d342a;
        }
    </style>
</head>

<body>
    <%@ include file="menu.jsp" %>

    <div class="car-list-header">
        <h2>All Users</h2>
    </div>
    <div class="table-content">

        <table class="table table-bordered table-responsive table-striped" id="table-list">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>User Name</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <% int i=1; %>
                <c:forEach var="user" items="${userlists}">
                    <tr>
                        <td><%= i %></td>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${user.username}</td>
                        <td>******</td>
                    </tr>
                    <% i++; %>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
