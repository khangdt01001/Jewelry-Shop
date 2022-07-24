
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
        <div class="container mt-5 mb-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="text-left logo p-2 px-5"><a href="home"><img src="images/logo.png" ></a>  </div>
                        <div class="invoice p-5">
                            <h5>Your order Confirmed!<span>You order has been confirmed and will be shipped in next two days!</span>

                                <div class="product border-bottom table-responsive">
                                    <table class="table table-borderless">
                                    </table>
                                </div>
                                <p>We will be sending shipping confirmation email when the item shipped successfully!</p>
                                <p class="font-weight-bold mb-0">Thanks for shopping with us!</p> <span><a href="home" style="color: #ff553e">Jewellery</a></span>
                        </div>
                        <div class="d-flex justify-content-between footer p-3"> <span>Need Help? visit our </span> <span><div id="current_date"></p>
                                    <script>
                                        document.getElementById("current_date").innerHTML = Date();
                                    </script></span> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>
