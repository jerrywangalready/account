package com.sgcc.account.settings.controller;

import com.sgcc.account.settings.service.SettingsService;
import com.sgcc.comm.util.service.CommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author jerrywang
 * @create 2017/8/24.
 */
@Controller
@RequestMapping("/settings")
public class SettingsController {

    @Autowired
    CommService commService;
    @Autowired
    SettingsService settingsService;

    @RequestMapping("/init")
    public String settingsInit(){
        return "/settings/settingsIndex";
    }

    @RequestMapping("/checkPassword")
    public @ResponseBody Map<String, Object> checkPassword(String password){
        Map<String, String> param = new HashMap<>();
        param.put("password", password);
        param.put("username", commService.getLoginInfo().getLoginUser());
        return settingsService.checkPassword(param);
    }

    @RequestMapping("/saveNewPassword")
    public @ResponseBody String saveNewPassword(@RequestBody Map<String, String> param){
        param.put("username", commService.getLoginInfo().getLoginUser());
        return settingsService.saveNewPassword(param);
    }

    @RequestMapping("/changePassword")
    public String changePassword(){
        return "/settings/changePassword";
    }

    @RequestMapping("/maintainCard")
    public String maintainCard(){
        return "/settings/maintainCard";
    }

    @RequestMapping("/manageAccount")
    public String manageAccount(){
        return "/settings/manageAccount";
    }

    @RequestMapping("/getRole")
    public @ResponseBody List<String> getRoleByUsername(){
        String username = commService.getLoginInfo().getLoginUser();
        if("superadmin".equals(username)){
            List<String> list = new ArrayList<String>();
            list.add("superadmin");
            return list;
        }else {
            return settingsService.getRoleByUsername(username);
        }
    }

    @RequestMapping("/getLiveOptions")
    public @ResponseBody List<Map<String, String>> getLiveOptions(){
        List<Map<String, String>> list = new ArrayList<>();
        Map<String, String> p = new HashMap<>();
        p.put("key", "");
        p.put("value", "");
        list.add(p);
        for (int i = 0; i < 20; i++) {
            Map<String, String> param = new HashMap<>();
            param.put("key", i+"");
            param.put("value", "第"+i+"个");
            list.add(param);
        }
        return list;
    }
}
