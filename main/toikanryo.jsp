<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>問い合わせを以下の内容で送信しました</title>
    <link rel="icon" href="../gm_img/icon.jpg">
    <style>
        body {
            background-color: #F7F4E9;
            background-size: cover;
            background-repeat: no-repeat;
        }
        .go-to-button {
            margin-top: 20px;
        }
    
        .go-to-button button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
    
        .go-to-button button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function goToHome() {
            window.location.href = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/main.jsp";
        }
    </script>
</head>
<body>
    <h1>問い合わせを以下の内容で送信しました</h1>
    <%
        // フォームから送信されたデータを取得
        String name = request.getParameter("name");
        String furigana = request.getParameter("furigana");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String inquiry = request.getParameter("inquiry");
    %>
    <table>
        <tr>
            <td>名前:</td>
            <td><%= name %></td>
        </tr>
        <tr>
            <td>フリガナ:</td>
            <td><%= furigana %></td>
        </tr>
        <tr>
            <td>メールアドレス:</td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td>電話番号:</td>
            <td><%= phone %></td>
        </tr>
        <tr>
            <td>問い合わせ内容:</td>
            <td><%= inquiry %></td>
        </tr>
    </table>
    <div class="go-to-button">
        <button onclick="goToHome()">メインページに戻る</button>
    </div>
</body>