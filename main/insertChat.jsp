<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
  <meta charset="UTF-8">
  <title>Chatデータをデータベースに挿入する</title>
  <link rel="stylesheet" href="insert.css">
</head>
<style>
    title {
    background-color: #333;
    color: #fff;
    padding: 20px;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f3f3f3;
      margin: 0;
      padding: 0;
    }

    h1 {
      font-size: 24px;
      color: #333;
      margin: 0 0 20px;
    }
</style>
<%
    String msg = "";
    try {
        String reviewerId = request.getParameter("reviewer_id");    // レビュアーIDを取得
        String reviewText = request.getParameter("review_text");    // レビューテキストを取得

        // データベースへの接続
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");

        // ステートメントの作成とSQL文の実行
        String sql = "INSERT INTO review_info (reviewer_id, review_text) VALUES (?, ?)";
        PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, reviewerId);
        pstmt.setString(2, reviewText);
        int result = pstmt.executeUpdate();

        // 生成された自動増分IDの取得
        ResultSet generatedKeys = pstmt.getGeneratedKeys();
        int generatedId = 0;
        if (generatedKeys.next()) {
            generatedId = generatedKeys.getInt(1);
        }

        // 処理結果のメッセージ作成
        // msg = Integer.toString(result) + " line insert successfully.<br>";
        msg += "管理IDは"      + "<br>" + "「"  + generatedId +"」"+ "<br>"+ "<br>";
        msg += "ユーザーIDは"  + "<br>" + "「"  + reviewerId  +"」"+ "<br>"+ "<br>";
        msg += "テキスト内容は"+ "<br>" + "<br>" + "「" + reviewText +"」"+ "<br>";
        // データベース接続とプリペアドステートメントのクローズ
        pstmt.close();
        con.close();
    } catch (Exception ex) {
        // エラーメッセージの作成
        msg = "Insertion failed.<br>";
        msg += ex.toString();
        msg += "<br>";
    }
%>

<body>
<h1>掲示板に書き込み完了しました。</h1>
<hr>
<%= msg %><br><br>
<hr>
<a href="http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/main.jsp">戻る</a>
<a href="http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/board/ChatShowServlet">一覧表に行く</a>
</body>
</html>
