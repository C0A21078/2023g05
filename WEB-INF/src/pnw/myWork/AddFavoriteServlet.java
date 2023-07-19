package pnw.myWork;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pnw.common.PnwDB;

@WebServlet("/myWork/AddFavoriteServlet")
public class AddFavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        String forwardURL = "/myWork/resultAddFavorite.jsp";
        ResultSet rs;
        // リクエストからの値取得
        LinkedHashMap<String, Object> valMap = new LinkedHashMap<String, Object>();

        // ユーザID
        String userID = request.getParameter("userID");
        valMap.put("userID", userID);

        // タイトル
        String title = request.getParameter("title");
        valMap.put("title", title);

        // Map自体を，requestのAttributeへセットする．
        request.setAttribute("map", valMap);

        try {
            /** DB接続に関する共通部 START **/
            // DB接続してStatementを取得する．
            PnwDB db = new PnwDB("2023g05");
            // SQL文の作成(プレースホルダーを使うのがわかりやすい)
            String sql = "INSERT INTO favorite_info (favorite_title, user_id) VALUES(?, ?)";
            PreparedStatement stmt = db.getStmt(sql);
            stmt.setString(1, title);
            // stmt.setString(2, url);
            stmt.setString(2, userID);
            int ret = stmt.executeUpdate();
            stmt.executeQuery();

            stmt.executeUpdate();
            rs = stmt.executeQuery();

            request.setAttribute("title", title);
            // request.setAttribute("url", url);
            // forwardURL = "/myWork/resultAddFavorite.jsp";

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 外部ファイルに転送する準備
        // ファイルの場所は，/webapps/pnw/から見た場所
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
