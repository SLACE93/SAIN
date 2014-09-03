/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans;

import com.sain.bo.AsistenciaBo;
import com.sain.bo.CursoBo;
import com.sain.bo.EstudianteBo;
import com.sain.bo.MatriculaBo;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Matricula;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.SelectEvent;


/**
 *
 * @author cesar20
 */
public class InspectorBean implements Serializable{
    private CursoBo cursoBo;
    private EstudianteBo estudianteBo;
    private AsistenciaBo asistenciaBo;
    private MatriculaBo matriculaBo;
    private Curso curso;
    private List<Curso> cursos;
    private List<Estudiante> estudiantes;
    private List<Estudiante> estudiantesAsistentes;
    private boolean visible;
    private Date date;
    private String destination;
    
      
    @PostConstruct
    public void Init(){
        this.curso = new Curso();
        this.cursos = getCursoBo().findCursos();
        this.visible = false;
        this.destination = "C:\\temp\\";
    }
    
    public CursoBo getCursoBo() {
        return cursoBo;
    }

    public void setCursoBo(CursoBo cursoBo) {
        this.cursoBo = cursoBo;
    }

    public EstudianteBo getEstudianteBo() {
        return estudianteBo;
    }

    public void setEstudianteBo(EstudianteBo estudianteBo) {
        this.estudianteBo = estudianteBo;
    }

    public AsistenciaBo getAsistenciaBo() {
        return asistenciaBo;
    }

    public void setAsistenciaBo(AsistenciaBo asistenciaBo) {
        this.asistenciaBo = asistenciaBo;
    }

    public MatriculaBo getMatriculaBo() {
        return matriculaBo;
    }

    public void setMatriculaBo(MatriculaBo matriculaBo) {
        this.matriculaBo = matriculaBo;
    }

    
    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    
    public List<Curso> getCursos(){
        return getCursoBo().findCursos();
    }

    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }

    public List<Estudiante> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }

    public List<Estudiante> getEstudiantesAsistentes() {
        return estudiantesAsistentes;
    }

    public void setEstudiantesAsistentes(List<Estudiante> estudiantesAsistentes) {
        this.estudiantesAsistentes = estudiantesAsistentes;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public void onDateSelect(SelectEvent event) {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Date Selected", format.format(event.getObject())));
    }
     
    public void click() {
        RequestContext requestContext = RequestContext.getCurrentInstance();
         
        requestContext.update("form:display");
        requestContext.execute("PF('dlg').show()");
    }
    
    public void cargarAction(){
        if(this.curso != null){
            setVisible(true);
            System.out.println(getCurso().getPeriodo());
            this.estudiantes = getEstudianteBo().findbyCourse(getCurso());
            System.out.println(getEstudiantes().get(0).getNombre());
            System.out.println(getEstudiantes().get(0).getApellido());
            addMessage("Operación Exitosa");
        }
        else{
            addMessage("Curso o Fecha Incorrectos!!");
        }
            
    }
    
    public void registrarAsistencia(){
        Matricula matricula;
        if(this.estudiantesAsistentes.size()>0){
            System.out.println("Asistentes");
            for(Estudiante e : this.estudiantesAsistentes){ 
                System.out.println(e.getId() + " " +  e.getApellido() + " " + e.getNombre());
                matricula = getMatriculaBo().findByEstCur(e, this.curso);
                getAsistenciaBo().registrarAsistencia(this.curso.getId(), matricula.getId(), true, this.date);
            }
            if(this.estudiantes.removeAll(this.estudiantesAsistentes)){
                if(this.estudiantes.size()>0){
                    System.out.println("No asistentes");
                    for(Estudiante e : this.estudiantes){
                        System.out.println(e.getId() + " " +  e.getApellido() + " " + e.getNombre() );
                        matricula = getMatriculaBo().findByEstCur(e, this.curso);
                        getAsistenciaBo().registrarAsistencia(this.curso.getId(), matricula.getId(), false, this.date);
                    }
                }
            }
            addMessage("Asistencia de estudiantes del " + this.curso + "  Registradas");
            setVisible(false);
        }
        else
            addMessage("Error!!  Seleccione los estudiantes asistentes");
    }
    
    public void cancelarAsistencia() {
        if(this.estudiantesAsistentes.size()>0){
            setVisible(false);
            this.estudiantesAsistentes.clear();
            addMessage("Registro Cancelado");
        }
        else{
            setVisible(false);
            addMessage("Registro Cancelado");
        }
            
    }
    
    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary,  null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
    
     public void upload(FileUploadEvent event) {  
        FacesMessage message = new FacesMessage("Succesful", event.getFile().getFileName() + " is uploaded.");
        FacesContext.getCurrentInstance().addMessage(null, message);  
        try {
            copyFile(event.getFile().getFileName(), event.getFile().getInputstream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }  

    public void copyFile(String fileName, InputStream in) {
           try {
                // write the inputStream to a FileOutputStream
                OutputStream out = new FileOutputStream(new File(destination + fileName));

                int read = 0;
                byte[] bytes = new byte[10485760];

                while ((read = in.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }

                in.close();
                out.flush();
                out.close();

                System.out.println("New file created! "+ fileName);
                } catch (IOException e) {
                System.out.println(e.getMessage());
                }
    }
    
    
}
