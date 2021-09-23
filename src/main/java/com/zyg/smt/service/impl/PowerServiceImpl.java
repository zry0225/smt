package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.PowerMpper;
import com.zyg.smt.model.User;
import com.zyg.smt.service.PowerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-04-10
 */
@Service
public class PowerServiceImpl implements PowerService {
    @Resource
    private PowerMpper powerMpper;


    @Override
    public PageInfo<Map<String, Object>> show(Integer currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = powerMpper.show();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public User getOne(int id) {
        return powerMpper.getone(id);
    }

    @Override
    public void editPower(User user) {
        powerMpper.editPower(user);
    }
}
