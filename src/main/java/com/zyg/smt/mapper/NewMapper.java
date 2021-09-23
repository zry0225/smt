package com.zyg.smt.mapper;

import com.zyg.smt.model.News;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface NewMapper {
    List<Map<String, Object>> getAllNew();

    void deleteNewById(int id);

    void addNews(News news);

    News toEditNewById(int id);

    void editNews(News news);
}
