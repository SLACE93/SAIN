/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo;

import com.sain.modelo.Curso;
import com.sain.modelo.Empleado;
import com.sain.modelo.Estudiante;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ullon's Laptop
 */
public interface EstudianteBo {
    void save(Estudiante estudiante);
    void update(Estudiante estudiante);
    void delete(Estudiante estudiante);
    List <Estudiante> findbyCourse(Curso curso);
    ArrayList<Object[]> findbyCourseSubject(String curso,String paralelo,String materia);
}
