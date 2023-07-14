<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>   
    <head>
        <meta charset="UTF-8">
        <title>エラー</title>
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>     
<body>
<%
String error = (String)request.getAttribute("error");
%>
<div class="main">
    <p class="title" align="center">エラー発生</p>
    <p align="center">エラーコード：<%=error%></p>
    <p align="center">エラーが発生しました。</p>
    <p class="trans" align="center"><a href="register.jsp">ログインページに戻る</p>
</body>
</html>