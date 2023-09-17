package com.common.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class QuickClassPhotoInsert {

    public static void main(String[] args) throws IOException {
        String URL = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei&useSSL=false&allowPublicKeyRetrieval=true";
        String USER = "root";
        String PASSWORD = "123456";
        String INSERT_PHOTO = "UPDATE CLASS SET CLASS_PIC = ? WHERE CLASS_ID = ? ;";

        for (int i = 1; i <= 12; i++) {

            File file = new File("C:/CLASS/" + i + ".jpg");
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(INSERT_PHOTO)) {
                ps.setBinaryStream(1, bis);
                ps.setInt(2, i);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
