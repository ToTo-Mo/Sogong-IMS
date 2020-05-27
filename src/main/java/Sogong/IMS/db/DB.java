package Sogong.IMS.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    private Connection conn;

    private DB() {
        try {
            conn = null;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url;
            String id;
            String pwd;

            conn = DriverManager.getConnection(url, id, pwd);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }  catch (SQLException e) {
            e.printStackTrace();
        }
    };

    private static class SingleHolder {
        public static DB single = new DB();
    }

    public static DB getInstance() {
        return SingleHolder.single;
    }

    public static Connection getConnection() {
        return SingleHolder.single.conn;
    }

    public void close() {
        try {
            conn.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}