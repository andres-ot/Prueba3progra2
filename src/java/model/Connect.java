package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Connect {

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    public Connect() {

        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "toor";
        String url = "jdbc:mysql://localhost:3306/prueba3";
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pass);

        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

    public void setConsult(String sql) {

        try {
            stmt = con.createStatement();
            stmt.executeQuery(sql);
            rs = stmt.getResultSet();
            
        } catch (SQLException ex) {
        }
    }

    public ResultSet getResult() {
        return rs;
    }

    public void setInsert(String sql) {
        try {
            stmt = con.createStatement();
            stmt.executeUpdate(sql);
            
        } catch (SQLException ex) {
        }

    }

}
