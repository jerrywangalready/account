package com.sgcc.account.statistics.dao;

import java.util.List;
import java.util.Map;

public interface StatisticsDao {

    List<Map<String,String>> queryList(Map<String, String> param);

}
