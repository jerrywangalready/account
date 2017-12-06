package com.sgcc.account.settings.dao;

import java.util.List;
import java.util.Map;

public interface MaintainCardDao {

    List<Map<String,String>> queryList(Map<String, String> param);


}
