<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/sale.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="js/sale.js" type="text/javascript" />
        <style>
            ul li{
                list-style: none;
            }
            .btnCancel{
                margin-top: 5px
            }
        </style>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div style="padding-top: 30px; padding-left: 100px;">                                   
                <a href="home"><button type="button" class="btn btn-success">Back to home</button></a>     
            </div> 
            <div class="container">
                <h1 class="display-4 my-4 text-info">Order History</h1>
                <div class="row">
                    <div class="col-6 col-md-6">
                    <c:set var="orderHistory" value="${requestScope.orderHistory}" />
                    <!--Display pending order if any-->
                    <c:if test="${not empty orderHistory}">
                        <table class="table table-striped" id="pending-order" style="width: 100%; border-collapse: collapse">
                            <thead>
                                <tr class="list-header">
                                    <th scope="col">No.</th>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Total Price</th>    
                                    <th scope="col">Status</th>
                                    <th scope="col">Completed Date</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                            <form action="getOrderDetail">
                                <c:set var="orderId" value=""></c:set>

                                <c:forEach var="dto" items="${orderHistory}" varStatus="counter">
                                    <c:set var="isPending" value="false"></c:set>
                                        <tr>
                                            <th>
                                            ${counter.count}
                                        </th>
                                        <c:forEach var="order" items="${dto}" >

                                            <c:if test="${order.key.trim() eq 'orderId'}">
                                                <c:set var="orderId" value="${order.value}"></c:set>
                                            </c:if>
                                            <c:if test="${order.value.trim() eq 'pending' || order.value.trim() eq 'submitted'}">
                                                <c:set var="isPending" value="true"></c:set>
                                            </c:if>
                                            <td>
                                                ${order.value}
                                            </td>

                                        </c:forEach>
                                        <td>
                                            <a href="orderHistoryItem?id=${orderId}" class="btn btn-primary">Detail</a>
                                            <c:if test="${isPending eq 'true'}">
                                                <a  href="CancelOrder?id=${orderId}" onclick="Confirm(event)" class="btnCancel btn btn-danger">Cancel</a>
                                            </c:if>
                                            <c:if test="${isPending eq 'false'}">
                                                <button class="btnCancel btn btn-danger" disabled>Cancel</button>
                                            </c:if>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </form>
                            </tbody>
                        </table>

                    </c:if>
                </div>
                <div class="col-6 col-md-6" style="display:block;">
                    Order Detail
                    <c:if test="${!empty requestScope.orderDetailList}">
                        <table class="table table-striped">
                            <thead>
                                <tr class="list-header">
                                    <!--                                    <th scope="col">No.</th>-->
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Image</th>    
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${requestScope.orderDetailList}" varStatus="count">
                                    <tr>

                                        <td>${item.productName}</td>
                                        <td><img src="images/${item.imageLink.trim()}" width="100px" height="100px"></td>
                                        <td>${item.quantity}</td>
                                        <td>${item.totalItemPrice}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>



                    </c:if>
                </div>
            </div>
        </div>



        <div>
            <!--If there's no pending orders-->
            <c:if test="${empty orderHistory}">
                <h2>No Order History</h2>
            </c:if>
        </div>

        <!--end of right div-->

        <!--end of row div-->



        <!--end of container div-->
    </body>

</html>
<script>
    function Confirm(event) {
        if (!confirm("Are you sure ? You cannot undo this once confirmed"))
            event.preventDefault();
    }
</script>
