package com.sain.modelo;
// Generated 18/08/2014 04:31:06 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Matricula generated by hbm2java
 */
public class Matricula  implements java.io.Serializable {


     private int id;
     private Curso curso;
     private Estudiante estudiante;
     private float calificacion;
     private Set<Asistencia> asistencias = new HashSet<Asistencia>(0);
     private Set<Quimestre> quimestres = new HashSet<Quimestre>(0);

    public Matricula() {
    }

	
    public Matricula(int id, Curso curso, Estudiante estudiante, float calificacion) {
        this.id = id;
        this.curso = curso;
        this.estudiante = estudiante;
        this.calificacion = calificacion;
    }
    public Matricula(int id, Curso curso, Estudiante estudiante, float calificacion, Set<Asistencia> asistencias, Set<Quimestre> quimestres) {
       this.id = id;
       this.curso = curso;
       this.estudiante = estudiante;
       this.calificacion = calificacion;
       this.asistencias = asistencias;
       this.quimestres = quimestres;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Curso getCurso() {
        return this.curso;
    }
    
    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    public Estudiante getEstudiante() {
        return this.estudiante;
    }
    
    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }
    public float getCalificacion() {
        return this.calificacion;
    }
    
    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }
    public Set<Asistencia> getAsistencias() {
        return this.asistencias;
    }
    
    public void setAsistencias(Set<Asistencia> asistencias) {
        this.asistencias = asistencias;
    }
    public Set<Quimestre> getQuimestres() {
        return this.quimestres;
    }
    
    public void setQuimestres(Set<Quimestre> quimestres) {
        this.quimestres = quimestres;
    }




}


