/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo;

import com.sain.modelo.Curso;
import com.sain.modelo.Matricula;
import java.util.Date;

/**
 *
 * @author Docente
 */
public interface AsistenciaBo {
    public void registrarAsistencia(int idcurso, int idmatricula, boolean estado, Date fecha);
}
