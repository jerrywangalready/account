package com.sgcc.account.settings.service;

import com.sgcc.comm.model.Query;

import java.util.List;
import java.util.Map;

public interface MaintainCardService {

    List<Map<String,String>> queryList(Map<String, String> param) ;


    String save(Map<String, String> param);

    List<Map<String,String>> getManagerOptions();

    String deleteCardInfo(Map<String, String> param);

    Map<String,String> queryCardInfoByUuid(String uuid);

    Query queryCardUserInfo(Map<String,String> param);

    Map<String,String> getUserInfoByUserId(String userId,String cardId);

    String removeUser(String username,String cardId);



    Query queryUsersWithOutThisCard(Map<String, String> param);

    String saveMember(String userId, String cardId);

    String rechargeSave(Map<String, String> param);

    void grantRole(Map<String, String> param);
}
