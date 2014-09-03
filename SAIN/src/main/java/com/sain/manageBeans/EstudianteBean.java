/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans;

import com.sain.bo.EstudianteBo;
import com.sain.modelo.Estudiante;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author software
 */
public class EstudianteBean {
    private EstudianteBo estudianteBo;
    private int id;
    private String nombre;
    private String apellido;
    private String direccion;
    private String representante;
    private String telefono;
    private static final String SUCCESS = "success";
    private static final String ERROR   = "error";
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRepresentante() {
        return representante;
    }

    public void setRepresentante(String representante) {
        this.representante = representante;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public EstudianteBo getEstudianteBo() {
        return estudianteBo;
    }

    public void setEstudianteBo(EstudianteBo estudianteBo) {
        this.estudianteBo = estudianteBo;
    }

    public String save(){
        try{
            Estudiante estudiante=new Estudiante();
            estudiante.setNombre(nombre);
            estudiante.setApellido(apellido);
            estudiante.setDireccion(direccion);
            estudiante.setRepresentante(representante);
            estudiante.setTelefono(telefono);
            getEstudianteBo().save(estudiante);
            return SUCCESS;
        } catch (DataAccessException e) {
            e.printStackTrace();
        } 
        return ERROR;
    } 
    public String update(){
        return ERROR;
    }
    public String delete(){
        return ERROR;
    }
}
