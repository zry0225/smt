package com.zyg.smt.mapper;

import com.zyg.smt.model.Link;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface LinkMapper {
    List<Map<String, Object>> getAllLink();

    void deleteLinkById(int id);

    void addLink(Link link);

    Link selectLinkById(int id);

    void editLink(Link link);
}
