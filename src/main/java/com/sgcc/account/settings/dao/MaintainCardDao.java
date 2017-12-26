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

    List<Map<String, String>> queryCardUserInfo(Map<String,String> param);

    Map<String,String> getUserInfoByUserId(Map<String,String> param);

    /**
     * @Description 根据卡id获取没有加入该卡的人员
     * @author JerryWang
     * @date 2017/12/22 22:38
     * @param param
     * @return
     */
    List<Map<String, String>> queryUsersWithOutThisCard(Map<String, String> param);

    /**
     * @Description 插入成员信息
     * @author JerryWang
     * @date 2017/12/22 23:00
     * @param param
     */
    void saveAccountInfo(Map<String, String> param);

    void removeUser(Map<String, String> param);

    void rechargeSave(Map<String, String> param);

    void deleteRole(Map<String, String> param);

    void addRole(Map<String, String> param);
}
