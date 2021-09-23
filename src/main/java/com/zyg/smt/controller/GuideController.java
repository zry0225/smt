package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Guide;
import com.zyg.smt.model.User;
import com.zyg.smt.service.GuideService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * @author zhangruiyan
 * 管理旅游指南（旅游小贴士）
 */
@Controller
@RequestMapping("/guide")
public class GuideController {
    @Resource
    private GuideService guideService;
    /**
     * 显示所有指南
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/guideMsg")
    public String announceMsg(Model model, Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> guide = guideService.getAllGuide(currentPage);
        model.addAttribute("guide",guide);
        return "guide/msg";
    }

    /**
     * 详情页
     * @param id
     * @return
     */
    @RequestMapping(value = "toGuideDetails")
    public String toGuideDetails(int id,Model model){
        Guide guide = guideService.getGuideById(id);
        model.addAttribute("guide",guide);
        return "/guide/details";
    }
    /**
     * 通过id删除指南
     * @param id
     */
    @RequestMapping(value = "/deleteGuide")
    public String deleteGuide(int id){
        guideService.deleteGuideById(id);
        return "forward:/guide/guideMsg";
    }

    /**
     * 跳转添加指南界面
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddGuide")
    public String toAddGuide(Model model){
        Guide guide = new Guide();
        guide.setG_addTime(new Date());
        guide.setG_updateTime(new Date());
        guide.setG_views(0);
        model.addAttribute("guide",guide);
        return "guide/add";
    }

    /**
     * 添加指南
     * @param guide
     * @return
     */
    @RequestMapping(value = "/addGuide")
    public String addGuide(Guide guide){
        guideService.addGuide(guide);
        return "forward:/guide/guideMsg";
    }

    /**
     * 跳转到修改指南页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/toEditGuide")
    public String toEditGuide(int id,Model model){
        Guide guide = guideService.getGuideById(id);
        guide.setG_updateTime(new Date());
        model.addAttribute(guide);
        return "guide/edit";
    }
    @RequestMapping(value = "/editGuide")
    public String editGuide(Guide guide){
        guideService.editGuide(guide);
        return "forward:/guide/guideMsg";
    }
}
