package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.RouteInfo;
import com.zyg.smt.service.RouteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Controller
@RequestMapping("/route")
public class RouteController {
    @Resource
    private RouteService routeService;

    /**
     * 显示所有路线信息
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/routeMsg")
    public String routeMsg(Model model, Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> route = routeService.getAllRoute(currentPage);
        model.addAttribute("route",route);
        return "route/msg";
    }
    /**
     * 通过id删除路线
     * @param id
     */
    @RequestMapping(value = "/deleteRoute")
    public String deleteRoute(int id){
        routeService.deleteRouteById(id);
        return "forward:/route/routeMsg";
    }
    /**
     * 跳转到添加路线页面，收藏量和浏览量不可修改，默认为0
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddRoute")
    public String toAddRoute(Model model){
        RouteInfo route = new RouteInfo();
        route.setRi_views(0);
        route.setRi_collect(0);
        model.addAttribute("route",route);
        return "route/add";
    }
    /**
     * 进行添加路线操作
     * @param route
     * @return
     */
    @RequestMapping(value = "/addRoute")
    public String addAnnounce(RouteInfo route){
        routeService.addRoute(route);
        return "forward:/route/routeMsg";
    }

    /**
     * 跳转到修改路线页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toEditRoute")
    public String toEditRoute(int id,Model model){
        RouteInfo route  = routeService.selectRouteById(id);
        model.addAttribute("route",route);
        return "route/edit";
    }


    /**
     * 修改公告
     * @param route
     * @return
     */
    @RequestMapping(value = "/editRoute")
    public String editRoute(RouteInfo route){
        routeService.editRoute(route);
        return "forward:/route/routeMsg";
    }
}
