<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
            #addAccountForm label.error{
                color: red;
                width: 250px;
                font-style: italic;
            }
        </style>
        <style>
            .navbar-brand {
                padding-left: 20%;
                padding-right: 20%;
            }
            .jumbotron-heading {
                font-family: sans-serif;
                color: #990000;
                text-shadow: -2px -2px 0 white, 2px -2px 0 white, -2px 2px 0 white, 2px 2px 0 white;
            }
            .lead {

            }
            .update-link-true {
                display: inline-block;
                border: 1px;
                border-style: solid;
                border-radius: 10px;
                background-color: #00cc33;
                color: white;
                text-decoration: none;
                padding: 0.3em 0.6em;
            }

            .update-link-false {
                display: inline-block;
                border: 1px;
                border-style: solid;
                border-radius: 10px;
                background-color: red;
                color: white;
                text-decoration: none;
                padding: 0.3em 0.6em;
            }
        </style>
    </head>
    <body>
        <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/additional-methods.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#addAccountForm").validate({
                    rules: {
                        txtAccFullName: {
                            required: true,
                            rangelength: [5, 60]
                        },
                        txtAccAddress: {
                            required: true,
                            rangelength: [10, 100]
                        },
                        txtAccPhoneNumber: {
                            required: true,
                            number: true,
                            minlength: 10,
                            maxlength: 12
                        }
                    },
                    messages: {
                        txtAccFullName: {
                            required: " Please input Full Name!",
                            rangelength: " Full Name must be 5-60 characters long!"
                        },
                        txtAccAddress: {
                            required: " Please input Address!",
                            rangelength: " Address must be 10-100 characters long!"
                        },
                        txtAccPhoneNumber: {
                            required: " Please input Phone number!",
                            number: " Please input number only!",
                            minlength: " Min length is 10!",
                            maxlength: " Max length is 12!"
                        }
                    }
                })
            });
        </script>
        <!--begin of menu-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <a class="navbar-brand" href="home"> <img src="images/logo.png" alt="Home" width="130px" height="50px" style="background: 100% 100%; margin: auto; padding: auto;"></img></a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <c:set var="userEmail" value="${sessionScope.CURRENT_USER.getEmail()}"/>
                <c:if test="${empty userEmail}">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Login.jsp">Login <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="Registration.jsp">Sign Up</a>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${not empty userEmail}">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item active">
                            <b class="nav-link" style="color: white">Welcome, ${sessionScope.CURRENT_USER.getFullName()}</b>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="UpdateAccount?Email=${userEmail}">Profile <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="logOut">Log Out</a>
                        </li>
                    </ul>
                </c:if>
            </div>
        </nav>
        <section class="jumbotron text-center" style="background-image: url('images/Home_Background.jpg'); background-repeat: repeat;">
            <div class="container">
                <h1 class="jumbotron-heading">BAKERY STARTUP </h1>
                <p class="lead text-muted mb-0">High quality products only!</p>
            </div>
        </section>
        <c:set var="accountDto" value="${requestScope.ACCOUNT_DETAIL}"/>
        <div class="container">
            <div id="editAccount" class="">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="updateAccountInfo" id="addAccountForm">
                            <div class="modal-header">						
                                <h4 class="modal-title">Account Details</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${accountDto.email.trim()}" name="txtAccEmail" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input value="${accountDto.password.trim()}" name="txtAccPassword" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input value="${accountDto.fullName.trim()}" name="txtAccFullName" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    Gender: <b>${accountDto.gender.trim()}</b>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input value="${accountDto.address.trim()}" name="txtAccAddress" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <input value="${accountDto.phoneNumber.trim()}" name="txtAccPhoneNumber" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Creation Date</label>
                                    <input value="${accountDto.creationDate}" name="txtAccDate" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    Role: 
                                    <b>
                                        ${accountDto.role.name}
                                    </b>
                                </div>
                                <div class="form-group">
                                    Status: 
                                    <c:if test="${accountDto.status}"><span class="update-link-true" onclick="changeStatus('${accountDto.email}', '${accountDto.status}')">True</span></c:if>
                                    <c:if test="${!accountDto.status}"><span class="update-link-false" onclick="changeStatus('${accountDto.email}', '${accountDto.status}')">False</span></c:if>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="manageUser"><input type="button" class="btn btn-default" data-dismiss="modal" value="Back"></a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script>
            function changeStatus(email, status) {
                $.ajax({
                    url: "/bakeryShopping/UpdateAccountStatus",
                    type: "get", //send it through get method
                    data: {
                        Email: email,
                        Status: status
                    },
                    success: function (response) {
                        location.reload();
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
        </script>
    </body>
</html>
