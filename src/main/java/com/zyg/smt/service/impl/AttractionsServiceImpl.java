package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.AttractionsMapper;
import com.zyg.smt.model.Attractions;
import com.zyg.smt.service.AttractionsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Service
public class AttractionsServiceImpl implements AttractionsService {
    @Resource
    private AttractionsMapper attractionsMapper;
    @Override
    public ArrayList<Attractions> getAllAttractionsMsg() {
        return attractionsMapper.getAllAttractionMsg();
    }

    @Override
    public void deleteAttractionsById(int id) {
        attractionsMapper.deleteAttractionsById(id);
    }

    @Override
    public void addAttractions(Attractions attractions) {
        attractionsMapper.addAttractions(attractions);
    }

    @Override
    public Attractions selectAttractionsById(int id) {
        return attractionsMapper.selectAttractionsById(id);
    }

    @Override
    public void editAttractions(Attractions attractions) {
        attractionsMapper.editAttractions(attractions);
    }

    @Override
    public PageInfo<Map<String, Object>> getAllAttract(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = attractionsMapper.getAllAttracts();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

}
