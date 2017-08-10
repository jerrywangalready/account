package com.sgcc.account.login.dao;


import com.sgcc.account.login.model.UserToken;

import java.util.Map;

public interface LoginDao {

    /**
     * @param param
     * @return
     */
    public UserToken checkUser(Map<String, String> param);
	
}
