<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, pnw.board.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GameVerse</title>
    <link rel="icon" href="../gm_img/icon.jpg">
    <link rel="stylesheet" href="main.css">
</head>
<script>
  // タブの切り替え処理
  function openTab(tabName) {
      var i, genreContent, tabLinks;
      genreContent = document.getElementsByClassName("genre-content");
      for (i = 0; i < genreContent.length; i++) {
          genreContent[i].style.display = "none";
      }
      tabLinks = document.getElementsByTagName("a");
      for (i = 0; i < tabLinks.length; i++) {
          tabLinks[i].classList.remove("active");
      }
      document.getElementById(tabName).style.display = "block";
      event.currentTarget.classList.add("active");
  }
  
  // 初期表示時に最初のタブを表示
  window.addEventListener("DOMContentLoaded", function() {
      document.getElementById("action").style.display = "block";
      document.querySelector("nav ul li a").classList.add("active");
  });
</script>

<body>

  <header class="header-container">
    <img src="../gm_img/icon-kiri.png" alt="GameVerseのロゴ" class="logo">
    <h1 class="title">GameVerse</h1>

    <div class="header-buttons">
      <!-- 検索バー -->
      <div class="search-bar">
        <input type="text" placeholder="検索...">
        <button>検索</button>
      
        <span>&nbsp;</span>
      
      <!-- お気に入りボタン -->
      <button id="myButton" onclick="myFunction3()">お気に入り</button>
      <script>
      function myFunction3() {
        window.location.href = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/myWork/add_favorite.jsp";
      }
      </script>
      </div>
  </header>
    

<!--タブの中身-->
<nav>
  <ul>
      <li><a href="#" onclick="openTab('action')">アクション</a></li>
      <li><a href="#" onclick="openTab('rpg')">ロールプレイングゲーム</a></li>
      <li><a href="#" onclick="openTab('puzzle')">パズル</a></li>
      <li><a href="#" onclick="openTab('adventure')">アドベンチャー</a></li>
      <li><a href="#" onclick="openTab('racing')">レース</a></li>
      <li><a href="#" onclick="openTab('shooting')">シューティング</a></li>
      <li><a href="#" onclick="openTab('simulation')">シミュレーション</a></li>
      <li><a href="#" onclick="openTab('sandbox')">サンドボックス</a></li>
      <li><a href="#" onclick="openTab('music')">音楽</a></li>
      <li><a href="#" onclick="openTab('table')">テーブル</a></li>
  </ul>
</nav>

<div class="sidebarR">
  <img src="../gm_img/Ad/bb0.png" alt="Ad 0">
  <img src="../gm_img/Ad/bb1.png" alt="Ad 1">
  <img src="../gm_img/Ad/bb2.png" alt="Ad 2">
  <img src="../gm_img/Ad/bb3.png" alt="Ad 3">
  <img src="../gm_img/Ad/bb4.png" alt="Ad 4">
  <a href="http://pnw.cloud.cs.priv.teu.ac.jp:8080/c0a2107885/main/main.jsp">緊急用URL⇒テスト環境へ<br>
                                                                             (ローカルではない)<br>
                                                                            掲示板の更新と<br>削除が動かないため<br></a>
</div>
  

