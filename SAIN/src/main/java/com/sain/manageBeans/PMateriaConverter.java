/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans;


import com.sain.modelo.Materia;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

 
@FacesConverter("materiaConverter")
public class PMateriaConverter implements Converter {
 
    @Override
    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
        if(value != null && value.trim().length() > 0) {
            ProfesorBean service = (ProfesorBean) fc.getExternalContext().getSessionMap().get("profesorBean");
            System.out.println(service.getMateriaBo().findById(Integer.parseInt(value)));
            Materia materia = service.getMateriaBo().findById(Integer.parseInt(value));
            return materia;
        }
        else {
            return null;
        }
    }
 
    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
        if(object != null) {
            System.out.println(String.valueOf(((Materia) object).getId()));
            System.out.println((Materia) object);
            return String.valueOf(((Materia) object).getId());
        }
        else {
            return null;
        }
    }   
}        
