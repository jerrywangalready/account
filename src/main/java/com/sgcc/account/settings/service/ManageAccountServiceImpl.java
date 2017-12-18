package com.sgcc.account.settings.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sgcc.account.settings.dao.ManageAccountDao;
import com.sgcc.comm.model.Query;
import com.sgcc.comm.util.CommUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author jerrywang
 * @create 2017/12/17.
 */
@Service
public class ManageAccountServiceImpl implements ManageAccountService {

    @Autowired
    ManageAccountDao manageAccountDao;


    @Override
    public Query queryList(Map<String, String> param) {
        PageHelper.startPage(Integer.parseInt(param.get("pageNum")),Integer.parseInt(param.get("pageSize")));
        List<Map<String, String>> list = manageAccountDao.queryList(param);
        Query query = new Query();
        query.setList(list);
        query.setPageNum(Integer.parseInt(param.get("pageNum")));
        query.setPageSize(Integer.parseInt(param.get("pageSize")));
        query.setTotal(((Page)list).getTotal());

        return query;
    }

    @Override
    public Map<String, Object> checkUsername(String username) {
        int num = manageAccountDao.checkUsername(username);
        Map<String, Object> result = new HashMap<>();
        if(num == 0){
            result.put("result", true);
            result.put("info", "");
        }else {
            result.put("result", false);
            result.put("info", "账号已经存在!");
        }
        return result;

    }

    /**
     * @param param
     * @return
     * @Description 保存
     * @author JerryWang
     * @date 2017/12/17 19:44
     */
    public String save(Map<String, String> param) {
        try {
            if(!param.containsKey("uuid") || param.get("uuid").isEmpty()) {
                param.put("uuid", CommUtil.getUUID());
                manageAccountDao.addUser(param);
            }else {
                manageAccountDao.updateUser(param);
            }
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    /**
     * @param uuid
     * @return
     * @Description 查询用户信息
     * @author JerryWang
     * @date 2017/12/17 20:16
     */
    public Map<String, String> getUserInfoByUuid(String uuid) {
        return manageAccountDao.getUserInfoByUuid(uuid);
    }


    public String removeUserByUuid(String uuid) {
        try {
            manageAccountDao.removeUserByUuid(uuid);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
}
