package com.zyg.smt.mapper;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Attractions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface AttractionsMapper {
    ArrayList<Attractions> getAllAttractionMsg();

    void deleteAttractionsById(int id);

    void addAttractions(Attractions attractions);

    Attractions selectAttractionsById(int id);

    void editAttractions(Attractions attractions);

    List<Map<String, Object>> getAllAttracts();
}
