package com.sgcc.account.settings.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author jerrywang
 * @create 2017/8/24.
 */
@Controller
@RequestMapping("/settings")
public class SettingsController {

    @RequestMapping("/init")
    public String settingsInit(){
        return "/settings/settingsIndex";
    }
}
