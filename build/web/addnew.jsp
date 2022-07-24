<%-- 
    Document   : update
    Created on : Mar 21, 2022, 9:25:18 PM
    Author     : GanKPoet
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add a new Product</h1>
    <c:set var="e" value="${requestScope.idp}"/>
    <form action="addnew" method="post">
        <input type="hidden"  name="id" value="${e.id}"/><br/>
        Enter Name:<input type="text"  name="name" value="${e.name}"/><br/>
        Enter Quantity:<input type="text" name="quantity" value="${e.quantity}"/><br/>
        Enter Price:<input type="text" name="price" value="${e.price}"/><br/>
        Enter ImageUrl:<input type="text" name="imageUrl" value="${e.imageUrl}"/><br/>
        Select CategoryID:
        <c:forEach items="${listCategory}" var="list">
            <input type="radio" name="categoryId" value="${list.id}" checked="checked" />${list.name}
        </c:forEach>
        <br/>
        <input type="submit" value="Add"/>
    </form>
</body>
</html>
