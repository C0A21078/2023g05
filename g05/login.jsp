<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<html>

<head>
    <link rel="stylesheet" href="login.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="login.css">
    <title>ログイン</title>
    <link rel="icon" href="../gm_img/icon.jpg">
</head>

<body>
  <div class="main">
    <p class="title" align="center">ログインページ</p>
    <form action="./LoginServlet5" method="post">
        <div class="input">
            <input class="uname" type="text" align="center" name="username" placeholder="Username" required>
            <input class="pass" type="password" align="center" name="password" placeholder="Password" required>
            <input class="submit" type="submit" align="center" value="ログイン"></a>
            <p class="trans" align="center"><a href="register.jsp">新規登録<class="trans" align="center"><a href="withdrawal.jsp">退会申請</p>
            <!-- <p class="trans" align="center"><a href="withdrawal.jsp">退会申請</p> -->
        </div>
    </div>
</body>

</html>