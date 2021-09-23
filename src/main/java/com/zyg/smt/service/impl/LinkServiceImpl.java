package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.LinkMapper;
import com.zyg.smt.model.Link;
import com.zyg.smt.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Service
public class LinkServiceImpl implements LinkService {
    @Resource
    private LinkMapper linkMapper;
    @Override
    public PageInfo<Map<String, Object>> getAllLink(Integer currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = linkMapper.getAllLink();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void deleteLinkById(int id) {
        linkMapper.deleteLinkById(id);
    }

    @Override
    public void addLink(Link link) {
        linkMapper.addLink(link);
    }

    @Override
    public Link selectLinkById(int id) {
        return linkMapper.selectLinkById(id);
    }

    @Override
    public void editLink(Link link) {
        linkMapper.editLink(link);
    }
}
