<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>お気に入り一覧</title>
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
    <form action="FavoriteServlet" method="post">
    
        <input type="hidden" name="pageId" value="1">
        <label for="userID">あなたのユーザIDを入力:</label>
        <input type="text" name="userID" id="userID"><br>
        <input type="submit" value="完了">
    </form>
</body>
</html>
