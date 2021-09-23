package com.zyg.smt.mapper;

import com.zyg.smt.model.Guide;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface GuideMapper {
    List<Map<String, Object>> getAllGuide();

    void deleteGuideById(int id);

    void addGuide(Guide guide);

    Guide getGuideById(int id);

    void editGuide(Guide guide);
}
