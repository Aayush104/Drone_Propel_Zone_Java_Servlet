<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.MessageModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/addProduct.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<%
    if(session.getAttribute("admin_mail") == null && session.getAttribute("user_mail") != null){
        response.sendRedirect(request.getContextPath()+"/pages/home.jsp");
    }
%>
<nav>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
    </div>
    <div class="nav-items">
        <ul>
            <li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/addProduct.jsp">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/AdminProductsServlet">View Products</a></li>
            <li><a href="${pageContext.request.contextPath}/AdminOrderServlet">View Orders</a></li>
        </ul>
    </div>
    <form action="${pageContext.request.contextPath}/UserLogout" method="post">
        <button type="submit" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
            LogOut
        </button>
    </form>
</nav>

<% List<MessageModel> messages = (List<MessageModel>) request.getAttribute("messages");
   if (messages != null && !messages.isEmpty()) {
       for (MessageModel message : messages) {
%>
<div class="Feedback">
    <h2>FeedBack and Messages</h2>
    <div class="box">
        <div class="message_box">
            <p>UserName: <%= message.getName() %></p>
            <p>Email: <%= message.getEmail() %></p>
            <p>Subject: <%= message.getSubject() %></p>
            <p>Message: <%= message.getMessage() %></p>
        </div>
    </div>
</div>
<%   }
   } else {
%>
<p>No Messages found.</p>
<%   }
%>

</body>
</html>
