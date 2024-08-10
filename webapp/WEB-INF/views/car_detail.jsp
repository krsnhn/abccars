<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />        

    <title>Car Details</title>
    <!-- Link to static resources -->
    <link href="/css/style2.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet" />
    <script src="/js/custom.js"></script>
    <style>
        body {
            background-color: #1c0d342a;
        }

        .container {
            padding-top: 0px;
            display: flex;
            margin-left: 30; /* Adjust the margin to give way to the menu */
            width: calc(80% - 250px); /* Calculate the width to accommodate the menu */
            border-radius: 10px;
            overflow: hidden; /* Ensure content doesn't exceed container */
        }

        .car-detail {
            flex: 1;
            background-color: #ffffff;
            padding: 20px;
            box-sizing: border-box; /* Include padding and border in the element's total width */
            border-left: 2px solid #FFC23C; /* Set border on the right side only */
            border-top: 2px solid #FFC23C;
            border-bottom: 2px solid #FFC23C;
            border-radius: 10px 0 0 10px; /* Rounded corners only on the left side */
        }

        .bid-history {
            flex: 1;
            background-color: #dcdcdc;
            padding: 20px;
            box-sizing: border-box; /* Include padding and border in the element's total width */
            border-right: 2px solid #FFC23C; /* Set border on the left side only */
            border-top: 2px solid #FFC23C;
            border-bottom: 2px solid #FFC23C;
            border-radius: 0 10px 10px 0; /* Rounded corners only on the right side */
        }

        .bid-history h4 {
            color: #333;
        }

        .car-detail img {
            max-width: 400px;
            height: 300px;
            display: block; /* Ensures margin: auto works */
            margin: auto; /* Centers the image horizontally */
        }

        .car-detail h5 {
            margin-top: 0;
        }

        .car-detail p {
            margin: 5px 0;
        }

        .bid-history div {
            margin-bottom: 10px;
        }

        .bid-history hr {
            margin: 20px 0;
            border: none;
            border-top: 1px solid #333;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Ensure padding and border are included in element's total width and height */
            font-size: 16px;
        }

        .input-group input[type="number"]:focus {
            outline: none;
            border-color: #007bff; /* Example color change on focus */
        }

        .btn {
        display: inline-block;
        padding: 10px 20px;
        margin-right: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .btn.btn-warning {
        background-color: #ffc107;
        color: #fff;
    }

    .btn.btn-warning:hover {
        background-color: orange;
    }

    .btn-dark {
        display: inline-block;
        padding: 10px 20px;
        margin-right: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        transition: background-color 0.3s ease;
        background-color: rgba(255, 38, 38, 0.856); /* Change the background color to match btn-warning */
        color: #fff;
    }

    .btn-dark:hover {
        display: inline-block;
        padding: 10px 20px;
        margin-right: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        background-color: red; /* Change the background color to match btn-warning */
        color: #fff;
    }

    </style>

</head>

<body>

    <%@ include file="menu.jsp" %>
    <div class="container">
        <div class="car-detail">
            <div class="car-list-header">
                <h2>Car Details</h2>
            </div>

            <form:form>
                <img src="/images/${car.carphoto}">
                <div>
                    <h5>$${car.price}</h5>
                    <div>
                        <p>Car Make : ${car.make}</p>
                        <p>Car Model: ${car.model}</p>
                        <p>Car Body Style :${car.bodyStyle}</p>
                        
                    </div>
                    <div class="input-group">
                        <form action="car_detail?id=${car.id}" method="post">
                            <input type="hidden" name="id" value="${car.id}" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="number" placeholder="Enter Bid Price" name="bitprice" />
                        </form>
                    </div>

                    <div style="padding: 20px;">
                        <input type="submit" value="Bid Car" class="btn btn-warning">
                        <a href="cars" class="btn-dark">Go Back</a>
                    </div>
                </div>

                <script>
                    function goBack() {
                        window.history.back();
                    }
                </script>

            </form:form>
        </div>

        <div class="bid-history">
            <h4>Bidding History</h4>
            <hr>
            <c:choose>
                <c:when test="${empty bidinfo}">
                    <p>No bidding history available.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="car_bidding" items="${bidinfo}">
                        <div>
                            <div>
                                <p>${car_bidding.bidderName}</p>
                            </div>
                            <div>
                                <div>
                                    <p><small>${car_bidding.bid_date_time}</small></p>
                                    <p>Bidded Price: ${car_bidding.bidderPrice}</p>
                                </div>
                            </div>
                        </div>
                        <hr />
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>

</html>
