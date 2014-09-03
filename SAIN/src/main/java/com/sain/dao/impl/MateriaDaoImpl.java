/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.MateriaDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Empleado;
import com.sain.modelo.Materia;
import java.util.ArrayList;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Ullon's Laptop
 */
public class MateriaDaoImpl extends HibernateDaoSupport implements MateriaDao{

    @Override
    public ArrayList<String> findByEmpleado(Empleado empleado) {
        return (ArrayList<String>)getHibernateTemplate().find("select from ?",empleado);
    }
    
    @Override
    public List<Materia> findByCursos(Curso curso) {
        return (List<Materia>) getHibernateTemplate().find("from Materia where idCurso = ?",curso.getId());
    }
    
    @Override
    public Materia findById(int id) {
        return (Materia) getHibernateTemplate().find("from Materia where id=?",id).get(0);
    }
}
