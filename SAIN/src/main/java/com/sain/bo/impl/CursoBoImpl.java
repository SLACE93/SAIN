/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.CursoBo;
import com.sain.dao.CursoDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Empleado;
import com.sain.modelo.Materia;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ullon's Laptop
 */
public class CursoBoImpl implements CursoBo{
    private CursoDao cursoDao;

    public CursoDao getCursoDao() {
        return cursoDao;
    }

    public void setCursoDao(CursoDao cursoDao) {
        this.cursoDao = cursoDao;
    }
    
    @Override
    public ArrayList<String> findBySubject(Materia materia, Empleado empleado) {
        return getCursoDao().findBySubject(materia, empleado);
    }

    @Override
    public List<Curso> findCursos() {
        return getCursoDao().findCursos();
    }

    @Override
    public Curso findById(int id) {
        return getCursoDao().findById(id);
    }
    
    
    
}
