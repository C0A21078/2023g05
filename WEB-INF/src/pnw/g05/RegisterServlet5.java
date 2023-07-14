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

@WebServlet("/g05/RegisterServlet5")
public class RegisterServlet5 extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet5() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ユーザ登録画面から登録対象のユーザ名とパスワードを取得
        response.setContentType("text/html; charset=UTF-8");
        String input_username = request.getParameter("username");
        String input_password = request.getParameter("password");

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
            String sql_1 = "SELECT user_id FROM user_info";

            // jdbcドライバのロード
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB接続
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/2023g05?serverTimezone=JST", "root", "");

            // SQL文実行準備
            stmt = con.prepareStatement(sql_1);
            // SQL実行
            rs = stmt.executeQuery();

            // データがなくなるまで(rs.next()がfalseになるまで)繰り返す
            int id_max = 0;
            while (rs.next()) {
                // ユーザーidの値を取得する．
                String id = rs.getString("user_id");
                int id_num = Integer.parseInt(id);
                // ユーザーidの最大値を取得
                if (id_num > id_max) {
                    id_max = id_num;
                }
            }

            // SQL文二つ目
            String sql_2 = "INSERT INTO user_info(user_id, user_name, user_pass) VALUES(?, ?, ?)";

            // ユーザーidが一番大きくなるよう設定
            int new_id = id_max + 1;
            String input_id = Integer.toString(new_id);

            // SQL実行準備
            stmt = con.prepareStatement(sql_2);

            // 登録するIDと名前とパスワードをセットする
            stmt.setString(1, input_id);
            stmt.setString(2, input_username);
            stmt.setString(3, input_password);

            // SQL実行
            stmt.executeUpdate();

            // 登録完了ページに遷移
            request.setAttribute("name", input_username);
            forwardURL = "/g05/regis_get.jsp";

        } catch (Exception e) {
            // 何らかの理由で失敗したらエラーページにエラー文を渡して表示。
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/g05/error.jsp").forward(request, response);
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
