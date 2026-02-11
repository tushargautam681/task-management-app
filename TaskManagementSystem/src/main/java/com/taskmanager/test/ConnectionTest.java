package com.taskmanager.test;

import java.sql.Connection;
import com.taskmanager.util.DatabaseConnection;

public class ConnectionTest {
    public static void main(String[] args) {
        System.out.println("Testing Database Connection...");
        Connection conn = DatabaseConnection.getConnection();
        if (conn != null) {
            System.out.println("SUCCESS: Connection established!");
            try { conn.close(); } catch(Exception e) {}
        } else {
            System.out.println("FAILURE: Could not connect.");
        }
    }
}
