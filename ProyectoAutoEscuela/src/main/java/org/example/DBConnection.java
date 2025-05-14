package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://proyectoxdxd.c9wy0wy4eveg.us-east-1.rds.amazonaws.com/AutoEscula";
    private static final String USER = "admin";
    private static final String PASSWORD = "sitesientastelamete";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
