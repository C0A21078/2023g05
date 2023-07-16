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
    <span style="font-size: 45px; font-weight: bold;">原神</span>
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
          オープンワールドRPG『原神』。本作であなたは旅人となり「テイワット」という幻想世界を冒険していく。
          この広大な世界を自由に旅し、個性も能力も豊かな仲間たちと共に強敵を打ち倒して、生き別れた兄妹を探そう。
          もちろん、目的もなく好奇心のまま探索したり、大陸に散りばめられた謎を解いたりと楽しみ方はあなた次第……
          生き別れた兄妹と再会を果たすその日まで、旅は続いていく
        </p>
        <p>
          ◆あらすじ
          無数の生命が集まり繁栄する広大な地「テイワット」、天地万象が集いし大陸。
          ここは七神に統治された、七つの元素が絡み合う世界……
          
          見知らぬ空の下、旅人は砂浜に立っていた。
          あなたは旅をする双子の片割れ、外の世界から漂流をしてきた者。見知らぬ神に唯一の血縁者を奪われたあなたは、自身もその神に封印され、眠りに落ちていた。
          再び目を覚ました時、天地の情景は一変していた……
        </p>
        <p>
          ◆オープンワールドと自由探索
          オープンワールドRPG『原神』。「テイワット」大陸に足を踏み入れた時から、旅人は自身のスタミナと相談しつつ山々や川を越えていき、やがて果て無き美しい
          風景と出会うことができるだろう。もし彷徨う仙霊や奇妙な装置を見つけたら近寄ってみると良い。新たな驚きがあなたを待っているかもしれない。
        </p>
        <p>
          ◆元素反応と戦略
          遥か遠くのテイワット大陸は、風・炎・雷・水・氷・草・岩の七つの元素が絡み合う世界。神に選ばれた者は、元素の力を操る「神の目」を授かり、強敵を打ち倒すことになっていく。
          水と炎の「蒸発」反応、炎と雷の「過負荷」反応、雷と水の「感電」反応など…異なる敵に対して異なる対策を取ることが、勝利への近道となる。
        </p>
        <p>
          ◆高品質なアートと音楽
          『原神』は透き通るような美しいアートスタイルを実現している。リアルタイムで描画されるゲームCGと、モーションキャプチャで緻密な調整がされたキャラクターの動作が
          『原神』の高品質な演出を彩っていく。24時間で移りゆく昼夜と共に、ロンドン・フィルハーモニー管弦楽団、上海交響楽団、東京フィルハーモニー交響楽団と日本一流の民楽アーティスト
          による華麗な演奏に耳を傾けてみてはいかがだろうか。
        </p>
        <p>
          ◆仲間たちと出る冒険の旅
          冒険の旅の中では個性や能力の豊かな仲間たちがあなたを待っている。チームの配置を変えたり、素材を入手して仲間を強化したりし、強敵や秘境に挑戦していこう。絶雲の頂に立ち、
          この世界をその目に刻む。離れ離れとなった兄妹と再会し、「原神」の謎を解き明かすその日まで旅は続いていくことだろう…さあ、行こう、旅人よ。真の冒険はここから始まるの
        </p>
        <p>
          ◆豪華声優陣が続々出演（五十音順）
          井口祐一、井澤詩織、石田彰、入野自由、石見舞菜香、植田佳奈、上田麗奈、内田真礼、内田雄馬、内山昂輝、梅原裕一郎、遠藤綾、逢坂良太、大原さやか、小澤亜李、小野賢章、加隈亜衣、
          門脇舞以、金田朋子、金元寿子、川澄綾子、喜多村英梨、鬼頭明里、木村良平、釘宮理恵、久野美咲、小岩井ことり、古賀葵、小清水亜美、小林沙苗、小原好美、斉藤壮馬、斎藤千和、佐倉綾音、
          佐藤利奈、沢城みゆき、三瓶由布子、庄子裕衣、島﨑信長、洲崎綾、铃代纱弓、瀬戸麻沙美、高尾奏音、たかはし智秋、高橋李依、田中理恵、田村ゆかり、富田美憂、鳥海浩輔、西川貴教、野島健児、
          畠中祐、花守ゆみり、早見沙織、福原綾香、藤田茜、堀江瞬、前川涼子、前野智昭、増谷康紀、松岡禎丞、水橋かおり、皆川純子、三森すずこ、村瀬歩、森田成一、悠木碧、遊佐浩二、柚木涼香 他（敬称略）
        </p>
        <p>
          ◆アプリ価格
          アプリ本体：基本プレイ無料
          ※一部有料アイテムがございます
          ご利用前に必ず利用規約をご確認ください。
          
          ◆最新情報はこちらから
          
          〔公式サイト〕
          https://genshin.hoyoverse.com/ja
          
          〔公式Twitter〕
          https://twitter.com/Genshin_7
        </p>
        <p>
          ◆ヘルプ・お問い合わせ
          レビュー欄や公式Twitterへのご質問は個別にお答えいたしかねます。
          各種お問い合わせにつきましては、下記窓口までご連絡ください。
          ※ゲームにアクセスできない場合は、必要事項をご記入のうえ、下記メールアドレスまでお送りください。

          ▼ご意見・ご要望
          ゲーム内：パイモンのボタンを押す→「報告」を押す→「アドバイス」

          ▼不具合情報
          ゲーム内：パイモンのボタンを押す→「報告」を押す→「カスタマーサポートに連絡」
        </p>
        <p>
          ▼ユーザーサポート
          genshin_jp@hoyoverse.com
          ▼課金関連
          genshin_jp_payment@hoyoverse.com
          【お問い合わせの際に記入して頂きたい内容】
          ‣ご利用端末とOS情報
          ‣トラブルの詳細
          ‣お客様の数字ID
          ‣創世結晶が反映されない問題は、お客様の数字IDと注文番号・購入内容を含めたスクリーンショットをお送りください
          ‣ご意見・ご要望
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
    String sql = "SELECT star_rating, COUNT(*) as count FROM app_genshin_review GROUP BY star_rating";
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
    String sql = "SELECT * FROM app_genshin_review";
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
