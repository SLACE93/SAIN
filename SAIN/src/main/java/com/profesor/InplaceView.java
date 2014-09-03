/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.profesor;

import java.io.Serializable;
import javax.faces.bean.ManagedBean;
 
@ManagedBean
public class InplaceView implements Serializable {
     
    private String text = "PrimeFaces";
 
    public String getText() {
        return text;
    }
 
    public void setText(String text) {
        this.text = text;
    }
}
