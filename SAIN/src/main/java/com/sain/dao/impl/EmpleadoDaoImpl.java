/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.EmpleadoDao;
import com.sain.modelo.Empleado;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Ullon's Laptop
 */
public class EmpleadoDaoImpl extends HibernateDaoSupport implements EmpleadoDao{

    @Override
    public Empleado getInfo(String user) {
        return (Empleado)getHibernateTemplate().find("from Empleado where usuario=?",user).get(0);
    }
}
