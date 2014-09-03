/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.EstudianteBo;
import com.sain.dao.EstudianteDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ullon's Laptop
 */
public class EstudianteBoImpl implements EstudianteBo{
    private EstudianteDao estudianteDao;

    public EstudianteDao getEstudianteDao() {
        return estudianteDao;
    }

    public void setEstudianteDao(EstudianteDao estudianteDao) {
        this.estudianteDao = estudianteDao;
    }
    
    @Override
    public void save(Estudiante estudiante) {
        getEstudianteDao().save(estudiante);
    }

    @Override
    public void update(Estudiante estudiante) {
        getEstudianteDao().update(estudiante);
    }

    @Override
    public void delete(Estudiante estudiante) {
        getEstudianteDao().delete(estudiante);
    }

    @Override
    public List<Estudiante> findbyCourse(Curso curso) {
        return getEstudianteDao().findbyCourse(curso);
    }

    @Override
    public ArrayList<Object[]> findbyCourseSubject(String curso, String paralelo, String materia) {
        return getEstudianteDao().findbyCourseSubject(curso, paralelo, materia);
    }
    
}
