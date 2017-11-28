package com.sgcc.account.statistics.service;

import com.sgcc.comm.model.Query;

import java.util.List;
import java.util.Map;

public interface StatisticsService {

    Query queryList (Map<String, String> param);

    Query queryDetailList(Map<String, String> param);
}
