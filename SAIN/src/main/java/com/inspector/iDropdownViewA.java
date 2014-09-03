/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.inspector;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
 
@ManagedBean(name="iDropdownViewA")
@ViewScoped
public class iDropdownViewA implements Serializable {
     
    private Map<String,Map<String,String>> data = new HashMap<String, Map<String,String>>();
    private String materia; 
    private String curso;  
    private Map<String,String> materias;
    private Map<String,String> cursos;
     
    @PostConstruct
    public void init() {
        cursos = new HashMap<String, String>();
        cursos.put("8vo","8vo");
        cursos.put("10mo","10mo");
        cursos.put("9no","9no");
        
        
    }

    public Map<String, Map<String, String>> getData() {
        return data;
    }

    public void setData(Map<String, Map<String, String>> data) {
        this.data = data;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public Map<String, String> getMaterias() {
        return materias;
    }

    public void setMaterias(Map<String, String> materias) {
        this.materias = materias;
    }

    public Map<String, String> getCursos() {
        return cursos;
    }

    public void setCursos(Map<String, String> cursos) {
        this.cursos = cursos;
    }
 
   
}