<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
  request.setCharacterEncoding("UTF-8");
  // ユーザーIDと入力された値を取得
  String userId = request.getParameter("userId");
  int rating = Integer.parseInt(request.getParameter("rating"));
  String reviewText = request.getParameter("reviewText");

  // 現在の日時を取得
  java.util.Date now = new java.util.Date();
  java.sql.Timestamp reviewDate = new java.sql.Timestamp(now.getTime());

  // データベースへの接続情報
  String url = "jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST&useSSL=false";
  String username = "2023g05";
  String password = "2023g05";

  String msg = "";

  try {
    // データベースへの接続
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, username, password);

    // レビューデータをデータベースに保存
    String sql = "INSERT INTO app_dorakuev_review (user_id, star_rating, review_text, review_date) VALUES (?, ?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, userId);
    pstmt.setInt(2, rating);
    pstmt.setString(3, reviewText);
    pstmt.setTimestamp(4, reviewDate);
    pstmt.executeUpdate();

    // データベース接続とステートメントのクローズ
    pstmt.close();
    con.close();

    // レビューページにリダイレクト
    response.sendRedirect("review.jsp");
  } catch (Exception ex) {
    // エラーメッセージの表示
    out.println("データの保存に失敗しました。<br>" + ex.toString() + "<br>");
  }
%>
