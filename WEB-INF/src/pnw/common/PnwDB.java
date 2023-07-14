package pnw.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PnwDB {
    /**
     * DB接続オブジェクト
     */
    protected Connection con;

    /**
     * SQL実行用オブジェクト
     */
    protected PreparedStatement stmt;

    /**
     * DB接続用ID
     */
    protected String db_id;

    /**
     * DB接続用パスワード
     */
    protected String db_password;

    /**
     * 
     * @param db 接続するDB名
     */
    public PnwDB(String db) {
        this.db_id = "2023g05";
        this.db_password = "2023g05";
        try {
            // Java->MySQLへお話をするための準備
            Class.forName("com.mysql.cj.jdbc.Driver");
            // DB接続
            this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?serverTimezone=JST",
                    this.db_id, this.db_password);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 
     * 
     * @param sql
     * @return
     */
    public PreparedStatement getStmt(String sql) {
        try {
            this.stmt = this.con.prepareStatement(sql,java.sql.Statement.RETURN_GENERATED_KEYS);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return stmt;
    }

}