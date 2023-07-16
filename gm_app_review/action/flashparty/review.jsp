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
    <span style="font-size: 45px; font-weight: bold;">フラッシュパーティー</span>
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
          スターダストウォーリアーズ、集結！
          楽しくてエキサイティングな格闘パーティーが、新しいスターダストウォーリアーズバージョンでグレードアップ！
        </p>
        <p>
          フラッシュパーティーは格闘スマホゲームです。面白いヒーローを選んで、パーティーで素晴らしい対決を行えます。
          攻撃、ジャンプ、回避、防御……様々なワザで敵をフィールド外にノックアウト！
        </p>
        <p>
          20名以上のさまざまなヒーローから好きなキャラを選べ、さらに新ヒーローが次々と登場！スターダストウォーリアーズ
          バージョンのバトルスタイルは全面的に進化し、4種類それぞれが独特なバトルシステムを備えています。自分にあったバトル
          スタイルを見つけ、次のパーティースターになろう！
        </p>
        <p>
          【勝つ方法】
          パーティーで勝つのが極めて簡単！他の人をステージからノックアウトすれば勝利！他のプレイヤーのヒーローを攻撃すると、そのヒーローの
          頭上に表示されるKOスコアが上がります。KOスコアが高いほど、攻撃を受けた際にノックアウトされる可能性も高くなります。
        </p>
        <p>
          【オリジナルキャラ】
          まん丸の雪ダルマ、天から降りる神界の試練官、りんごの形の頭をしている女子高校生と大人気のアイドル歌姫！こういった独特なオリジナルキャラがすべて
          フラッシュパーティーのバトルに登場！ヒーロー総数はすでに20名を以上いますが、今後も新ヒーローが次々と登場！
        </p>
        <p>
          【新システム】
          スターダストウォーリアーズバージョンのバトルシステムがアップグレード！
          ヒーローはバランス型、突進型、パワー型、牽制型の4種類に分けられ、それぞれ新しい専用バトルシステムが適用されます。
        </p>
        <p>
          バランス型：異なる方向から攻撃することでエネルギーを溜めて、スーパー必殺技を放つ
          突進型：特定のワザを命中させると、硬直をキャンセルし、コンボの可能性を作り出す
          パワー型：自身のKOスコアが高いほど、攻撃力も高くなる
          牽制型：シールドを攻撃することでエネルギーを溜めて、スーパー投げ技を放つ
        </p>
        <p>
          【プレイモード】
          毎日開放するシーンによって、クエスト、ルール、イベントも異なります。毎日、違うゲーム体験を楽しんでいただけます。
          ここで1v1、2v2、4人バトルロイヤル、サッカーモードなど、さまざまな対戦を楽しめます。さらに週末限定のイベントモード、
          いつでもフレンドと対戦できるフレンドバトルモードなど盛りだくさんです。
          対戦スキルを磨きたいプレイヤーは、頂上競技場へお越し下さい！頂上1v1、頂上リレー、頂上チーム戦などのモードで順位を競い、
          パーティーのマスター級プレイヤーになりましょう！
        </p>
        <p>
          【カスタム装飾】
            探偵団、プールパーティー、東のレジェンド、星渡る冒険など、様々なテーマのヒーロースキン、KOエフェクトとその他の装飾を集め、
            パーティーの輝かしいスターになりましょう！
        </p>
        <p>
          【楽しいソーシャル】
          パーティーでフレンドをたくさん作り、一緒にチーム作戦や練習を行いましょう。ヒーローバナーを編集し、積み重ねてきた実績をアッピールしましょう。
          ヒーローポイントと競技場ランキングの地区ランクを競い、屈指の格闘達人になりましょう。ここでは色んな方法で他の人と楽しい格闘パーティーを楽しめます！
        </p>
        <p>
          公式SNSアカウント始動！
          『フラッシュパーティー』に関する最新情報を公式SNSアカウントがお届けします！ さまざまなキャラクターと攻略情報を紹介しておりますし、
          さらにプレイヤー同士の対戦イベントも開催されますので、ぜひチェックしてください。
        </p>
        <p>
          公式サイト：http://fp.xd.com/
          公式Twitter：@FlashPartyJP
          公式Discord：https://discord.gg/8WrKfjtaf6
          公式TikTok：https://vt.tiktok.com/ZSeak3Eg7/
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
    String sql = "SELECT star_rating, COUNT(*) as count FROM app_flashparty_review GROUP BY star_rating";
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
    String sql = "SELECT * FROM app_flashparty_review";
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
