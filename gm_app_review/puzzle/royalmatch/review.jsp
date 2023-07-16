<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="../../../gm_img/icon.jpg">
  <title>レビューページ</title>
  <style>
    .slider-container {
      position: relative;
      width: 100%;
      overflow-x: scroll;
      white-space: nowrap;
    }

    .slider {
      display: flex;
      transition: transform 0.5s ease;
    }

    .slider img {
      width: 1024px;
      height: 300px;
      margin-right: 0.5rem;
    }


    .slider-button {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      width: 40px;
      height: 40px;
      background-color: transparent;
      border: none;
      cursor: pointer;
    }

    .slider-button-left {
      left: 10px;
    }

    .slider-button-right {
      right: 10px;
    }

    .collapse-content {
      display: none;
    }

    .collapse-toggle {
      cursor: pointer;
    }

    .popup-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      display: none;
      justify-content: center;
      align-items: center;
    }

    .popup-content {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      max-width: 600px;
      max-height: 400px;
      overflow-y: auto;
    }

    .collapse-toggle {
      cursor: pointer;
    }

    /* Added styles */

    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    h3 {
      margin-top: 40px;
      margin-bottom: 10px;
      color: #333;
    }

    p {
      margin: 0;
      color: #333;
    }

    img {
      width: 10%;
      height: auto;
    }

    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .review {
      background-color: #fff;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 20px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .review p {
      margin-bottom: 5px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    table th,
    table td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    table th {
      background-color: #f2f2f2;
      font-weight: bold;
    }

    .form-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
      max-width: 400px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }

    form {
      margin-top: 20px;
      width: 100%;
      max-width: 400px;
    }

    label {
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
      width: 80px;
      white-space: nowrap;
    }

    input[type="text"],
    input[type="number"],
    textarea {
      width: calc(100% - 100px);
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    input[type="submit"] {
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
</head>
<body>
  <h2>ゲーム情報とレビュー</h2>

  <div style="display: flex; align-items: center;">
    <img src="img/1.jpg" alt="アイコン">
    <span style="font-size: 45px; font-weight: bold;">ロイヤルマッチ</span>
  </div>

  <div class="slider-container">
    <div class="slider">
      <img src="img/2.jpg" alt="アイコン1">
      <img src="img/3.jpg" alt="アイコン2">
      <img src="img/4.jpg" alt="アイコン3">
      <img src="img/5.jpg" alt="アイコン4">
      <img src="img/6.jpg" alt="アイコン5">
    </div>
    <button class="slider-button slider-button-left" onclick="slideLeft()">&lt;</button>
    <button class="slider-button slider-button-right" onclick="slideRight()">&gt;</button>
  </div>

  <div class="popup-overlay" id="popup-overlay">
    <div class="popup-content">
      <div class="collapse-toggle" onclick="closePopup();">閉じる</div>
      <div id="collapse-content">
        <p>
          全く新しい冒険へようこそ！ 色を入れ替え、パズルを解き、城を飾り付け、コインを獲得しよう。
          Royal Castleは何千人ものファンが熱中する、手応えのあるマッチ3パズルです！ 色を3色以上順番につなげて盤面をきれいにして、パズルをクリアしよう！ 
          Royal Matchは基本無料でお楽しみもいっぱい！ 今すぐプレイしよう！
        </p>
        <p>
          Royal Matchでは、ロバート王が手伝いを必要としている。国王の城をセンス良く飾り付けてあげよう。
          マッチ3のステージの合間では慌てて素敵なエピソードを進める前に、王様のお城を訪ねてみよう！ 国王の城の部屋を完璧に仕上げてコインを受け取り、
          上品な家を建てて、ボーナスやおまけのブースターを入手して冒険を続けよう！
        </p>
        <p>
          可愛らしいパズルをたくさんお楽しみいただけます！ 新エピソードには無料のコイン、ユニークな賞品、驚きのタスク、素敵なエリア、
          究極のマッチパズルが含まれています！
        </p>
        <p>
          - マッチ3の上級者も初心者も楽しめる、ユニークなゲーム性と楽しいステージがいっぱい！
          - ボーナスステージで大量のコインと特別な財宝を集めよう！
          - 強力なブースターがアンロックされるのを待っている！ 炸裂させよう！
          - 道路に置かれた鳥、箱、薬、食器棚、ダイヤモンド、魔法の帽子、金庫、奇妙な郵便箱、ブタなどの邪魔な物には注意しよう！
          - 素敵なチェストを開けて、コイン、ブースター、パワーアップなどの目を見張るほどの報酬を入手しよう！
          - ロバート王の家の新しい部屋、王室の部屋、豪華な庭園、沢山のわくわくするエリアを探検しよう！
          - 王の部屋やキッチン、庭、ガレージなどの素敵な部屋を飾り付けよう！
          - Facebookでフレンドに挑戦し、ランキングの頂点に上り詰めよう！
        </p>
        <p>
          邪魔物を吹き飛ばして驚きのパワーアップを作り、楽しく難しいステージをクリアしよう！ 楽しいマッチ3のステージをプレイして、
          素敵なエリアを次々にアンロックしよう！ 今すぐ楽しもう！
        </p>
        <p>
          これで決まり：100％広告なし、Wi-Fi不要。ネット接続不要です。
          アイテムを入れ替えてずっと楽しめます。
          サポートが必要ですか？ Royal Matchアプリ内からサポートページに飛ぶか、contact@dreamgames.comまでメッセージをお送りください。
        </p>
      </div>
    </div>
  </div>

  <button class="collapse-toggle" onclick="openPopup();">このゲームについて</button>

  <script>
    const slider = document.querySelector('.slider');
    const slideWidth = slider.offsetWidth;
    const slideCount = slider.children.length;
    let slideIndex = 1;

    function slideLeft() {
      if (slideIndex === 1) {
        slideIndex = slideCount;
      } else {
        slideIndex--;
      }
      slider.style.transform = `translateX(-${(slideIndex - 1) * slideWidth}px)`;
    }

    function slideRight() {
      if (slideIndex === slideCount) {
        slideIndex = 1;
      } else {
        slideIndex++;
      }
      slider.style.transform = `translateX(-${(slideIndex - 1) * slideWidth}px)`;
    }

    function toggleCollapse() {
      var content = document.getElementById("collapse-content");
      if (content.style.display === "none") {
        content.style.display = "block";
      } else {
        content.style.display = "none";
      }
    }

    function openPopup() {
      var overlay = document.getElementById("popup-overlay");
      overlay.style.display = "flex";
    }

    function closePopup() {
      var overlay = document.getElementById("popup-overlay");
      overlay.style.display = "none";
    }
  </script>

<%-- 評価の統計情報を取得 --%>
<%!
  double averageRating = 0.0;
  int[] ratingCounts = new int[6]; // 評価値のカウントを格納する配列
%>

<%-- レビュー情報の取得と評価値の統計情報の計算 --%>
<%
  try {
    // データベースへの接続
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");

    // ステートメントの作成とSQL文の実行
    String sql = "SELECT star_rating, COUNT(*) as count FROM app_royalmatch_review GROUP BY star_rating";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    // 評価の合計とカウントの初期化
    int totalRating = 0;
    int totalCount = 0;

    // レビュー情報の表示と評価値の統計情報の計算
    while (rs.next()) {
      int starRating = rs.getInt("star_rating");
      int count = rs.getInt("count");
      totalRating += starRating * count;
      totalCount += count;
      ratingCounts[starRating] = count;
    }

    // 平均評価の計算
    averageRating = totalCount > 0 ? (double) totalRating / totalCount : 0.0;

    // データベース接続とステートメントのクローズ
    rs.close();
    stmt.close();
    con.close();
  } catch (Exception ex) {
    // エラーメッセージの表示
    out.println("データの取得に失敗しました。<br>" + ex.toString() + "<br>");
  }
%>

<%-- 評価の統計情報を表示 --%>
<h3>評価の統計</h3>
<p style="font-size: 20px; font-weight: bold;">評価の平均: ★<%= String.format("%.2f", averageRating) %> </p>
<table>
  <tr>
    <th>評価</th>
    <th>カウント</th>
  </tr>
  <% for (int i = 1; i <= 5; i++) { %>
  <tr>
    <td><%= "★".repeat(i) %></td>
    <td><%= ratingCounts[i] %></td>
  </tr>
  <% } %>
</table>

<%-- レビューの一覧表示 --%>
<h3>レビュー一覧</h3>
<%
  try {
    // データベースへの接続
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");

    // ステートメントの作成とSQL文の実行
    String sql = "SELECT * FROM app_royalmatch_review";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    // レビュー情報の表示
    while (rs.next()) {
      String userId = rs.getString("user_id");
      int starRating = rs.getInt("star_rating");
      String reviewText = rs.getString("review_text");
      Timestamp reviewDate = rs.getTimestamp("review_date");

      // ☆のグラフ表示用のスタイルを計算
      String starGraph = "";
      for (int i = 0; i < starRating; i++) {
        starGraph += "★";
      }

      %>
      <div class="review">
        <p><strong>評価:</strong> <%= starGraph %></p>
        <p><strong>ユーザー名:</strong> <%= userId %></p>
        <p><strong>レビュー:</strong> <%= reviewText %></p>
        <p><strong>投稿日時:</strong> <%= reviewDate %></p>
      </div>
      <%
    }

    // データベース接続とステートメントのクローズ
    rs.close();
    stmt.close();
    con.close();
  } catch (Exception ex) {
    // エラーメッセージの表示
    out.println("データの取得に失敗しました。<br>" + ex.toString() + "<br>");
  }
%>


  <%-- 新しいレビューの投稿フォーム --%>
  <h3>レビューを投稿する</h3>
  <div class="form-container">
    <form action="reviewInsert.jsp" method="post">
      <label for="userId">ユーザー名:</label>
      <input type="text" name="userId" required><br>
      <label for="rating">評価（1〜5）:</label>
      <input type="number" name="rating" min="1" max="5" required><br>
      <label for="reviewText">レビュー:</label>
      <textarea name="reviewText" rows="5" required></textarea><br>
      <input type="submit" value="投稿">
    </form>
  </div>
</body>
</html>
