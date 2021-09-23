package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.AnnounceMapper;
import com.zyg.smt.model.Announcement;
import com.zyg.smt.service.AnnounceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Service
public class AnnnounceServiceImpl implements AnnounceService {
    @Resource
    private AnnounceMapper announceMapper;
    @Override
    public PageInfo<Map<String, Object>> getAllannounce(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = announceMapper.getAllannounce();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void deleteAnnounceById(int id) {
        announceMapper.deleteAnnounceById(id);
    }

    @Override
    public void addAnnounce(Announcement announcement) {
        announceMapper.addAnnounce(announcement);
    }

    @Override
    public Announcement selectAnnounceById(int id) {
        return announceMapper.selectAnnounceById(id);
    }

    @Override
    public void editAnnounce(Announcement announcement) {
        announceMapper.editAnnounce(announcement);
    }
}
