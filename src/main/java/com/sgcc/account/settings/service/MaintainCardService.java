package com.sgcc.account.settings.service;

import com.sgcc.comm.model.Query;

import java.util.Map;

public interface MaintainCardService {

     Query queryList(Map<String, String> param) ;


    String save(Map<String, String> param);
}
