/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.dao.impl;

import com.sain.dao.QuimestreDao;
import com.sain.modelo.Quimestre;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author VIX
 */
public class QuimestreDaoImpl extends HibernateDaoSupport implements QuimestreDao {

    @Override
    public List<Quimestre> findQuimestre() {
        return (List<Quimestre>) getHibernateTemplate().find("from Quimestre");
    }
    
}
