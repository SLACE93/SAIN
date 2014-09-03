/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.AsistenciaBo;
import com.sain.dao.AsistenciaDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Matricula;
import java.util.Date;

/**
 *
 * @author Docente
 */
public class AsistenciaBoImpl implements AsistenciaBo{
    private AsistenciaDao asistenciaDao;

    public AsistenciaDao getAsistenciaDao() {
        return asistenciaDao;
    }

    public void setAsistenciaDao(AsistenciaDao asistenciaDao) {
        this.asistenciaDao = asistenciaDao;
    }

    @Override
    public void registrarAsistencia(int idcurso, int idmatricula, boolean estado, Date fecha){
        getAsistenciaDao().registrarAsistencia(idcurso, idmatricula, estado, fecha);
    }
}
