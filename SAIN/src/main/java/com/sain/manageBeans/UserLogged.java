/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans;

import javax.faces.context.FacesContext;

/**
 *
 * @author Ullon's Laptop
 */
public class UserLogged {
    private String User;

    public String getUser() {
        getUserFromCas();
        return User;
    }

    public void setUser(String User) {
        this.User = User;
    }
    
    public void getUserFromCas() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        setUser(facesContext.getExternalContext().getRemoteUser());
    }
}
