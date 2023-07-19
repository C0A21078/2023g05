<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>退会確認</title>
        <link rel="icon" href="../gm_img/icon.jpg">
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String name = (String)request.getAttribute("name");
String password = (String)request.getAttribute("pass");
%>
<div class="main">
    <form action="./ConfirmationServlet5" method="post">
        <p class="title" align="center">退会確認</p>
        <p align="center">入力ユーザ名：<%=name%></p>
        <p align="center">入力パスワード：<%=password%></p>
        <p align="center">上記のユーザが退会します。</p>
        <p align="center">よろしいですか？</p>
        <input class="submit" type="submit" align="center" value="同意"></a>
        <input type="hidden" align="center" name="username" value="<%=name%>" placeholder="Username" required>
        <input type="hidden" align="center" name="password" value="<%=password%>" placeholder="Password" required>
        <p class="trans" align="center"><a href="login.jsp">ログインページに戻る</p>
    </form>
</body>
</html>