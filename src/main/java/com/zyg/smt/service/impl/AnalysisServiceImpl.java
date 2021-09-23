package com.zyg.smt.service.impl;

import com.zyg.smt.mapper.AnalysisMapper;
import com.zyg.smt.service.AnalysisService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class AnalysisServiceImpl implements AnalysisService {
    @Resource
    private AnalysisMapper analysisMapper;

    @Override
    public List<Map<String, Object>> getrRepeatedsex() {
        return analysisMapper.getrRepeatedsex();
    }

    @Override
    public List<Map<String, Object>> getrRepeatedAge() {
        return analysisMapper.getrRepeatedAge();    }
}
