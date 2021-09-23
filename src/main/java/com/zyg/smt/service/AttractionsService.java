package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Attractions;

import java.util.ArrayList;
import java.util.Map;

/**
 * @author zhangruiyan
 * 景区信息
 */
public interface AttractionsService {
    ArrayList<Attractions> getAllAttractionsMsg();

    void deleteAttractionsById(int id);

    void addAttractions(Attractions attractions);

    Attractions selectAttractionsById(int id);

    void editAttractions(Attractions attractions);


    PageInfo<Map<String, Object>> getAllAttract(Integer currentPage);
}
