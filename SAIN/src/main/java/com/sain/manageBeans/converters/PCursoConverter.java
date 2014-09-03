/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans.converters;


import com.sain.manageBeans.ProfesorBean;
import com.sain.modelo.Curso;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

 
@FacesConverter("pcursoConverter")
public class PCursoConverter implements Converter {
 
    @Override
    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
        if(value != null && value.trim().length() > 0) {
            ProfesorBean service = (ProfesorBean) fc.getExternalContext().getSessionMap().get("profesorBean");
            System.out.println(service.getCursoBo().findById(Integer.parseInt(value)));
            Curso curso = service.getCursoBo().findById(Integer.parseInt(value));
            return curso;
        }
        else {
            return null;
        }
    }
 
    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
        if(object != null) {
            System.out.println(String.valueOf(((Curso) object).getId()));
            System.out.println((Curso) object);
            return String.valueOf(((Curso) object).getId());
        }
        else {
            return null;
        }
    }   
}        
