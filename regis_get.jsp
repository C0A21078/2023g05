<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>登録完了</title>
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String name = (String)request.getAttribute("name");
%>
<div class="main">
    <p class="title" align="center">登録完了</p>
    <p align="center"><%=name%>さんのユーザ登録が完了しました!</p>
    <p class="trans" align="center"><a href="login.jsp">ログインページへ</p>
</body>
</html>
