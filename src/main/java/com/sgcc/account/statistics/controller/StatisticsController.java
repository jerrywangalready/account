package com.sgcc.account.statistics.controller;

import com.sgcc.account.statistics.service.StatisticsService;
import com.sgcc.comm.model.Query;
import com.sgcc.comm.util.service.CommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

    @Autowired
    CommService commService;
    @Autowired
    StatisticsService statisticsService;

    @RequestMapping("/init")
    public String statisticsInit(){
        return "/statistics/statisticsIndex";
    }

    @RequestMapping("/detail")
    public String statisticsDetail(){
        return "/statistics/statisticsDetail";
    }

    @RequestMapping("/queryList")
    public @ResponseBody Query queryList(@RequestBody Map<String, String> param) {
       String loginUserName = commService.getLoginInfo().getLoginUser();
       param.put("loginUserName",loginUserName);
        return statisticsService.queryList(param);
    }

    @RequestMapping("/queryDetailList")
    public @ResponseBody Query queryDetailList(@RequestBody Map<String,String> param){
        return statisticsService.queryDetailList(param);
    }
}
