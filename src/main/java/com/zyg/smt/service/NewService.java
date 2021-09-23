package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.News;

import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface NewService {

    PageInfo<Map<String, Object>> getAllNew(Integer currentPage);

    void deleteNewById(int id);

    void addNews(News news);

    News toEditNewById(int id);

    void editNews(News news);
}
