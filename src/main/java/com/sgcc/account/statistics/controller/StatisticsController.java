package com.sgcc.account.statistics.controller;

import com.sgcc.account.statistics.service.StatisticsService;
import com.sgcc.comm.model.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

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
        return statisticsService.queryList(param);
    }

    @RequestMapping("/queryDetailList")
    public @ResponseBody Query queryDetailList(@RequestBody Map<String,String> param){
        return statisticsService.queryDetailList(param);
    }
}
