package com.sgcc.account.settings.dao;

import com.sgcc.comm.model.Query;

import java.util.List;
import java.util.Map;

/**
 * @author jerrywang
 * @create 2017/12/17.
 */
public interface ManageAccountDao {

    List<Map<String, String>> queryList(Map<String, String> param);

    int checkUsername(String username);

    void addUser(Map<String, String> param);

    void updateUser(Map<String, String> param);

    Map<String,String> getUserInfoByUuid(String uuid);

    void removeUserByUuid(String uuid);
}
