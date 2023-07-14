<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>登録失敗</title>
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String name = (String)request.getAttribute("username");
String password = (String)request.getAttribute("pass");
%>
<div class="main">
    <p class="title" align="center">登録失敗</p>
    <p align="center">入力ユーザ名：<%=name%></p>
    <p align="center">入力パスワード：<%=password%></p>
    <p align="center">このユーザ名及びパスワードは使用されています</p>
    <p class="trans" align="center"><a href="register.jsp">新規登録ページに戻る</p>
</body>
</html>