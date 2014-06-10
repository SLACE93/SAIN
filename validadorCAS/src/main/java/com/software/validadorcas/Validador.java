/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.software.validadorcas;

import java.sql.ResultSet;
import java.sql.Statement;
import org.jasig.cas.authentication.handler.support.AbstractUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;
/**
 *
 * @author cesar20
 */
public class Validador extends AbstractUsernamePasswordAuthenticationHandler {
    public boolean authenticateUsernamePasswordInternal(UsernamePasswordCredentials credentials)  
      {  
        String username = credentials.getUsername();  
        String password = credentials.getPassword(); 
        boolean valid = false; 
        String statementPostgrasql = "select * from \"usuarios\" where usuario = '"+username+"' and password = '"+password+"'";
            
        
        try{
            ConexionPSql myDbTest = new ConexionPSql();
            Statement select = myDbTest.getConnection().createStatement();
            ResultSet result = select.executeQuery(statementPostgrasql);
            while (result.next()) {
                valid=true;
            }
        }
        catch(Exception Ex){
        }
        
          
        return valid;  
      }  
}
