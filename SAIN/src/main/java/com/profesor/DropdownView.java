/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.profesor;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
 
@ManagedBean
@ViewScoped
public class DropdownView implements Serializable {
     
    private Map<String,Map<String,String>> data = new HashMap<String, Map<String,String>>();
    private String materia; 
    private String curso;  
    private String nota;
    private Map<String,String> materias;
    private Map<String,String> cursos;
    private Map<String,String> notas;
    
    @PostConstruct
    public void init() {
        materias  = new HashMap<String, String>();
        materias.put("Matematica","Matematica");
        materias.put("Geometria","Geometria" );
        materias.put("Razonamiento","Razonamiento");
        
        notas  = new HashMap<String, String>();
        notas.put("Parcial","Parcial");
        notas.put("Quimestral","Quimestral" );
        notas.put("Anual","Anual");
         
        Map<String,String> map = new HashMap<String, String>();
        map.put("8vo","8vo");
        map.put("9no","9no");
        map.put("10mo","10mo");
        data.put("Matematica", map);
         
        map = new HashMap<String, String>();
        map.put("8vo","8vo");
        map.put("9no","9no");
        data.put("Geometria", map);
         
        map = new HashMap<String, String>();
        map.put("10mo", "10mo");
        data.put("Razonamiento", map);
    }
 
    public Map<String, Map<String, String>> getData() {
        return data;
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
 
    public Map<String, String> getCursos() {
        return cursos;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public Map<String, String> getNotas() {
        return notas;
    }

    public void setNotas(Map<String, String> notas) {
        this.notas = notas;
    }
 
    public void onMateriaChange() {
            cursos = getCursos();
    }
    public void onNotaChange() {
        
    }
     
    public void displayLocation() {
        FacesMessage msg;
        if(curso != null && materia != null)
            msg = new FacesMessage("Selecciono", materia + " para " + curso);
        else
            msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Invalid", "Curso no Seleccionado"); 
             
        FacesContext.getCurrentInstance().addMessage(null, msg);  
    }
}
