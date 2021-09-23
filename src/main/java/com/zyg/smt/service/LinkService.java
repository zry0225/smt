package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Link;

import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface LinkService {
    PageInfo<Map<String, Object>> getAllLink(Integer currentPage);

    void deleteLinkById(int id);

    void addLink(Link link);

    Link selectLinkById(int id);

    void editLink(Link link);
}
