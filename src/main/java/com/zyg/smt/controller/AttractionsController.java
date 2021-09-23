package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Attractions;
import com.zyg.smt.service.AttractionsService;
import com.zyg.smt.util.ImgUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * @author zhangruiyan
 * 管理景点信息
 */
@Controller
@RequestMapping("/attract")
public class AttractionsController {
    @Resource
    private AttractionsService attractionsService;

    /**
     * 跳转到景点信息页面
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/attractionsMsg")
    public String attractionsMsg(Model model,Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> attracts = attractionsService.getAllAttract(currentPage);
        model.addAttribute("attractions",attracts);
        return "attract/msg";
    }

    /**
     * 通过id删除景区信息
     * @param id
     */
    @RequestMapping(value = "/deleteAttractions")
    public String deleteAttractions(int id){
        attractionsService.deleteAttractionsById(id);
        return "forward:/attract/attractionsMsg";
    }

    /**
     * 跳转到添加景区信息页面，设置浏览量和点赞量不可修改，默认为0
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddAttractions")
    public String toAddAttractions(Model model) {
        Attractions attractions = new Attractions();
        attractions.setA_likes(0);
        attractions.setA_views(0);
        model.addAttribute("attractions",attractions);
        return "attract/add";
    }

    /**
     * 进行添加景区信息操作
     * @param attractions
     * @return
     */
    @RequestMapping(value = "/addAttractions")
    public String addAttractions(Attractions attractions, @RequestParam(value = "file")MultipartFile file) throws IOException{
        ImgUtil imgUtil = new ImgUtil();
        String uploadPic = imgUtil.uploadPic(file);
        attractions.setA_img(uploadPic);
        attractionsService.addAttractions(attractions);
        return "forward:/attract/attractionsMsg";
    }

    @RequestMapping(value = "toAttractionsDetails")
    public String toAttractionsDetails(Model model,int id){
        Attractions attraction = attractionsService.selectAttractionsById(id);
        model.addAttribute("attraction",attraction);
        return "/attract/details";
    }

    /**
     * 跳转到修改景区信息页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toEditAttractions")
    public String toEditAttractions(int id,Model model){
        Attractions attractions  = attractionsService.selectAttractionsById(id);
        model.addAttribute("attractions",attractions);
        return "attract/edit";
    }

    /**
     * 修改景区信息
     * @param attractions
     * @return
     */
    @RequestMapping(value = "/editAttractions")
    public String editAttractions(Attractions attractions,
                                  HttpServletRequest request, @RequestParam(value = "file")MultipartFile file)
            throws IOException{
        String oldImg = request.getParameter("oldImg");
        ImgUtil imgUtil = new ImgUtil();
        imgUtil.deleteImg(oldImg);
        String uploadPic = imgUtil.uploadPic(file);
        attractions.setA_img(uploadPic);
        attractionsService.editAttractions(attractions);
        return "forward:/attract/attractionsMsg";
    }

}
