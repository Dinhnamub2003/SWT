<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="position: fixed; top: 0; width:100%;  z-index: 100000;">
    <div class="container">
        <img src="image/banner2.jpg" width="5%" height="15%" alt="Banner Image">
        <a class="navbar-brand" href="home">Ốc Chè Ngon Shop</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home">Trang Chủ</a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="shop">Shop</a>
                </li> 

                <%--  <c:if test="${sessionScope.acc.isSell == 1}">
                     <li class="nav-item">
                         <a class="nav-link" href="manager">Manager Product</a>
                     </li>
                 </c:if> --%>
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="admin">Quản Lí</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Đăng Xuất</a>
                    </li> 
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login">Đăng Nhập</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="forgotPassword">Quên Mật Khẩu</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="EditProfile.jsp">Chỉnh Sửa Thông Tin Cá Nhân</a>
                    </li>
                </c:if>
                <%--  <c:if test="${sessionScope.acc.isAdmin == 1}">
                     <li class="nav-item">
                         <a class="nav-link" href="statistic">Statistic</a>
                     </li>
                 </c:if> --%>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">

                <a class="btn btn-success btn-sm ml-3" href="managerCart">
                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 14px;">Giỏ Hàng</span>
                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>

                </a>
            </form>
        </div>
    </div>
</nav>



<!--end of menu-->
