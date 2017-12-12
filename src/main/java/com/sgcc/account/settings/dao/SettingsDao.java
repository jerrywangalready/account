package com.sgcc.account.settings.dao;

import java.util.List;
import java.util.Map;

/**
 * @author jerrywang
 * @create 2017/8/26.
 */
public interface SettingsDao {

    /**
     * @Description 校验密码
     * @author JerryWang
     * @date 2017/8/26 17:08
     * @param param
     * @return
     */
    int checkPassword(Map<String, String> param);

    /**
     * @Description 保存新密码
     * @author JerryWang
     * @date 2017/8/26 19:18
     * @param param
     */
    void saveNewPassword(Map<String, String> param);

    /**
     * @Description 根据用户名获取角色
     * @author JerryWang
     * @date 2017/12/10 22:39
     * @param username
     * @return
     */
    List<String> getRoleByUsername(String username);
}
