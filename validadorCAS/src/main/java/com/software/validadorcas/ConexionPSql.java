/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.software.validadorcas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author cesar20
 */
public class ConexionPSql {
    private Connection connection = null;
    private final String url = "jdbc:postgresql://";
    private final String serverName = "localhost";
    private final String portNumber = "5432";
    private final String databaseName = "usuarios";
    private final String userName = "postgres";
    private final String password = "admin";
        
        /*Conexion con SQL Server*/
        
        // Informs the driver to use server a side-cursor,
        // which permits more than one active statement
        // on a connection.
        private final String selectMethod = "Direct";
 
        // Constructor
        public ConexionPSql() {
        }
 
        private String getConnectionUrl() {
            String conexionSQL = url + serverName + ":" + portNumber + ";databaseName="+ databaseName ;
            String conexionPostgrasql =url + serverName + ":" + portNumber + "/"+databaseName ;
            return conexionPostgrasql;
        }
 
        public java.sql.Connection getConnection() {
                try {
                        //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        Class.forName("org.postgresql.Driver");
                        connection = java.sql.DriverManager.getConnection(getConnectionUrl(),
                                        userName, password);
                        if (connection != null)
                                System.out.println("Connection Successful!");
                } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("Error Trace in getConnection() : "
                                        + e.getMessage());
                }
                return connection;
        }
        public static void main(String[] args) throws Exception {
            /*String username="cesar";
            String password="930617";
            //String statementSQL = "select * from usuarios where usuario = '"+username+"' and password = '"+password+"'";
            String statementPostgrasql = "select * from \"usuarios\" where usuario = '"+username+"' and password = '"+password+"'";
            ConexionPSql myDbTest = new ConexionPSql();
                
            Statement select = myDbTest.getConnection().createStatement();
            ResultSet result = select.executeQuery(statementPostgrasql);
                               
                while (result.next()) {
                        System.out.println("Usuario: " + result.getString(2) + "\n");
                        System.out.println("Password: " + result.getString(3) + "\n");
                }*/
        }
}
