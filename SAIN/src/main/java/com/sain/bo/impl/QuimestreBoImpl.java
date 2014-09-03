/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sain.bo.impl;

import com.sain.bo.QuimestreBo;
import com.sain.dao.QuimestreDao;
import com.sain.modelo.Quimestre;
import java.util.List;

/**
 *
 * @author VIX
 */
public class QuimestreBoImpl implements QuimestreBo{

    private QuimestreDao quimestreDao;
    
    @Override
    public List<Quimestre> findQuimestre() {
        return getQuimestreDao().findQuimestre();
    }

    public QuimestreDao getQuimestreDao() {
        return quimestreDao;
    }

    public void setQuimestreDao(QuimestreDao quimestreDao) {
        this.quimestreDao = quimestreDao;
    }
    
    
}
