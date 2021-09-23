package com.zyg.smt.controller;

import com.zyg.smt.service.AnalysisService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Controller
@RequestMapping("/analysis")
public class AnalysisController {
    @Resource
    private AnalysisService analysisService;
    @RequestMapping(value = "/analysisMsg")
    public String analysisMsg(Model model){
        List<Map<String,Object>> sex =  analysisService.getrRepeatedsex();
        List<Map<String,Object>> age =  analysisService.getrRepeatedAge();
        model.addAttribute("sex",sex);
        model.addAttribute("age",age);
        return "analysis/msg";
    }
}
