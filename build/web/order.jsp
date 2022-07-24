
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
        <!-- Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 700px">
                <h3 class="text-ff553e" style="margin-top: 60px">My Carts</h3>
                <div class="row">
                    <div class="col-md-8 order"> 
                        <h3>List Product</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cartss}" var="c">
                                    <tr>
                                <input type="hidden" name="productId" value="${c.value.product.id}"/>
                                <th scope="row">${c.value.product.id}</th>
                                <td><img src="${c.value.product.imageUrl}" width="60"></td>
                                <th>${c.value.product.name}</th>
                                <td>${c.value.product.price}</td>
                                <td>${c.value.quantity}</td>
                                <td>${c.value.product.price*c.value.quantity}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-10"><h3>Total : ${total}$ </h3></div>
                        </div>
                    </div>
                    <div class="col-md-4 order">
                        <h3 class="text-ff553e">My Information</h3>
                        <form action="order" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label ">Name</label>
                                <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label ">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label ">Address</label>
                                <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="note" class="form-label ">Note</label>
                                <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-secondary hover-f w-100">Submit</button>
                        </form>
                    </div>
                </div>

            </div>
        </section>
        <%@include file="Components/footer.jsp" %>
    </body>
</html>
