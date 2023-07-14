<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>ログイン成功</title>
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String username = (String)request.getAttribute("username");
%>
<div class="main">
    <p class="title" align="center">ログイン成功</p>
    <p align="center"><%=username%>さん，こんにちは。</p>
    <p class="trans" align="center"><a href="http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/main.jsp">メインページへ</p>
</body>
</html>
