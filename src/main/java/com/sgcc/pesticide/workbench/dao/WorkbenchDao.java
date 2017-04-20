package com.sgcc.pesticide.workbench.dao;

import java.util.List;
import java.util.Map;

/**
 * @author jerrywang
 */
public interface WorkbenchDao {

    /**
     * @Description 获取问题列表
     * @author JerryWang
     * @date 2017/4/9 12:18
     * @param param
     * @return
     */
    List<Map<String, String>> getIssueList(Map<String, String> param);


    /**
     * @Description 获取详细信息
     * @author JerryWang
     * @date 2017/4/10 18:28
     * @param uuid
     * @return
     */
    Map<String, String> getTaskDetail(String uuid);

    /**
     * @Description 获取详细信息
     * @author JerryWang
     * @date 2017/4/10 18:28
     * @param uuid
     * @return
     */
    Map<String, String> getBugDetail(String uuid);

    /**
     * @Description 获取项目下的模块
     * @author JerryWang
     * @date 2017/4/18 22:35
     * @param objectId
     * @return
     */
    List<String> getModel(String objectId);

    /**
     * @Description 推送
     * @author JerryWang
     * @date 2017/4/18 23:16
     * @param param
     * @return
     */
    void updateTaskState(Map<String, String> param);
}