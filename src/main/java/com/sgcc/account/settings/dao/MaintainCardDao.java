package com.sgcc.account.settings.dao;

import com.sgcc.comm.model.Query;

import java.util.List;
import java.util.Map;

public interface MaintainCardDao {

    List<Map<String,String>> queryList(Map<String, String> param);


    void add(Map<String, String> param);

    void upd(Map<String, String> param);

    List<Map<String,String>> getManagerOptions();

    void deleteCardInfo(String uuid);

    List<Map<String, String>> getUsers(Map<String, String> param);

    Map<String,String> queryCardInfoByUuid(String uuid);

    Query queryCardUserInfo(String uuid);
}
