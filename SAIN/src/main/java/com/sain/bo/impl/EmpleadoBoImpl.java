/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.EmpleadoBo;
import com.sain.dao.EmpleadoDao;
import com.sain.modelo.Empleado;

/**
 *
 * @author Ullon's Laptop
 */
public class EmpleadoBoImpl implements EmpleadoBo{
    private EmpleadoDao empleadoDao;

    public EmpleadoDao getEmpleadoDao() {
        return empleadoDao;
    }

    public void setEmpleadoDao(EmpleadoDao empleadoDao) {
        this.empleadoDao = empleadoDao;
    }

    @Override
    public Empleado getInfo(String user) {
        return getEmpleadoDao().getInfo(user);
    }
    
}
