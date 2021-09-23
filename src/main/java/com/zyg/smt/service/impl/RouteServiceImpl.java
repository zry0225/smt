package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.RouteMapper;
import com.zyg.smt.model.RouteInfo;
import com.zyg.smt.service.RouteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class RouteServiceImpl implements RouteService {
    @Resource
    private RouteMapper routeMapper;
    @Override
    public PageInfo<Map<String, Object>> getAllRoute(Integer currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = routeMapper.getAllRoute();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void deleteRouteById(int id) {
        routeMapper.deleteRouteById(id);
    }

    @Override
    public void addRoute(RouteInfo route) {
        routeMapper.addRoute(route);
    }

    @Override
    public RouteInfo selectRouteById(int id) {
        return routeMapper.selectRouteById(id);
    }

    @Override
    public void editRoute(RouteInfo route) {
        routeMapper.editRoute(route);
    }
}
