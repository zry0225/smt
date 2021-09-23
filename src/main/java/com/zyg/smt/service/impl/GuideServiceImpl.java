package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.GuideMapper;
import com.zyg.smt.model.Guide;
import com.zyg.smt.service.GuideService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Service
public class GuideServiceImpl implements GuideService {
    @Resource
    private GuideMapper guideMapper;
    @Override
    public PageInfo<Map<String, Object>> getAllGuide(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = guideMapper.getAllGuide();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void deleteGuideById(int id) {
        guideMapper.deleteGuideById(id);
    }

    @Override
    public void addGuide(Guide guide) {
        guideMapper.addGuide(guide);
    }

    @Override
    public Guide getGuideById(int id) {
        return guideMapper.getGuideById(id);
    }

    @Override
    public void editGuide(Guide guide) {
        guideMapper.editGuide(guide);
    }
}
