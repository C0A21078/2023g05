<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<html>

<head>
    <meta charset="UTF-8">
    <title>退会申請</title>
    <link rel="icon" href="../gm_img/icon.jpg">
    <link rel="stylesheet" type="text/css" href="login.css">
</head>

<body>
    <div class="main">
        <p class="title" align="center">退会申請</p>
        <form action="./WithdrawalServlet5" method="post">
            <div class="input">
                <input class="uname" type="text" align="center" name="username" placeholder="Username" required>
                <input class="pass" type="password" align="center" name="password" placeholder="Password" required>
                <input class="submit" type="submit" align="center" value="入力完了"></a>
                <p class="trans" align="center"><a href="login.jsp">ログインページに戻る</p>
            </div>
        </div>
</body>

</html>