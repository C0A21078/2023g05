package pnw.g05;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/g05/ConfirmationServlet5")
public class ConfirmationServlet5 extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmationServlet5() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // HTTP応答のエンコード設定
        response.setContentType("text/html; charset=UTF-8");
        // 入力したユーザID
        String user_name = request.getParameter("username");
        // 入力したパスワード
        String user_pass = request.getParameter("password");
        // 転送先のURL
        String forwardURL = "";

        // 接続オブジェクト
        Connection con = null;

        // SQL文オブジェクト
        PreparedStatement stmt = null;

        // DB取得結果
        ResultSet rs = null;

        try {
            // SQL文一つ目
            String sql_1 = "SELECT * FROM user_info where user_name=? and user_pass=?";

            // JDBCドライバのロード
            Class.forName("com.mysql.cj.jdbc.Driver");
            // データベース接続
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST", "root", "");
            // SQL実行準備
            stmt = con.prepareStatement(sql_1);
            stmt.setString(1, user_name);
            stmt.setString(2, user_pass);// user_passのセット
            // 実行結果取得
            rs = stmt.executeQuery();
            // データがなくなるまで(rs.next()がfalseになるまで)繰り返す
            int cnt = 0;
            ArrayList<String> nameArray = new ArrayList<String>();
            while (rs.next()) {
                // カラムの値を取得する．
                String name = rs.getString("user_name");
                String pass = rs.getString("user_pass");
                String id = rs.getString("user_id");
                nameArray.add(name);
                nameArray.add(pass);
                nameArray.add(id);
                // 両方見つかった
                cnt++;
            }
            if (cnt == 0) {
                // ユーザ無し
                String uname = nameArray.get(0);
                String upass = nameArray.get(1);
                request.setAttribute("name", uname);
                request.setAttribute("pass", upass);
                forwardURL = "/g05/noinfo.jsp";
            } else {
                // ユーザあり

                // SQL文二つ目
                String sql_2 = "DELETE FROM user_info where user_id=?";
                // SQL実行準備
                stmt = con.prepareStatement(sql_2);
                String uid = nameArray.get(2);
                stmt.setString(1, uid);
                // 実行結果取得
                stmt.executeUpdate();
                forwardURL = "/g05/completion.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.setAttribute("name", user_name);
            request.setAttribute("pass", user_pass);
            request.getRequestDispatcher("/g05/error.jsp").forward(request, response);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("データベースへのアクセスでエラーが発生しました。");
            }
        }

        // 外部ファイルに転送する準備
        RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
        // 外部ファイルに表示処理を任せる
        dispatcher.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
