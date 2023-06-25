/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ADMIN
 */
public class DBContext {
    public static Connection getConnection()throws Exception {        
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber +
                ";databaseName="+dbName;//+"; integratedSecurity=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");         
        return DriverManager.getConnection(url, userID, password);
//        return DriverManager.getConnection(url);
    }
    
    /*Insert your other code right after this comment*/
   
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final static String serverName = "LAPTOP-5M581T31\\TAI";
    private final static String dbName = "jspDiary";
    private final static String portNumber = "1433";
    private final static String userID = "sa";
    private final static String password = "123";
}
