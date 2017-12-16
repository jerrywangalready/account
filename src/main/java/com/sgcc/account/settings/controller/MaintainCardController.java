package com.sgcc.account.settings.controller;

import com.sgcc.account.index.model.ConsumeRecord;
import com.sgcc.account.settings.service.MaintainCardService;
import com.sgcc.comm.model.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xing
 * @create 2017/12/4.
 */
@Controller
@RequestMapping("/maintainCard")
public class MaintainCardController {


    @Autowired
    MaintainCardService maintainCardService;

    @RequestMapping("/queryList")
    public @ResponseBody List<Map<String,String>> queryList(@RequestBody Map<String, String> param) {
        return maintainCardService.queryList(param);
    }

    @RequestMapping("addCardInfo")
    public String addCardInfo(String uuid, Model model){
        model.addAttribute("uuid",uuid);
        return "/settings/addCardInfo";
    }

    @RequestMapping("/save")
    public @ResponseBody String save(@RequestBody Map<String, String> param) {
        Map cardInfo = new HashMap();
        String uuid = param.get("uuid");
        String cardName = param.get("cardName");
        String cardManader = param.get("cardManager");
        cardInfo.put("uuid",uuid);
        cardInfo.put("cardName",cardName);
        cardInfo.put("cardManader",cardManader);

        return maintainCardService.save(param);
    }

    @RequestMapping("/getManagerOptions")
    public @ResponseBody
    List<Map<String, String>> getManagerOptions(){
        /*List<Map<String, String>> list = new ArrayList<>();
        for (int i = 0; i < 20; i++) {
            Map<String, String> param = new HashMap<>();
            param.put("key", i+"");
            param.put("value", "第"+i+"个");
            list.add(param);
        }*/
        return maintainCardService.getManagerOptions();
    }

    @RequestMapping("/deleteCardInfo")
//    public  @ResponseBody String deleteCardInfo(@RequestBody Map<String,String> param){
    public  @ResponseBody String deleteCardInfo(String uuid){
        Map<String,String> param = new HashMap<>();
        param.put("uuid",uuid);
        return maintainCardService.deleteCardInfo(param);
    }





}
