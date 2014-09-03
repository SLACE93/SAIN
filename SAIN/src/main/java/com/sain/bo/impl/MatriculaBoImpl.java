/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.MatriculaBo;
import com.sain.dao.MatriculaDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Matricula;

/**
 *
 * @author software
 */
public class MatriculaBoImpl implements MatriculaBo{
    
    private MatriculaDao matriculaDao;

    public MatriculaDao getMatriculaDao() {
        return matriculaDao;
    }

    public void setMatriculaDao(MatriculaDao matriculaDao) {
        this.matriculaDao = matriculaDao;
    }

    @Override
    public Matricula findByEstCur(Estudiante e, Curso c) {
        return (Matricula) getMatriculaDao().findByEstCur(e, c);
    }
    
}
