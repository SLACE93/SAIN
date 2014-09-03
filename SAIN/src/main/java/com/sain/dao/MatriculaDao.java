/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao;

import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Matricula;

/**
 *
 * @author software
 */
public interface MatriculaDao {
    public Matricula findByEstCur(Estudiante e, Curso c);
}
