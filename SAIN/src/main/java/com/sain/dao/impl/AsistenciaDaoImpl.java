/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.AsistenciaDao;
import com.sain.modelo.Asistencia;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Matricula;
import java.util.Date;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Docente
 */
public class AsistenciaDaoImpl extends HibernateDaoSupport implements AsistenciaDao{
    @Override
    public void registrarAsistencia(int idcurso, int idmatricula, boolean estado, Date fecha){
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        try{
            session.beginTransaction();
            SQLQuery query = session.createSQLQuery("INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) "
                    + "VALUES (:est, :fec, :idMatri, :idCur)");
            query.setParameter("est",estado);
            query.setParameter("fec",fecha);
            query.setParameter("idMatri", idmatricula);
            query.setParameter("idCur", idcurso);
            query.executeUpdate();
            session.beginTransaction().commit();
            session.close();
        }
        catch(IndexOutOfBoundsException ex){
            System.err.println(ex);
        }
    }
}
