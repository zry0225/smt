package com.zyg.smt.service;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface AnalysisService {


    List<Map<String, Object>> getrRepeatedsex();

    List<Map<String, Object>> getrRepeatedAge();
}
