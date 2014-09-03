/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.profesor;

import javax.inject.Named;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author HERNAN
 */
@Named(value="datosUsuario")
@RequestScoped

public class InfoProfesor {
    String nombre="Hernan";

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
