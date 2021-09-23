package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.NewMapper;
import com.zyg.smt.model.News;
import com.zyg.smt.service.NewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class NewServiceImpl implements NewService {
    @Resource
    private NewMapper newMapper;
    @Override
    public PageInfo<Map<String, Object>> getAllNew(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = newMapper.getAllNew();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;    }

    @Override
    public void deleteNewById(int id) {
        newMapper.deleteNewById(id);
    }

    @Override
    public void addNews(News news) {
        newMapper.addNews(news);
    }

    @Override
    public News toEditNewById(int id) {
        return newMapper.toEditNewById(id);
    }

    @Override
    public void editNews(News news) {
        newMapper.editNews(news);
    }
}
