/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans;

import com.sain.bo.CursoBo;
import com.sain.bo.EstudianteBo;
import com.sain.bo.MateriaBo;
import com.sain.bo.QuimestreBo;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Materia;
import com.sain.modelo.Quimestre;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

/**
 *
 * @author VIX
 */

public class ProfesorBean implements Serializable{
     
    private CursoBo cursoBo;
    private MateriaBo materiaBo;
    private QuimestreBo quimestreBo;
    private EstudianteBo estudianteBo;
  
    private String termino;
    private Curso curso;
    private Materia materia;
    private String quimestre;
    
    private List<Curso> cursos;
    private List<Materia> materias;
    private List<Quimestre> quimestres;
    private List<Estudiante> estudiantes;
    
    private boolean cursoRender;
    private boolean materiaRender;
    private boolean quimestreRender;
    private boolean visible;
    
    @PostConstruct
    public void Init(){
        this.cursos = getCursoBo().findCursos();
        setMateriaRender(true);
        setQuimestreRender(true);
        setVisible(false);
    }

    public void onCursoChange()
    {
        if(getCurso() != null)
        {
            setMaterias(getMateriaBo().findByCursos(curso));
            if(getMaterias()!=null)
                setMateriaRender(false);
        }else
            setMaterias(null);
    }
    
    public void onMateriaChange()
    {
        if(getMateria() != null)
        {
            setQuimestreRender(false);
        }
        else
            addMessage("Seleccione la materia");
    }

    public CursoBo getCursoBo() {
        return cursoBo;
    }

    public void setCursoBo(CursoBo cursoBo) {
        this.cursoBo = cursoBo;
    }

    public MateriaBo getMateriaBo() {
        return materiaBo;
    }

    public void setMateriaBo(MateriaBo materiaBo) {
        this.materiaBo = materiaBo;
    }

    public QuimestreBo getQuimestreBo() {
        return quimestreBo;
    }

    public void setQuimestreBo(QuimestreBo quimestreBo) {
        this.quimestreBo = quimestreBo;
    }

    public String getTermino() {
        return termino;
    }

    public void setTermino(String termino) {
        this.termino = termino;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public String getQuimestre() {
        return quimestre;
    }

    public void setQuimestre(String quimestre) {
        this.quimestre = quimestre;
    }
   
    public List<Curso> getCursos() {
        return cursos;
    }

    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }

    public List<Materia> getMaterias() {
        return materias;
    }

    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    public List<Quimestre> getQuimestres() {
        return quimestres;
    }

    public void setQuimestres(List<Quimestre> quimestres) {
        this.quimestres = quimestres;
    }

    public boolean isCursoRender() {
        return cursoRender;
    }

    public void setCursoRender(boolean cursoRender) {
        this.cursoRender = cursoRender;
    }

    public boolean isMateriaRender() {
        return materiaRender;
    }

    public void setMateriaRender(boolean materiaRender) {
        this.materiaRender = materiaRender;
    }

    public boolean isQuimestreRender() {
        return quimestreRender;
    }

    public void setQuimestreRender(boolean quimestreRender) {
        this.quimestreRender = quimestreRender;
    }

    public List<Estudiante> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public EstudianteBo getEstudianteBo() {
        return estudianteBo;
    }

    public void setEstudianteBo(EstudianteBo estudianteBo) {
        this.estudianteBo = estudianteBo;
    }
    

    public void ingresarCalificaciones(){
        if( (this.curso != null) && !(this.quimestre.equals("")) && this.materia!=null) {
            setVisible(true);
            System.out.println(getCurso().getPeriodo());
            this.estudiantes = getEstudianteBo().findbyCourse(getCurso());
            System.out.println(getEstudiantes().get(0).getNombre());
            System.out.println(getEstudiantes().get(0).getApellido());
            addMessage("Operación Exitosa");
        }
        else{
            addMessage("Por favor seleccione el quimestre!!");
        }
    }
    
    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary,  null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
}
