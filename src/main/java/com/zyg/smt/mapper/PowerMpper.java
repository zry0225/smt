package com.zyg.smt.mapper;

import com.zyg.smt.model.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-04-10
 */
@Mapper
public interface PowerMpper {
    List<Map<String, Object>> show();

    User getone(int id);

    void editPower(User user);
}
