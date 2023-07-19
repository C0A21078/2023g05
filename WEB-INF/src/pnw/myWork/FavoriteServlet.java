package pnw.myWork;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pnw.common.PnwDB;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@WebServlet("/myWork/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteServlet() {
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

        String forwardURL = "/myWork/all_favorite.jsp";
        ResultSet rs;
        // フォームから送信されたデータを取得
        LinkedHashMap<String, Object> valMap = new LinkedHashMap<String, Object>();

        String userID = request.getParameter("userID");
        valMap.put("userID", userID);

        request.setAttribute("map", valMap);

        try {
            PnwDB db = new PnwDB("2023g05");
            String sql = "SELECT favorite_title FROM favorite_info WHERE user_id=?";
            PreparedStatement stmt = db.getStmt(sql);
            stmt.setString(1, userID);
            rs = stmt.executeQuery();

            String favoriteData = "";
            valMap.put("favoriteData", favoriteData);

            while (rs.next()) {
                String title = rs.getString("favorite_title");
                favoriteData += title + "\r\n";
            }

            valMap.put("favoriteData", favoriteData);

            request.setAttribute("favoriteData", favoriteData);

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("map", valMap);
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
