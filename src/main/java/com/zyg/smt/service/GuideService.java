package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Guide;

import java.util.Map;

/**
 * @author zhangruiyan 
 */
public interface GuideService {
    PageInfo<Map<String, Object>> getAllGuide(Integer currentPage);

    void deleteGuideById(int id);

    void addGuide(Guide guide);

    Guide getGuideById(int id);

    void editGuide(Guide guide);
}
