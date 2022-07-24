
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navigation-wrap" style="background-color: #333" >
    <c:if test="${notification !=null}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="position: fixed; z-index: 15 ; margin-left: 40%">
            <strong>${notification}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <div class="container">
        <a class="navbar-brand" href="home">
            <img src="images/logo.png">
        </a>
        <form action="search" class="search_form">
            <input type="text" class="form-control" placeholder="Search here.." aria-label="Search" name="keyword">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-strean navbar-toggler-icon"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
                <li class="dropdown nav-item">
                    <a href="#" class="dropbtn">Category</a>
                    <div class="dropdown-content">
                        <c:forEach items="${sessionScope.listCategory}" var="c">
                            <a class="hover-f" href="productofcategory?categoryId=${c.id}">${c.name}</a>
                        </c:forEach>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="login" class="account-link">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <span>
                            <c:set var="acc" value="${sessionScope.account}"/>
                            <c:if test="${acc == null}">
                                <a href="login.jsp">Login</a>
                            </c:if>
                            <c:if test="${acc != null}">
                                <a href="logout">${acc.username}</a>
                            </c:if>
                        </span>
                    </a>
                    <a href="carts" class="cart-link">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <span>
                            Cart ${sessionScope.carts.size()}
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
