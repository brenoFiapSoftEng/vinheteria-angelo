package com.example.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String JDBC_URL = "jdbc:sqlserver://vinheria-server.database.windows.net:1433;database=vinheria_db;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    private static final String USERNAME = "adminuser";
    private static final String PASSWORD = "Password123!"; // Substitua pela senha real

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Carrega o driver JDBC
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Retorna a conexão
        return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}