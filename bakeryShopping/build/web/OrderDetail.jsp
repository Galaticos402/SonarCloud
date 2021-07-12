<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/sale.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <!--Left side of the page -->
                    <div class="col-sm-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Dashboard </div>
                        <ul class="list-group category_block">
                            <li class="list-group-item text-white" ><a href="home">Home</a></li>
                            <li class="list-group-item text-white" ><a href="getPendingOrder">Pending Order</a></li>
                            <li class="list-group-item text-white" ><a href="getAssignedOrder">Assigned Order</a></li>
                        </ul>
                    </div>

                    <!--Right side of the page -->
                    <div class="card col-sm-9" style="padding: 3% 7% 3% 7%;">
                        <h1 style="text-align: center; color: #435d7d;">Order Detail</h1><br>
                    <c:set var="orderInfo" value="${requestScope.ORDER_INFO}"></c:set>
                    <c:set var="orderDetailInfo" value="${requestScope.ORDER_DETAIL_INFO}"></c:set>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <th style="width: 30%;"><b>Order Id:</b></th>
                                    <td style="width: 70%;">OD-${orderInfo.id}</td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Customer Email:</b></th>
                                <td style="width: 70%;">${orderInfo.customerEmail}</td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Customer Name:</b></th>
                                <td style="width: 70%;">${orderInfo.fullname}</td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Customer Phone Number:</b></th>
                                <td style="width: 70%;">${orderInfo.phoneNumber}</td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Customer Address:</b></th>
                                <td style="width: 70%;">${orderInfo.address}</td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Sale person in charge:</b></th>
                                <td style="width: 70%;">
                                    <c:if test="${not empty orderInfo.saleEmail}">
                                        ${orderInfo.saleEmail}
                                    </c:if>
                                    <c:if test="${empty orderInfo.saleEmail}">
                                        N/A
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Order Status:</b></th>
                                <td style="width: 70%;">                        
                                    <c:if test="${orderInfo.status eq 'submitted'}">
                                        <font color="orange">${orderInfo.status}</font>
                                    </c:if>
                                    <c:if test="${orderInfo.status eq 'approved'}">
                                        <font color="orange">${orderInfo.status}</font>
                                    </c:if>
                                    <c:if test="${orderInfo.status eq 'deliver'}">
                                        <font color="orange">${orderInfo.status}</font>
                                    </c:if>
                                    <c:if test="${orderInfo.status eq 'completed'}">
                                        <font color="orange">${orderInfo.status}</font>
                                    </c:if>
                                    <c:if test="${orderInfo.status eq 'cancel'}">
                                        <font color="red">${orderInfo.status}</font>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"></th>
                                <td style="width: 70%;">
                                    <c:if test="${orderInfo.status eq 'submitted'}">
                                        <c:url var="updateLink" value="setOrderStatus">
                                            <c:param name="id" value="${orderInfo.id}" />
                                            <c:param name="saleEmail" value="${sessionScope.CURRENT_USER.email}" />
                                            <c:param name="status" value="approved" />
                                            <c:param name="currentPage" value="detail" />
                                        </c:url>
                                        <a class="update-link-detail" href="${updateLink}" style="display: compact;">Assign</a>
                                    </c:if>

                                    <c:if test="${orderInfo.status eq 'approved'}">
                                        <c:url var="updateLink" value="setOrderStatus">
                                            <c:param name="id" value="${orderInfo.id}" />
                                            <c:param name="saleEmail" value="${sessionScope.CURRENT_USER.email}" />
                                            <c:param name="status" value="deliver" />
                                            <c:param name="currentPage" value="detail" />
                                        </c:url>
                                        <a class="update-link-detail" href="${updateLink}" style="display: compact;">Deliver</a>
                                        <c:url var="cancelLink" value="setOrderStatus">
                                            <c:param name="id" value="${orderInfo.id}" />
                                            <c:param name="saleEmail" value="${sessionScope.CURRENT_USER.email}" />
                                            <c:param name="status" value="cancel" />
                                            <c:param name="currentPage" value="detail" />
                                        </c:url>
                                        <a class="cancel-link-detail" href="${cancelLink}">Cancel</a>
                                    </c:if>

                                    <c:if test="${orderInfo.status eq 'deliver'}">
                                        <c:url var="updateLink" value="setOrderStatus">
                                            <c:param name="id" value="${orderInfo.id}" />
                                            <c:param name="saleEmail" value="${sessionScope.CURRENT_USER.email}" />
                                            <c:param name="status" value="completed" />
                                            <c:param name="currentPage" value="detail" />
                                        </c:url>
                                        <a class="update-link-detail" href="${updateLink}" style="display: compact;">Finish</a>
                                        <c:url var="cancelLink" value="setOrderStatus">
                                            <c:param name="id" value="${orderInfo.id}" />
                                            <c:param name="saleEmail" value="${sessionScope.CURRENT_USER.email}" />
                                            <c:param name="status" value="cancel" />
                                            <c:param name="currentPage" value="detail" />
                                        </c:url>
                                        <a class="cancel-link-detail" href="${cancelLink}">Cancel</a>
                                    </c:if>
                                    <br>
                                    <p class="text-danger">${requestScope.ASSIGNED_ORDER_LIMIT_REACH_ERROR}</p>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 30%;"><b>Update Date:</b></th>
                                <td style="width: 70%;">${orderInfo.completeDate}</td>
                            </tr>
                        </tbody>
                    </table>

                    <table class="table table-striped" style="width: 100%; border-collapse: collapse;">
                        <thead>
                            <tr style="background-color: #435d7d;">
                                <th scope="col">Product Id</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Product Image</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total Item Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${orderDetailInfo}" varStatus="counter">
                                <tr>
                                    <td>
                                        ${dto.productId}
                                    </td>
                                    <td>
                                        ${dto.productName}
                                    </td>
                                    <td>
                                        <img src="images/${dto.imageLink.trim()}" alt="" width="270px" height="180px" style="background: 100% 100%;"></img>
                                    </td>
                                    <td>
                                        ${dto.quantity}
                                    </td>
                                    <td>
                                        <p style="display: inline;">${dto.totalItemPrice} VND</p>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <p style="display: inline;"><b>Total Order Price (including Tax):</b> ${orderInfo.totalPrice} VND</p>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
