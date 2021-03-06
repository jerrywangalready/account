package com.sgcc.account.settings.controller;

import com.sgcc.account.settings.service.MaintainCardService;
import com.sgcc.comm.model.Query;
import com.sgcc.comm.util.service.CommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    CommService commService;

    @RequestMapping("/maintainCardInfo")
    public String maintainCardInfo() {
        return "/settings/maintainCard_info";
    }

    @RequestMapping("/maintainCardDetail")
    public String maintainCardDetail(String uuid, Model model) {
        Map<String, String> map = new HashMap<>();
        if ("new".equals(uuid)) {
            map.put("card_color", String.valueOf((int) (Math.random() * 10)));
        } else {
            map = maintainCardService.queryCardInfoByUuid(uuid);
        }
        model.addAllAttributes(map);
        return "/settings/maintainCard_detail";
    }

    @RequestMapping("/queryList")
    public @ResponseBody List<Map<String,String>> queryList(@RequestBody Map<String, String> param) {
        param.put("username", commService.getLoginInfo().getLoginUser());
        return maintainCardService.queryList(param);
    }

    @RequestMapping("entrance")
    public String entrance(String cardId, Model model){
        model.addAttribute("cardId",cardId);
        return "settings/entrance";
    }

    @RequestMapping("/changeCardInfo")
    public String changeCardInfo(String uuid, Model model) {
        model.addAttribute("uuid", uuid);
        return "/settings/changeCardInfo";
    }

    /*@RequestMapping ("/queryCardInfoByUuid")
    public @ResponseBody List<Map<String,String> queryCardInfoByUuid(String uuid){
        return maintainCardService.queryCardInfoByUuid(uuid);
    }*/

    @RequestMapping("/save")
    public @ResponseBody
    String save(@RequestBody Map<String, String> param) {
        Map cardInfo = new HashMap();
        String uuid = param.get("uuid");
        String cardName = param.get("cardName");
        String cardManager = param.get("cardManager");
        cardInfo.put("uuid", uuid);
        cardInfo.put("cardName", cardName);
        cardInfo.put("cardManager", cardManager);

        // 给卡主分配权限
        // 如果有卡主,加入角色表
        /*if (!param.get("cardManager").isEmpty()) {
            maintainCardService.grantRole(param);
        }*/

        return maintainCardService.save(param);
    }

    @RequestMapping("/getManagerOptions")
    public @ResponseBody
    List<Map<String, String>> getManagerOptions() {
        return maintainCardService.getManagerOptions();
    }

    @RequestMapping("/deleteCardInfo")
//    public  @ResponseBody String deleteCardInfo(@RequestBody Map<String,String> param){
    public @ResponseBody
    String deleteCardInfo(String uuid) {
        Map<String, String> param = new HashMap<>();
        param.put("uuid", uuid);
        return maintainCardService.deleteCardInfo(param);
    }

    @RequestMapping("/queryCardUserInfo")
    public @ResponseBody
    Query queryCardUserInfo(@RequestBody Map<String, String> param) {
        return maintainCardService.queryCardUserInfo(param);
    }

    @RequestMapping("/getUserInfoByUserId")
    public @ResponseBody
    Map<String, String> getUserInfoByUserId(String userId,String cardId) {
        return maintainCardService.getUserInfoByUserId(userId,cardId);
    }

    @ResponseBody
    @RequestMapping("/queryUsersWithOutThisCard")
    public Query queryUsersWithOutThisCard(@RequestBody Map<String, String> param) {
        return maintainCardService.queryUsersWithOutThisCard(param);
    }
    @RequestMapping("/removeUser")
    public @ResponseBody
    String removeUser(String username, String cardId) {
        return maintainCardService.removeUser(username, cardId);
    }

    /**
     * @Description 保存成员信息
     * @author JerryWang
     * @date 2017/12/23 10:16
     * @param userId
     * @param cardId
     * @return
     */
    @ResponseBody
    @RequestMapping("/saveMember")
    public String saveMember(String userId, String cardId) {
        return maintainCardService.saveMember(userId, cardId);
    }

    /**
     * @param username,cardId,model
     * @return
     * @Description 用户充值
     * @author zx
     * @date 2017/12/21
     */
    @RequestMapping("/recharge")
    public String recharge(String username,String cardId,Model model) {
        Map<String, String> param = maintainCardService.getUserInfoByUserId(username,cardId);
        param.put("cardId",cardId);
        model.addAllAttributes(param);
        return "/settings/rechargePage";
    }

    @ResponseBody
    @RequestMapping("/rechargeSave")
    public String rechargeSave(@RequestBody Map<String,String> param){
        return maintainCardService.rechargeSave(param);
    }


}