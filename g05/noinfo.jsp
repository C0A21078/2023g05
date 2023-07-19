<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>情報なし</title>
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String name = (String)request.getAttribute("name");
String password = (String)request.getAttribute("pass");
%>
<div class="main">
    <p class="title" align="center">ユーザが存在しません</p>
    <p align="center">入力ユーザ名：<%=name%></p>
    <p align="center">入力パスワード：<%=password%></p>
    <p align="center">条件に合致するユーザは登録されていません。</p>
    <p class="trans" align="center"><a href="login.jsp">ログインページに戻る</p>
</body>
</html>