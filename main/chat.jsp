<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, pnw.board.*"%>
<html>  
    <head>
        <meta charset="UTF-8">
        <title>掲示板</title>
        <link rel="icon" href="../gm_img/icon.jpg">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f3f3f3;
                margin: 0;
                padding: 0;
            }
    
            h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }
    
            table {
                width: 100%;
                border-collapse: collapse;
            }
    
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ccc;
            }
    
            form {
                margin-top: 20px;
            }
    
            input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
    
            input[type="submit"], input[type="button"] {
                padding: 8px 16px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
    
            input[type="submit"]:hover, input[type="button"]:hover {
                background-color: #45a049;
            }
            .form-group {
            margin-bottom: 10px;
            }

            .form-group label {
            display: inline-block;
            width: 100px;
            }

            .form-group input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
            }

            .button-group input[type="submit"],
            .button-group input[type="button"] {
            padding: 8px 16px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
            }

            .button-group input[type="submit"]:hover,
            .button-group input[type="button"]:hover {
            background-color: #45a049;
            }

        </style>
    </head>      
<body>
<h1>コメントチャット</h1>
<table border="1">
<tr>
    <td>管理ID</td>
    <td>ユーザーID</td>
    <td>テキスト</td>
</tr>
<%
//Servletで設定されたリストを取得する．
ArrayList<ChatInfoBean> list = (ArrayList<ChatInfoBean>)request.getAttribute("userlist");
Iterator<ChatInfoBean> ite = list.iterator();

//結果の表示
while(ite.hasNext()){
    ChatInfoBean bean = ite.next();
%>
<%-- HTML内にJSPコードをスクリプト式として埋め込む--%>
    <tr>
    <td><%=bean.getReview_id()%></td>
    <td><%=bean.getReviewer_id()%></td>
    <td><%=bean.getReview_text()%></td>
    </tr>
<%
}
%>
</table>
<hr/>
更新と削除は，管理ID指定が必用です．
<form action="./ChatProcessServlet" method="post">
    <div class="form-group">
      <label for="review_id">管理ID:</label>
      <input type="text" name="review_id" id="review_id">
    </div>
    <div class="form-group">
      <label for="reviewer_id">ユーザーID:</label>
      <input type="text" name="reviewer_id" id="reviewer_id">
    </div>
    <div class="form-group">
      <label for="review_text">テキスト:</label>
      <input type="text" name="review_text" id="review_text">
    </div>
    <div class="button-group">
      <input type="submit" name="btn" value="更新">
      <input type="submit" name="btn" value="削除">
      <input type="button" value="メインページに戻る" onclick="window.location.href='http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/main.jsp';">
    </div>
  </form>
</html>
