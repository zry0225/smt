package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.RouteInfo;

import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface RouteService {
    PageInfo<Map<String, Object>> getAllRoute(Integer currentPage);

    void deleteRouteById(int id);

    void addRoute(RouteInfo route);

    RouteInfo selectRouteById(int id);

    void editRoute(RouteInfo route);
}
