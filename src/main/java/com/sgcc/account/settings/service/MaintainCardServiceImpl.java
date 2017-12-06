package com.sgcc.account.settings.service;

import com.sgcc.account.settings.dao.MaintainCardDao;
import com.sgcc.comm.model.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class MaintainCardServiceImpl implements MaintainCardService {

    @Autowired
    MaintainCardDao maintainCardDao;

    @Override
    public Query queryList(Map<String, String> param) {
        return null;
    }
}
