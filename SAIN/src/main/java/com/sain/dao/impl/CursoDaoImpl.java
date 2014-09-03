/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.CursoDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Empleado;
import com.sain.modelo.Materia;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Ullon's Laptop
 */
public class CursoDaoImpl extends HibernateDaoSupport implements CursoDao{

    @Override
    public ArrayList<String> findBySubject(Materia materia, Empleado empleado) {
        return (ArrayList<String>)getHibernateTemplate().find("",empleado,materia);
    }

    @Override
    public List<Curso> findCursos() {
        Calendar calendar = new GregorianCalendar();
        int anioInicial = 0;
        int anioFinal = 0;
        String anioLectivo = new String();
        if(calendar.get(Calendar.MONTH)>=4 && calendar.get(Calendar.MONTH)<=11){
            anioInicial = calendar.get(Calendar.YEAR);
            anioFinal = anioInicial + 1;
            anioLectivo = String.format("%s-%s",anioInicial,anioFinal);
        }
        else{
            if(calendar.get(Calendar.MONTH)>=0 && calendar.get(Calendar.MONTH)<=2){
                anioFinal = calendar.get(Calendar.YEAR);
                anioInicial = anioFinal - 1;
                anioLectivo = String.format("%s-%s",anioInicial,anioFinal);
            }
                
        }
        return (List<Curso>) getHibernateTemplate().find("from Curso where periodo=?",anioLectivo);   
    }

    @Override
    public Curso findById(int id) {
        return (Curso) getHibernateTemplate().find("from Curso where id=?",id).get(0);
    }
    
}
