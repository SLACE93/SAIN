/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.MatriculaDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Matricula;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author software
 */
public class MatriculaDaoImpl extends HibernateDaoSupport implements MatriculaDao{

    @Override
    public Matricula findByEstCur(Estudiante e, Curso c) {
        return (Matricula) getHibernateTemplate().find("from Matricula where idestudiante=? and idcurso=?",e.getId(),c.getId()).get(0);
    }
    
    
}
