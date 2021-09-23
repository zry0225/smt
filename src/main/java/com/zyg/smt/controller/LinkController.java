package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Announcement;
import com.zyg.smt.model.Link;
import com.zyg.smt.service.LinkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * @author zhangruiyan
 * 管理通讯录
 */
@Controller
@RequestMapping("/link")
public class LinkController {
    @Resource
    LinkService linkService;

    /**
     * 显示通讯录
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/linkMsg")
    public String linkMsg(Model model, Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> link = linkService.getAllLink(currentPage);
        model.addAttribute("link",link);
        return "link/msg";
    }
    /**
     * 通过id删除链接
     * @param id
     */
    @RequestMapping(value = "/deleteLink")
    public String deleteLink(int id){
        linkService.deleteLinkById(id);
        return "forward:/link/linkMsg";
    }
    /**
     * 跳转到添加链接页面，设置创建时间当前系统时间
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddLink")
    public String toAddLink(Model model){
        Link link = new Link();
        link.setL_addTime(new Date());
        model.addAttribute("link",link);
        return "link/add";
    }
    /**
     * 进行添加链接操作
     * @param link
     * @return
     */
    @RequestMapping(value = "/addLink")
    public String addLink(Link link){
        linkService.addLink(link);
        return "forward:/link/linkMsg";
    }

    /**
     * 跳转到修改链接页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toEditLink")
    public String toEditLink(int id,Model model){
        Link link  = linkService.selectLinkById(id);
        model.addAttribute("link",link);
        return "link/edit";
    }


    /**
     * 修改链接
     * @param link
     * @return
     */
    @RequestMapping(value = "/editLink")
    public String editAttractions(Link link){
        linkService.editLink(link);
        return "forward:/link/linkMsg";
    }
}