<div class="main-content">
    <div id="action" class="genre-content">
        <h2>アクションゲーム</h2>
        <div class="gamegenre">
          <%
            try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
      
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'action' AND game_id IN (7, 8, 9)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
      
              // 結果の取得と表示
              while (rs.next()) {
                String gameName = rs.getString("game_name");
                Date releaseDate = rs.getDate("release_date");
                String gameGenre = rs.getString("game_genre");
                String imageURL = "";
                String redirectURL = "";
      
                // ゲームIDに応じて画像URLと遷移先URLを設定
                int gameID = rs.getInt("game_id");
                if (gameID == 7) {
                  imageURL = "../gm_img/action/flashparty.jpg";
                  redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/action/flashparty/review.jsp";
                } else if (gameID == 8) {
                  imageURL = "../gm_img/action/mariorun.jpg";
                  redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/action/mariorun/review.jsp";
                } else if (gameID == 9) {
                  imageURL = "../gm_img/action/monsuto.jpg";
                  redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/action/monsuto/review.jsp";
                }
          %>
                <div class="game-info">
                  <a href="<%= redirectURL %>"onclick="incrementClickCount(<%= gameID %>)">
                    <img src="<%= imageURL %>">
                  </a>
                  <div class="game-details">
                    <p><strong>ゲーム名:</strong> <%= gameName %></p>
                    <p><strong>発売日  :</strong> <%= releaseDate %></p>
                    <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                  </div>
                </div>
          <%
              }
      
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
            } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
            }
          %>
        </div>
      </div>

    <div id="rpg" class="genre-content">
        <h2>ロールプレイングゲーム</h2>
        <div class="gamegenre">
            <%
              try {
                  // データベースへの接続
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
        
                  // ステートメントの作成とSQL文の実行
                  String sql = "SELECT * FROM game_info WHERE game_genre = 'rpg' AND game_id IN (1,2,3)";
                  Statement stmt = con.createStatement();
                  ResultSet rs = stmt.executeQuery(sql);
        
                  // 結果の取得と表示
                  while (rs.next()) {
                      String gameName = rs.getString("game_name");
                      Date releaseDate = rs.getDate("release_date");
                      String gameGenre = rs.getString("game_genre");
                      String imageURL = "";
                      String redirectURL = "";
        
                      // ゲームIDに応じて画像URLを設定
                      int gameID = rs.getInt("game_id");
                      if (gameID == 1) {
                          imageURL = "../gm_img/rpg/dorakuev.jpg"; 
                          redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/rpg/dorakuev/review.jsp";
                      } else if (gameID == 2) {
                          imageURL = "../gm_img/rpg/genshin.jpg";
                          redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/rpg/genshin/review.jsp";
                      } else if (gameID == 3) {
                          imageURL = "../gm_img/rpg/haripota.jpg";
                          redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/rpg/haripota/review.jsp";
                      }
        
                      %>
                      <div class="game-info">
                        <a href="<%= redirectURL %>">
                          <img src="<%= imageURL %>">
                        </a>
                        <div class="game-details">
                          <p><strong>ゲーム名:</strong> <%= gameName %></p>
                          <p><strong>発売日  :</strong> <%= releaseDate %></p>
                          <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                        </div>
                      </div>
                      <%
                  }
        
                  // データベース接続とステートメントのクローズ
                  stmt.close();
                  con.close();
              } catch (Exception ex) {
                  // エラーメッセージの作成
                  String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
                  out.println(errorMsg);
              }
            %>
          </div>
        </div>
    </div>

    <div id="shooting" class="genre-content">
      <h2>シューティングゲーム</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'shooting' AND game_id IN (16, 17, 18)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 16) {
                      imageURL = "../gm_img/shooting/cod.jpg"; 
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 17) {
                      imageURL = "../gm_img/shooting/dadasaba.jpg";
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 18) {
                      imageURL = "../gm_img/shooting/sniper3d.jpg";
                      redirectURL = "https://example.com/flashparty";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

    <div id="puzzle" class="genre-content">
        <h2>パズルゲーム</h2>
        <div class="gamegenre">
            <%
              try {
                  // データベースへの接続
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
        
                  // ステートメントの作成とSQL文の実行
                  String sql = "SELECT * FROM game_info WHERE game_genre = 'puzzle' AND game_id IN (22, 23, 24)";
                  Statement stmt = con.createStatement();
                  ResultSet rs = stmt.executeQuery(sql);
        
                  // 結果の取得と表示
                  while (rs.next()) {
                      String gameName = rs.getString("game_name");
                      Date releaseDate = rs.getDate("release_date");
                      String gameGenre = rs.getString("game_genre");
                      String imageURL = "";
                      String redirectURL = "";
        
                      // ゲームIDに応じて画像URLを設定
                      int gameID = rs.getInt("game_id");
                      if (gameID == 22) {
                          imageURL = "../gm_img/puzzle/fishdom.jpg"; 
                          redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/puzzle/fishdom/review.jsp";
                      } else if (gameID == 23) {
                          imageURL = "../gm_img/puzzle/royalmatch.jpg";
                          redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/puzzle/royalmatch/review.jsp";
                      } else if (gameID == 24) {
                          imageURL = "../gm_img/puzzle/tumutumu.jpg";
                          redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/puzzle/tumutumu/review.jsp";
                      }
        
                      %>
                      <div class="game-info">
                        <a href="<%= redirectURL %>">
                          <img src="<%= imageURL %>">
                        </a>
                        <div class="game-details">
                          <p><strong>ゲーム名:</strong> <%= gameName %></p>
                          <p><strong>発売日  :</strong> <%= releaseDate %></p>
                          <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                        </div>
                      </div>
                      <%
                  }
        
                  // データベース接続とステートメントのクローズ
                  stmt.close();
                  con.close();
              } catch (Exception ex) {
                  // エラーメッセージの作成
                  String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
                  out.println(errorMsg);
              }
            %>
          </div>
        </div>

  <div id="adventure" class="genre-content">
      <h2>アドベンチャーゲーム</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'adventure' AND game_id IN (10,11,12)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 10) {
                      imageURL = "../gm_img/adventure/dorakuewalk.jpg"; 
                      redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/adventure/dorakuewalk/review.jsp";
                  } else if (gameID == 11) {
                      imageURL = "../gm_img/adventure/minecraft.jpg";
                      redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/adventure/minecraft/review.jsp";
                  } else if (gameID == 12) {
                      imageURL = "../gm_img/adventure/pikmin.jpg";
                      redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/adventure/pikmin/review.jsp";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

  <div id="racing" class="genre-content">
      <h2>レースゲーム</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'racing' AND game_id IN (13,14,15)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 13) {
                      imageURL = "../gm_img/racing/asphalt9.jpg"; 
                      redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/racing/asphalt9/review.jsp";
                  } else if (gameID == 14) {
                      imageURL = "../gm_img/racing/charisog.jpg";
                      redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/racing/charisog/review.jsp";
                  } else if (gameID == 15) {
                      imageURL = "../gm_img/racing/mariokart.jpg";
                      redirectURL = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/gm_app_review/racing/mariokart/review.jsp";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

  <div id="simulation" class="genre-content">
      <h2>シミュレーションゲーム</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'simulation' AND game_id IN (4,5,6)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 4) {
                      imageURL = "../gm_img/simulation/dobutunomori.jpg"; 
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 5) {
                      imageURL = "../gm_img/simulation/hosinosimanonyanko.jpg";
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 6) {
                      imageURL = "../gm_img/simulation/sozotowns.jpg";
                      redirectURL = "https://example.com/flashparty";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

  <div id="sandbox" class="genre-content">
      <h2>サンドボックス</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'sandbox' AND game_id IN (28,29,30)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 28) {
                      imageURL = "../gm_img/sandbox/lifeafter.jpg"; 
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 29) {
                      imageURL = "../gm_img/sandbox/terraria.jpg";
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 30) {
                      imageURL = "../gm_img/sandbox/eartheditor.jpg";
                      redirectURL = "https://example.com/flashparty";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

  <div id="music" class="genre-content">
      <h2>音楽ゲーム</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'music' AND game_id IN (19,20,21)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 19) {
                      imageURL = "../gm_img/music/mahotile.jpg"; 
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 20) {
                      imageURL = "../gm_img/music/puroseka.jpg";
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 21) {
                      imageURL = "../gm_img/music/taitatup.jpg";
                      redirectURL = "https://example.com/flashparty";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

  <div id="table" class="genre-content">
      <h2>テーブルゲーム</h2>
      <div class="gamegenre">
        <%
          try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
    
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM game_info WHERE game_genre = 'table' AND game_id IN (25,26,27)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
    
              // 結果の取得と表示
              while (rs.next()) {
                  String gameName = rs.getString("game_name");
                  Date releaseDate = rs.getDate("release_date");
                  String gameGenre = rs.getString("game_genre");
                  String imageURL = "";
                  String redirectURL = "";
    
                  // ゲームIDに応じて画像URLを設定
                  int gameID = rs.getInt("game_id");
                  if (gameID == 25) {
                      imageURL = "../gm_img/table/jantama.jpg"; 
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 26) {
                      imageURL = "../gm_img/table/yugio.jpg";
                      redirectURL = "https://example.com/flashparty";
                  } else if (gameID == 27) {
                      imageURL = "../gm_img/table/sorithia.jpg";
                      redirectURL = "https://example.com/flashparty";
                  }
    
                  %>
                  <div class="game-info">
                    <a href="<%= redirectURL %>">
                      <img src="<%= imageURL %>">
                    </a>
                    <div class="game-details">
                      <p><strong>ゲーム名:</strong> <%= gameName %></p>
                      <p><strong>発売日  :</strong> <%= releaseDate %></p>
                      <p><strong>ジャンル:</strong> <%= gameGenre %></p>
                    </div>
                  </div>
                  <%
              }
    
              // データベース接続とステートメントのクローズ
              stmt.close();
              con.close();
          } catch (Exception ex) {
              // エラーメッセージの作成
              String errorMsg = "データの取得に失敗しました。<br>" + ex.toString() + "<br>";
              out.println(errorMsg);
          }
        %>
      </div>
    </div>

