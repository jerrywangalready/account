package com.sgcc.account.settings.dao;

import java.util.List;
import java.util.Map;

public interface MaintainCardDao {

    List<Map<String,String>> queryList(Map<String, String> param);


    void add(Map<String, String> param);

    void upd(Map<String, String> param);
}