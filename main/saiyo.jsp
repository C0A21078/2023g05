<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, pnw.board.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>採用情報</title>
    <link rel="icon" href="../gm_img/icon.jpg">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script>
        function showContent(task) {
            var contents = document.getElementsByClassName("task-content");
            for (var i = 0; i < contents.length; i++) {
                contents[i].style.display = "none";
            }
            
            var selectedContent = document.getElementById(task + "-content");
            if (selectedContent) {
                selectedContent.style.display = "block";
            }
        }

        function goToHome() {
            window.location.href = "http://pnw.cloud.cs.priv.teu.ac.jp:8080/2023g05/main/main.jsp";
        }
    </script>
</head>
<body>
    <div class="navbar">
        <ul style="display: flex;">
            <li><a href="#" onclick="showContent('task1')"><img src="../hutta-img/sinsotu.png"></a></li>
            <li><a href="#" onclick="showContent('task2')"><img src="../hutta-img/chuto.png"></a></li>
        </ul>
    </div>

    <div id="task1-content" class="task-content" style="display: none;">
        <h1><font color="red">新卒採用</font></h1>
        <p>新卒採用のお知らせ</p>

            <p>私たちは、情熱的な新卒エンジニアの方々を募集しています！ゲーム業界に興味を持ち、クリエイティブなアイデアと技術力を発揮したい方は、ぜひ私たちのチームに参加してください。</p>
            
            <p><font color="#808000">【募集要項】</font></p>
            
            <p>役職: エントリーレベルのゲームアプリエンジニア</p>
            <p>業務内容: ゲームアプリの開発・設計・テストなど</p>
            <p>必要なスキル:プログラミング言語（例: Java, C++, Unity）</p>
            <p>ゲーム開発に関する知識・経験</p>
            <p>チームでの協力とコミュニケーション能力</p>

            
            <p>私たちはゲームアプリ業界での成長と革新に情熱を持って取り組んでいます。あなたの才能と情熱を私たちのチームに加え、一緒に素晴らしいゲーム体験を作りましょう。
        </p>
        <div class="saiyo">
          <%
            try {
              // データベースへの接続
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
      
              // ステートメントの作成とSQL文の実行
              String sql = "SELECT * FROM saiyo_info WHERE saiyo_id IN (1)";
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery(sql);
      
              // 結果の取得と表示
              while (rs.next()) {
                String saiyo_name = rs.getString("saiyo_name");
                int kihonkyu = rs.getInt("saiyo_kihonkyu");
                String shoyo = rs.getString("saiyo_shoyo");
                String kyuka = rs.getString("saiyo_kyuka");
          %>
                <div class="saiyo">
                    <p><strong>種別:</strong> <%= saiyo_name %></p>
                    <p><strong>基本給  :</strong> <%= kihonkyu %></p>
                    <p><strong>賞与:</strong> <%= shoyo %></p>
                    <p><strong>休日休暇:</strong> <%= kyuka %></p>
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

    <div id="task2-content" class="task-content" style="display: none;">
        <h1><font color="red">中途採用</font></h1>
        <p>中途採用のお知らせ

            <p>私たちは、経験豊富なゲームデベロッパーを求めています！ゲーム開発における専門知識とスキルを持ち、新たなチャレンジに意欲的な方は、私たちのチームで活躍しませんか？</p>
            
            <p><font color="#808000">【募集要項】</font></p>
            
            <p>役職: ゲームデベロッパー</p>
            <p>業務内容: ゲームアプリの設計・開発・改善など</p>
            <p>必要なスキル:プログラミング言語（例: Java, C++, Unity）</p>
            <p>ゲーム開発の実務経験</p>
            <p>チームリーダーシップとプロジェクト管理能力</p>
            
            
            クリエイティブな問題解決能力私たちはゲームアプリ業界での革新を目指しており、最新のテクノロジーやトレンドに積極的に取り組んでいます。あなたのスキルと経験を私たちのチームに加え、一緒に素晴らしいゲーム体験を作りましょう。</p>
        <div class="saiyo">
            <%
              try {
                // データベースへの接続
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false", "2023g05", "2023g05");
        
                // ステートメントの作成とSQL文の実行
                String sql = "SELECT * FROM saiyo_info WHERE saiyo_id IN (2)";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        
                // 結果の取得と表示
                while (rs.next()) {
                  String saiyo_name = rs.getString("saiyo_name");
                  int kihonkyu = rs.getInt("saiyo_kihonkyu");
                  String shoyo = rs.getString("saiyo_shoyo");
                  String kyuka = rs.getString("saiyo_kyuka");
            %>
                  <div class="saiyo">
                      <p><strong>種別:</strong> <%= saiyo_name %></p>
                      <p><strong>基本給  :</strong> <%= kihonkyu %></p>
                      <p><strong>賞与:</strong> <%= shoyo %></p>
                      <p><strong>休日休暇:</strong> <%= kyuka %></p>
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
    <div class="go-to-button">
        <button onclick="goToHome()">メインページに戻る</button>
    </div>
</body>
</html>