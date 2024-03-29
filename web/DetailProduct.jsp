
<%@page contentType="text/html" pageEncoding="UTF-8"%>s
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Chi Tiết Sản Phẩm</title>
        <!-- Roboto Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <!-- Material Design Bootstrap Ecommerce -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <!-- Your custom styles (optional) -->

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
            .product-image {
                height: 300px;
                width: auto;
                max-width: 100%; /* Đảm bảo ảnh không bị giãn */
                display: inline-block;
                cursor: zoom-in;
            }
        </style>
    </head>
    <body class="skin-light">
        <jsp:include page="Menu.jsp"></jsp:include>
                    <div class="container text-center py-5">
                        <h3 class="mb-0"></h3>
                    </div>
            <!--Main Navigation-->
            <!--Main layout-->
            <main>
                <div class="container">
                    <!--Section: Block Content-->
                    <section class="mb-5">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="#"><img src="image/${detail.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detail.name}</h3>
                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency"></span><span class="num">${detail.price}$</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt style="color: chocolate">Mô Tả</dt>
                                            <dd><p>${detail.description} </p></dd>
                                        </dl>
                                        </div>
                                        <hr>
                                        <form action="addCart?pid=${detail.id }" method="post">
                                            <div class="table-responsive mb-2">
                                                <table class="table table-sm table-borderless">
                                                    <tbody>
                                                        <tr>
                                                            <td class="pl-0 pb-0 w-25">Số Lượng</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="pl-0">
                                                                <div class="mt-1">
                                                                    <div class="def-number-input number-input safari_only mb-0" style="display: flex; align-items: center;">
                                                                        <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                                                                class="minus"></button>
                                                                        <input class="quantity" min="0" name="quantity" value="1" type="number">
                                                                        <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                                                                class="plus"></button>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="mt-1">
                                                <button type="submit" class="btn btn-primary btn-md mr-1 mb-2">Mua Ngay</button>
                                                <button type="submit" class="btn btn-light btn-md mr-1 mb-2"><i class="fas fa-shopping-cart pr-2"></i>Thêm Vào Giỏ Hàng</button>
                                            </div>
                                        </form>
                                        </div>
                                        </div>
                                        </section>
                                        <!--Section: Block Content-->
                                        <!-- Classic tabs -->
                                        <div class="classic-tabs">
                                            <ul class="nav tabs-primary nav-justified" id="advancedTab" role="tablist">
                                                <!--                <li class="nav-item">
                                                                    <a class="nav-link active show" id="description-tab" data-toggle="tab" href="#description" role="tab"
                                                                       aria-controls="description" aria-selected="true">Description</a>
                                                                </li>-->
                                                <li class="nav-item">
                                                    <a class="nav-link" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info"
                                                       aria-selected="false">Thông Tin Thêm</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews"
                                                       aria-selected="false">Bình Luận (${countAllReview })</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content" id="advancedTabContent">
                                                <!--                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                                                    <h5>Product Description</h5>
                                                
                                                                    <h6>$${String.format("%.02f",detail.price*0.9) }</h6>
                                                                    <p class="pt-1">${detail.description}</p>
                                                                </div>-->
                                                <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
                                                    <h5>Thông Tin Calo</h5>
                                                    <table class="table table-striped table-bordered mt-3">
                                                        <thead>
                                                            <tr>
                                                                <th scope="row" class="w-150 dark-grey-text h6">Calo</th>
                                                                <td><em>50</em></td>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row" class="w-150 dark-grey-text h6">Đơn Vị Tính</th>
                                                                <td><em>150g</em></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                                    <h5><span>${countAllReview }</span> lượt bình luận cho món <span>${detail.name }</span></h5>

                                                    <p></p>
                                                    <div>
                                                        <!-- Your review -->
                                                        <div class="md-form md-outline">
                                                            <textarea id="form76" class="md-textarea form-control pr-6" rows="4"></textarea>
                                                            <label for="form76">Bình Luận Của Bạn </label>
                                                        </div>
                                                        <div class="text-right pb-2">
                                                            <button type="button" class="btn btn-primary" onclick="addReview(${detail.id})">Thêm Bình Luận</button>
                                                        </div>
                                                    </div>
                                                    <c:forEach items="${listAllReview}" var="r">
                                                        <div class="media mt-3 mb-4">
                                                            <img class="d-flex mr-3 z-depth-1" src="https://mdbootstrap.com/img/Photos/Others/placeholder1.jpg"
                                                                 width="62" alt="Generic placeholder image">
                                                            <div class="media-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <p class="mt-1 mb-2">
                                                                        <c:forEach items="${listAllAcount}" var="a">
                                                                            <c:if test="${r.accountID == a.id }">
                                                                                <strong>${a.user } </strong>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <span>– </span><span>${r.dateReview }</span>
                                                                    </p>
                                                                </div>
                                                                <p class="mb-0">${r.contentReview }</p>
                                                            </div>
                                                        </div>
                                                        <hr>    
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Classic tabs -->
                                        <hr>
                                        <!--Section: Block Content-->
                                        <section class="text-center">
                                            <h4 class="text-center my-5"><strong>Sản Phẩm Liên Quan</strong></h4>
                                            <!-- Grid row -->
                                            <div class="row">
                                                <c:forEach items="${listRelatedProduct}" var="o">
                                                    <!-- Grid column -->
                                                    <div class="col-md-6 col-lg-3 mb-5">
                                                        <!-- Card -->
                                                        <div class="">
                                                            <div class="view zoom overlay z-depth-2 rounded">
                                                                <img class="img-fluid w-100 product-image"
                                                                     src="image/${o.image}"  alt="Sample">
                                                                <h4 class="mb-0"><span class="badge badge-primary badge-pill badge-news">Sale 10%</span></h4>
                                                                <a href="detail?pid=${o.id}">
                                                                    <div class="mask">
                                                                        <img class="img-fluid w-100 product-image"
                                                                             src="image/${o.image }">
                                                                        <div class="mask rgba-black-slight"></div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="pt-4">
                                                                <h5>${o.name }</h5>
                                                                <p><span class="text-danger mr-1"><strong>${String.format("%.02f",o.price*0.9) }$</strong></span><span
                                                                        class="text-grey"><strong><s>${o.price }$</s></strong></span></p>
                                                            </div>
                                                        </div>
                                                        <!-- Card -->
                                                    </div>
                                                    <!-- Grid column -->
                                                </c:forEach>
                                            </div>
                                            <!-- Grid row -->
                                        </section>
                                        <!--Section: Block Content-->
                                        </div>
                                        </main>
                                        <!--Main layout-->
                                        <jsp:include page="Footer.jsp"></jsp:include>
                                        <script>
                                            window.addEventListener("load", function loadAmountCart() {
                                                $.ajax({
                                                    url: "/Project_Ban_Che/loadAllAmountCart",
                                                    type: "get", //send it through get method
                                                    data: {

                                                    },
                                                    success: function (responseData) {
                                                        document.getElementById("amountCart").innerHTML = responseData;
                                                    }
                                                });
                                            }, false);

                                            function addReview(pID) {
                                                var cntReview = document.getElementById("form76").value;
                                                $.ajax({
                                                    url: "/Project_Ban_Che/addReview",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        productID: pID,
                                                        contentReview: cntReview
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("reviews");
                                                        row.innerHTML += data;
                                                    },
                                                    error: function (xhr) {
                                                        //Do Something to handle error
                                                    }
                                                });
                                            }
                                        </script>
                                        <!-- SCRIPTS -->
                                        <!-- JQuery -->
                                        <script src="../../../js/jquery-3.4.1.min.js"></script>
                                        <!-- Bootstrap tooltips -->
                                        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
                                        <!-- Bootstrap core JavaScript -->
                                        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
                                        <!-- MDB core JavaScript -->
                                        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
                                        <!-- MDB Ecommerce JavaScript -->
                                        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
                                        <script>
                                            $(document).ready(function () {
                                                // MDB Lightbox Init
                                                $(function () {
                                                    $("#mdb-lightbox-ui").load("../../../mdb-addons/mdb-lightbox-ui.html");
                                                });
                                            });
                                        </script>
                                        </body>
                                        </html>
