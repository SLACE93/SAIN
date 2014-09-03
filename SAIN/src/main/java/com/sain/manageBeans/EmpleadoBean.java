/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.manageBeans;

import com.sain.bo.EmpleadoBo;
import com.sain.modelo.Empleado;
import java.io.Serializable;
import javax.annotation.PostConstruct;

/**
 *
 * @author Ullon's Laptop
 */
public class EmpleadoBean implements Serializable{
    private UserLogged userLog;
    private String user;
    private Empleado empleado;
    private EmpleadoBo empleadoBo;

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }
    
    public EmpleadoBo getEmpleadoBo() {
        return empleadoBo;
    }

    public void setEmpleadoBo(EmpleadoBo empleadoBo) {
        this.empleadoBo = empleadoBo;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    @PostConstruct
    public void Init(){
        userLog = new UserLogged();
        setUser(userLog.getUser());
        empleado=empleadoBo.getInfo(getUser());
    }
    
}
