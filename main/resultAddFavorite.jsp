<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>お気に入り</title>
    <link rel="icon" href="../gm_img/icon.jpg">
    <style>
        body {
            background-image: url(a.jpg);
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
    </head>
    <body>
    <%
    LinkedHashMap map = (LinkedHashMap)request.getAttribute("map");
    %>
    <h1>お気に入りに追加しました</h1>
    <%=(String)map.get("title")%>
    <%=(String)map.get("url")%>
    <a href="favorite.jsp">お気に入り一覧</a>
    </body>
</html>