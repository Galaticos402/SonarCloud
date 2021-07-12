<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:set var="user" value="${sessionScope.CURRENT_USER.getEmail()}"/>
        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="row">
                        <c:set var="product" value="${requestScope.PRODUCT_DETAIL}"/>
                        <div class="col-sm-12">
                            <div class="container">
                                <div class="card">
                                    <div class="row">
                                        <aside class="col-sm-5 border-right">
                                            <article class="gallery-wrap"> 
                                                <div class="img-big-wrap">
                                                    <div> <a href="#"><img src="images/${product.thumbnailLink.trim()}" alt="Cake image"></a></div>
                                                </div> <!-- slider-product.// -->
                                                <div class="img-small-wrap">
                                                </div> <!-- slider-nav.// -->
                                            </article> <!-- gallery-wrap .end// -->
                                        </aside>
                                        <aside class="col-sm-7">
                                            <article class="card-body p-5">
                                                <h3 class="title mb-3">${product.name}</h3>

                                                <p class="price-detail-wrap"> 
                                                    <span class="price h3 text-warning">
                                                        <c:if test="${product.saleStatus == true}">
                                                            <span class="currency">VND: </span><span class="num">${product.salePrice}</span> <br>
                                                            <span class="currency">VND: </span><span class="num"><del>${product.originalSalePrice}</del></span>
                                                                </c:if>
                                                                <c:if test="${product.saleStatus == false}">
                                                            <span class="currency">VND: </span><span class="num">${product.originalSalePrice}</span> <br>
                                                        </c:if>
                                                    </span> 
                                                </p> <!-- price-detail-wrap .// -->
                                                <dl class="item-property">
                                                    <dt><b>Description</b></dt>
                                                    <dd><p>
                                                            ${product.details}
                                                        </p></dd>
                                                </dl>

                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <dl class="param param-inline">
                                                            <dt>In Stock: ${product.stock} </dt>
                                                            <!--<c:if test="${not empty user}">
                                                                <dd>
                                                                    </br>
                                                                    <input type="number" id="quantity" name="quantity" min="1" max="${product.stock}" style="width:70px;" value="1"><br><br>
                                                                </dd>
                                                            </c:if>-->
                                                        </dl>  <!-- item-property .// -->
                                                    </div> <!-- col.// -->

                                                </div> <!-- row.// -->
                                                <c:set var="jspPage" value="ProductDetail"/>
                                                <c:if test="${not empty user}">
                                                    <hr>
                                                    <c:if test="${product.status}">
                                                        <a href="Cart?id=${product.id}&jspPage=${jspPage}" ><button class="btn btn-lg btn-primary text-uppercase">Add to cart</button></a>
                                                    </c:if>
                                                    <a href="Cart.jsp" class="btn btn-lg btn-outline-primary text-uppercase"> View your Cart </a>
                                                </c:if>
                                            </article> <!-- card-body.// -->
                                        </aside> <!-- col.// -->
                                    </div> <!-- row.// -->
                                </div> <!-- card.// -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding-top: 30px;">                                   
                <a href="home"><button type="button" class="btn btn-success">Back to home</button></a>     
            </div>   
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
