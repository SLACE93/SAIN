/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao;

import com.sain.modelo.Curso;
import com.sain.modelo.Empleado;
import com.sain.modelo.Materia;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ullon's Laptop
 */
public interface CursoDao {
    ArrayList<String> findBySubject(Materia materia,Empleado empleado);
    List<Curso> findCursos();
    Curso findById(int id);
}