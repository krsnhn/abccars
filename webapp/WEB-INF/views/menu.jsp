<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.abc.carportal.entity.Car"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style2.css">
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />        

    <title>Dashboard</title>
</head>
<body>
    <nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <img src="logo/favicon.png" alt="logo.png" >
                </span>
                <div class="text header-text">
                    <span class="name">ABC</span>
                    <span class="profession">CARS</span>
                </div>
            </div>
            <i class="bx bx-chevron-right toggle"></i>
        </header>

        <div class="menu-bar">
            <div class="menu">
                <ul class="menu-links">
                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('USER')">
                            <li class="nav-link">
                                <a href="cars">
                                    <i class="bx bx-home-alt icon"></i>
                                    <span class="text nav-text">Car Lists</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="new_car">
                                    <i class='bx bx-car icon'></i>
                                    <span class="text nav-text">Add a Car</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="contact-us">
                                    <i class='bx bx-envelope icon' ></i>
                                    <span class="text nav-text">Contact Us</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="/profile?id=${user.id}">
                                  <i class='bx bx-cog icon'></i>
                                  <span class="text nav-text">Settings</span>
                                </a>
                              </li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                            <li class="nav-link">
                                <a href="cars">
                                    <i class="bx bx-home-alt icon"></i>
                                    <span class="text nav-text">Car Lists</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="new_car">
                                    <i class='bx bx-car icon'></i>
                                    <span class="text nav-text">Add a Car</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="users">
                                    <i class='bx bx-user icon'></i>
                                    <span class="text nav-text">All Users</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="contact-us">
                                    <i class='bx bx-envelope icon' ></i>
                                    <span class="text nav-text">Contact Us</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="profile">
                                    <i class='bx bx-cog icon' ></i>
                                    <span class="text nav-text">Settings</span>
                                </a>
                            </li>
                        </sec:authorize>
                    </sec:authorize>
                </ul>
                <div class="bottom-content">
                    <li class="bot1">
                        <a href="/logout?csrf=${_csrf.token}">
                            <i class="bx bx-log-out icon"></i>
                            <span class="text nav-text">Logout</span>                              			
                        </a>
                    </li>
                </div>
                
            </div>
        </div>
    </nav>
        
    <script src="js/script2.js"></script>
</body>
</html>