</div>

<footer class="footer-container">
  <img src="../gm_img/icon-kiri.png" alt="GameVerseのロゴ" class="logo">
  <h1>GameVerse</h1>
  <span>&nbsp;</span>
  <!--問い合わせ、採用情報ボタン-->
  <div style="display: flex; flex-direction: row; gap: 10px;">
    <button id="myButton" onclick="myFunction()">お問い合わせ</button>
    <button id="myButton2" onclick="myFunction2()">採用情報</button>
  </div>
  <script>
    function myFunction() {
      window.location.href = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/toi.jsp"; // Replace with your desired URL
    }
  
    function myFunction2() {
      window.location.href = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/saiyo.jsp"; // Replace with your desired URL
    }
  </script>
</footer>

<!-- 掲示板 -->
<!-- main.jspには追加書き込みと一覧表に飛べるボタン -->
<div class="board">
    <h2>掲示板に書き込み</h2>
    <form method="POST" action="http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/insertChat.jsp">
        <fieldset>
        <legend>メッセージを送る</legend>
          ユーザー名　<input size="20" type="text" name="reviewer_id" required><br>
          テキスト　<input size="20" type="text" name="review_text" required> <br>
          <input type="submit" value="送信">
          <input type="button" value="一覧表" onclick="window.location.href='http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/board/ChatShowServlet';">
        </fieldset>
      </form>
    </form>
</div>

</body>
</html>