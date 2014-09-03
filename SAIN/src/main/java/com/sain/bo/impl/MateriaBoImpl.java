/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.MateriaBo;
import com.sain.dao.MateriaDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Empleado;
import com.sain.modelo.Materia;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ullon's Laptop
 */
public class MateriaBoImpl implements MateriaBo{
    private MateriaDao materiaDao;

    public MateriaDao getMateriaDao() {
        return materiaDao;
    }

    public void setMateriaDao(MateriaDao materiaDao) {
        this.materiaDao = materiaDao;
    }
    
    @Override
    public ArrayList<String> findByEmpleado(Empleado empleado) {
        return getMateriaDao().findByEmpleado(empleado);
    }
    
    @Override
    public List<Materia> findByCursos(Curso curso) {
        return getMateriaDao().findByCursos(curso);
    }
    
    @Override
    public Materia findById(int id) {
        return getMateriaDao().findById(id);
    }
    
}
