package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.User;
import com.zyg.smt.service.PowerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-04-10
 */
@Controller
@RequestMapping("/power")
public class PowerController {
    @Resource
    private PowerService powerService;
    /**
     * 显示用户信息
     * @return ArrayList
     */
    @RequestMapping("/show")
    public String show(Model model,Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> users = powerService.show(currentPage);
        model.addAttribute("users",users);
        return "power/msg";
    }
    @RequestMapping(value = "/toEditPower")
    public String toEditPower(int id,Model model){
        User user= powerService.getOne(id);
        model.addAttribute("user",user);
        return "power/edit";
    }
    @RequestMapping(value = "/editPower")
    public String editPower(User user){
        powerService.editPower(user);
        return "forward:/power/show";
    }
}
