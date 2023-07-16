<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, pnw.myWork.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>お気に入り追加</title>
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
    <h1>お気に入り追加</h1>
    
    <form action="./AddFavoriteServlet" method="post">
    
        <input type="hidden" name="pageId" value="1" required>
        <label for="userID">あなたのユーザID:</label>
        <input type="text" name="userID" id="userID" required><br>
        <label for="title">タイトル:</label>
        <input type="text" name="title" id="title" required><br>
        <label for="url">URL:</label>
        <input type="text" name="url" id="url" required><br>
        <input type="submit" value="追加">
    </form>
        
    <a href="favorite.jsp">お気に入り一覧</a>
</body>
</html>
