package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.User;

import java.util.Map;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-04-10
 */
public interface PowerService {
    PageInfo<Map<String, Object>> show(Integer currentPage);

    User getOne(int id);

    void editPower(User user);
}
