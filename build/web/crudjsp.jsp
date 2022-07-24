<%-- 
    Document   : list
    Created on : Feb 8, 2022, 3:30:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>The list of Products</h1>
        <h3><a href="addnew.jsp">Add New</a></h3>
        <table border="1px" style="width: 100%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>ImageUrl</th>
                <th>CategoryId</th>
                <td>Action</td>
            </tr>
            <c:forEach items="${requestScope.list}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>${e.quantity}</td>
                    <td>${e.price}</td>
                    <td>
                       <img src="${e.imageUrl}" width="100px">
                    </td>    
                    <td>${e.categoryId}</td>
                    <td><a href="update?id=${e.id}">Edit</a>
                    <a href="deleteadmin?id=${e.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
