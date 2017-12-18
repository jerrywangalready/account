package com.sgcc.account.settings.service;

import com.sgcc.comm.model.Query;

import java.util.Map; /**
 * @author jerrywang
 * @create 2017/12/17.
 */
public interface ManageAccountService {

    /**
     * @Description 获取列表数据
     * @author JerryWang
     * @date 2017/12/17 13:43
     * @param param
     * @return
     */
    Query queryList(Map<String, String> param);

    /**
     * @Description 检查用户名是否可用
     * @author JerryWang
     * @date 2017/12/17 15:37
     * @param username
     * @return
     */
    Map<String,Object> checkUsername(String username);

    /**
     * @Description 保存
     * @author JerryWang
     * @date 2017/12/17 19:44
     * @param param
     * @return
     */
    String save(Map<String, String> param);

    /**
     * @Description 查询用户信息
     * @author JerryWang
     * @date 2017/12/17 20:16
     * @param uuid
     * @return
     */
    Map<String,String> getUserInfoByUuid(String uuid);

    /**
     * @Description 删除用户byUUid
     * @author JerryWang
     * @date 2017/12/17 23:20
     * @param uuid
     * @return
     */
    String removeUserByUuid(String uuid);
}
