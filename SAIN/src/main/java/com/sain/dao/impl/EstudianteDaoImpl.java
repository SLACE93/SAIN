/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.EstudianteDao;
import com.sain.modelo.Curso;
import com.sain.modelo.Estudiante;
import com.sain.modelo.Materia;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Ullon's Laptop
 */
public class EstudianteDaoImpl extends HibernateDaoSupport implements EstudianteDao{

    @Override
    public void save(Estudiante estudiante) {
        getHibernateTemplate().save(estudiante);
    }

    @Override
    public void update(Estudiante estudiante) {
        getHibernateTemplate().update(estudiante);
    }

    @Override
    public void delete(Estudiante estudiante) {
        getHibernateTemplate().delete(estudiante);
    }

    @Override
    public List<Estudiante> findbyCourse(Curso curso) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        try{
            session.beginTransaction();
            SQLQuery query = session.createSQLQuery("select e.* from curso as c "
                    + "inner join matricula as m on c.id = m.idcurso inner join estudiante as e "
                    + "on e.id = m.idestudiante where c.id = :id and c.periodo = :periodo "
                    + "order by e.apellido asc");
            query.addEntity(Estudiante.class);
            query.setParameter("id",curso.getId());
            query.setParameter("periodo",curso.getPeriodo());
            List<Estudiante> consulta = (List<Estudiante>)query.list();
            session.beginTransaction().commit();
            session.close();
            return consulta;
            /*"from curso as c "
                    + "inner join matricula as m on c.id = m.idcurso inner join estudiante as e "
                    + "on e.id = m.idestudiante where c.anioegb = :anio and c.paralelo= :paralelo and c.periodo = :periodo"
                    + "order by e.apellido asc"*/
        }
        catch(IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public ArrayList<Object[]> findbyCourseSubject(String curso,String paralelo,String materia) {
        Session session = getHibernateTemplate().getSessionFactory().openSession();
        try{
            session.beginTransaction();
            Query query = session.createQuery("select e.nombre, e.apellido from curso as c inner join sesion as s" +
                "on c.id = s.idCurso inner join materia as mat on s.idMateria = mat.id" +
                "inner join matricula as m on mat.id = m.idMateria inner join estudiante as e" +
                "on e.id = m.idEstudiante where c.anioegb = :anio and c.paralelo=:paralelo "+
                "and periodo ='2014' and mat.nombre = :materia order by e.apellido asc");
            query.setParameter("anio",curso);
            query.setParameter("paralelo",paralelo);
            query.setParameter("materia",materia);
            ArrayList<Object[]> consulta = (ArrayList<Object[]>)query.list();
            session.beginTransaction().commit();
            session.close();
            return consulta;
        }
        catch(IndexOutOfBoundsException ex){
            return null;
        }
    }
    
}
