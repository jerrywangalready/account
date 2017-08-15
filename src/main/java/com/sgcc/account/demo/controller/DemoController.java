package com.sgcc.account.demo.controller;

import com.sgcc.comm.model.Query;
import com.sgcc.account.demo.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/demo")
public class DemoController {
    @Autowired
    DemoService demoService;

    @RequestMapping("/init")
    public String init(){
        return "/demo/demo";
    }

    /**
     * @Description
     * @author 杜成皓
     * @date 2017/1/21 22:26
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryDemo",method = RequestMethod.POST)
    public Query queryUsers(@RequestBody Map<String, String> param){
        return demoService.queryDemoList(param);
    }

}
