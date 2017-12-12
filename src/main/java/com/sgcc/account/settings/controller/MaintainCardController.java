package com.sgcc.account.settings.controller;

import com.sgcc.account.index.model.ConsumeRecord;
import com.sgcc.account.settings.service.MaintainCardService;
import com.sgcc.comm.model.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
    public @ResponseBody Query queryList(@RequestBody Map<String, String> param) {
        return maintainCardService.queryList(param);
    }

    @RequestMapping("/addCardInfo")
    public String addCardInfo(){
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







}