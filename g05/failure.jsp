<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>ログイン失敗</title>
        <link rel="icon" href="../gm_img/icon.jpg">
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String name = (String)request.getAttribute("name");
String password = (String)request.getAttribute("pass");
%>
<div class="main">
    <p class="title" align="center">ログイン失敗</p>
    <p align="center">入力ユーザ名：<%=name%></p>
    <p align="center">入力パスワード：<%=password%></p>
    <p align="center">ログインに失敗しました。</p>
    <p class="trans" align="center"><a href="login.jsp">ログインページに戻る</p>
</body>
</html>