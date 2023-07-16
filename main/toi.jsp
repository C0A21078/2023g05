<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>問い合わせページ</title>
    <link rel="icon" href="../gm_img/icon.jpg">
    <style>
        body {
            background-color: #F7F4E9;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <h1>問い合わせフォーム</h1>
    <form action="toikanryo.jsp" method="post" onsubmit="return redirectToToikanryo()">
        <label for="name">名前:</label>
        <input type="text" name="name" id="name" required><br><br>
        
        <label for="furigana">フリガナ:</label>
        <input type="text" name="furigana" id="furigana" required><br><br>
        
        <label for="email">メールアドレス:</label>
        <input type="email" name="email" id="email" required><br><br>
        
        <label for="phone">電話番号:</label>
        <input type="text" name="phone" id="phone" required><br><br>
        
        <label for="inquiry">問い合わせ内容:</label><br>
        <textarea name="inquiry" id="inquiry" rows="5" cols="30" required></textarea><br><br>
        
        <input type="submit" value="送信">
    </form>

    <script>
        function redirectToToikanryo() {
            var form = document.querySelector("form");
            form.action = "toikanryo.jsp";
            return true;
        }
    </script>
</body>
</html>
