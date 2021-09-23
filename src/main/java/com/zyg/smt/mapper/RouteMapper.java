package com.zyg.smt.mapper;

import com.zyg.smt.model.RouteInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan 
 */
@Mapper
public interface RouteMapper {

    List<Map<String, Object>> getAllRoute();

    void deleteRouteById(int id);

    void addRoute(RouteInfo route);

    RouteInfo selectRouteById(int id);

    void editRoute(RouteInfo route);
}
