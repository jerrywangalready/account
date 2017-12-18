package com.sgcc.account.settings.controller;

import com.sgcc.account.settings.service.ManageAccountService;
import com.sgcc.comm.model.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author jerrywang
 * @create 2017/12/17.
 */
@Controller
@RequestMapping("/manageAccount")
public class ManageAccountController {

    @Autowired
    ManageAccountService manageAccountService;

    /**
     * @Description 查询用户列表信息
     * @author JerryWang
     * @date 2017/12/17 15:36
     * @param param
     * @return
     */
    @RequestMapping("/queryList")
    public @ResponseBody Query queryList(@RequestBody Map<String, String> param) {
        return manageAccountService.queryList(param);
    }

    /**
     * @Description 初始化新增用户页面
     * @author JerryWang
     * @date 2017/12/17 15:35
     * @return
     */
    @RequestMapping("/addUserPage")
    public String addUserPage() {
        return "/settings/addUserPage";
    }

    /**
     * @Description 初始化修改用户页面
     * @author JerryWang
     * @date 2017/12/17 15:35
     * @return
     */
    @RequestMapping("/updateUserPage")
    public String updateUserPage(String uuid, ModelMap modelMap) {
        Map<String, String> param = manageAccountService.getUserInfoByUuid(uuid);
        modelMap.addAllAttributes(param);
        return "/settings/updateUserPage";
    }

    /**
     * @Description 校验账号是否可用
     * @author JerryWang
     * @date 2017/12/17 15:35
     * @param username
     * @return
     */
    @RequestMapping("/checkUsername")
    public @ResponseBody Map<String, Object> checkUsername(String username){
        return manageAccountService.checkUsername(username);
    }

    /**
     * @Description 保存
     * @author JerryWang
     * @date 2017/12/17 19:44
     * @param param
     * @return
     */
    @RequestMapping("/save")
    public @ResponseBody String save(@RequestBody Map<String, String> param) {
        return manageAccountService.save(param);
    }

    /**
     * @Description 删除用户
     * @author JerryWang
     * @date 2017/12/17 23:20
     * @param uuid
     * @return
     */
    @RequestMapping("/removeUser")
    public @ResponseBody String removeUserByUuid(String uuid) {
        return manageAccountService.removeUserByUuid(uuid);
    }
}
