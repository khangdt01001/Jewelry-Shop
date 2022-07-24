
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accessories Jwelry</title>  
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>  
        <%@include file="Components/navbar.jsp" %>
        <section id="home">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/bg/bg-1.jpg" class="d-block w-100" alt="img-1">\
                        <div class="carousel-caption text-center">
                            <h1 class="k">Up to 40% off</h1>
                            <a href="productofcategory?categoryId=3" class="main-btn">Show now</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/bg/bg-2.jpg" class="d-block w-100" alt="img-2">
                        <div class="carousel-caption text-center">
                            <h1>Up to 50% off</h1>
                            <a href="productofcategory?categoryId=3" class="main-btn">Show now</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/bg/bg-3.jpg" class="d-block w-100" alt="img-3">
                        <div class="carousel-caption text-center">
                            <h1 class="k">Up to 60% off</h1>
                            <a href="productofcategory?categoryId=2" class="main-btn">Show now</a>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>

        <H2 style="text-align: center; padding-top: 60px">Our Products</H2>
        <div class="d-flex justify-content-evenly" style="padding-bottom: 50px">
            <div class="btn-group d-flex" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-secondary ms-2 flex-shrink-0"><a class="hover-f" href="home">All</a></button>
                <c:forEach items="${sessionScope.listCategory}" var="c">
                    <button type="button" class="btn btn-secondary ms-2 flex-shrink-0"><a class="hover-f" href="productofcategory?categoryId=${c.id}">${c.name}</a></button>
                    </c:forEach>
            </div>
        </div>
        <div class="row row-cols-xs-1 row-cols-md-3 g-4" style="margin-left: 50px ; margin-right: 50px">
            <c:forEach items="${listProduct}" var="p">
                <div class="col">
                    <div class="card">
                        <a href="detail?productId=${p.id}&categoryId=${p.categoryId}">
                            <img src="${p.imageUrl}" width="430px">
                        </a>
                        <a href="add-to-cart?productId=${p.id}" class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            Add to cart
                        </a>

                        <div class="card-body">
                            <h5 class="card-title">${p.name} : ${p.price}$</h5>
                            <p class="card-text">${p.describe}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:if test="${listProduct==null || listProduct.size()==0}">
            Not Found...
        </c:if>
        <c:if test="${listProduct!=null && listProduct.size()!=0}">
            <nav aria-label="Page navigation example" class="d-flex justify-content-center" >
                <ul class="pagination">
                    <li class="page-item">
                        <a <c:if test="${page!=1}">
                                <c:if test="${check==null && keyword==null}">
                                    href="home?page=${page-1}"
                                </c:if>  
                                <c:if test="${keyword!=null}">
                                    href="search?keyword=${keyword}&page=${page-1}"
                                </c:if>   
                                <c:if test="${check!=null}">
                                    href="productofcategory?categoryId=${check}&page=${page-1}"
                                </c:if>                            
                            </c:if> class="page-link" aria-label="Previous">
                            <span  aria-hidden="true"><</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPage}" var="i">
                        <c:if test="${check==null && keyword == null}">
                            <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                        </c:if>
                        <c:if test="${keyword != null}">
                            <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="search?keyword=${keyword}&page=${i}">${i}</a></li>
                        </c:if>
                        <c:if test="${check!=null}">
                            <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="productofcategory?categoryId=${check}&page=${i}">${i}</a></li>
                        </c:if>
                     </c:forEach>
                    <li class="page-item">
                        <a <c:if test="${page!=totalPage}">
                                <c:if test="${check==null && keyword==null}">
                                    href="home?page=${page+1}"
                                </c:if>  
                                <c:if test="${keyword!=null}">
                                    href="search?keyword=${keyword}&page=${page+1}"
                                </c:if>   
                                <c:if test="${check!=null}">
                                    href="productofcategory?categoryId=${check}&page=${page+1}"
                                </c:if>                            
                            </c:if> class="page-link" aria-label="Next">
                            <span  aria-hidden="true">></span>
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if> 
        <%@include file="Components/footer.jsp" %>
    </body>
</html>
