package com.sgcc.account.settings.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sgcc.account.settings.dao.MaintainCardDao;
import com.sgcc.comm.model.Query;
import com.sgcc.comm.util.CommUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class MaintainCardServiceImpl implements MaintainCardService {

    @Autowired
    MaintainCardDao maintainCardDao;

    @Override
    public Query queryList(Map<String, String> param) {
        PageHelper.startPage(Integer.parseInt(param.get("pageNum")),Integer.parseInt(param.get("pageSize")));
        List<Map<String,String>> list = maintainCardDao.queryList(param);
        Query query = new Query();
        query.setList(list);
        query.setPageNum(Integer.parseInt(param.get("pageNum")));
        query.setPageSize(Integer.parseInt(param.get("pageSize")));
        query.setTotal(((Page)list).getTotal());
        return query;
    }

    @Override
    public String save(Map<String, String> param){
        try {
            //maintainCardDao.checkBalance(param);
            // 如果uuid为空,插入
            if ("".equals(param.get("uuid"))) {
                param.put("uuid",CommUtil.getUUID());
                maintainCardDao.add(param);
            }else {// 修改
                maintainCardDao.upd(param);
            }

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @Override
    public List<Map<String,String>> getManagerOptions(){
         List<Map<String,String>> list = maintainCardDao.getManagerOptions();
         Map<String,String> map = new HashMap<String,String>();
         map.put("username","");
         map.put("nickname","");
         list.add(0,map);

        return list;
    }

    @Override
    public String deleteCardInfo(Map<String, String> param){
        try{
            String uuid = param.get("uuid");
            maintainCardDao.deleteCardInfo(uuid);
        }catch (Exception e){
            e.printStackTrace();
            return "false";
        }
        return "success";
    }


}
