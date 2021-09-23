package com.zyg.smt.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Mapper
public interface AnalysisMapper {
    List<Map<String, Object>> getrRepeatedsex();

    List<Map<String, Object>> getrRepeatedAge();
}
