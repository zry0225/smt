package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Souvenir;
import com.zyg.smt.service.SouvenirService;
import com.zyg.smt.util.ImgUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * @author zhangruiyan
 * @date 2021.3.20
 * 旅游商品管理
 */
@Controller
@RequestMapping("/souvenir")
public class SouvenirController {
    @Resource
    private SouvenirService souvenirService;
    /**
     * 显示旅游商品信息
     * @return ArrayList
     */
    @RequestMapping("/souvenirMsg")
    public String toSouvenirMsg(Model model,Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> souvenir = souvenirService.getAllSouvenir(currentPage);
        model.addAttribute("souvenirs",souvenir);
        return "souvenir/msg";
    }
    @RequestMapping(value = "toSouvenirDetails")
    public String toSouvenirDetails(Model model,int id){
        Souvenir souvenir = souvenirService.getSouvenirMsgById(id);
        model.addAttribute("souvenir",souvenir);
        return "/souvenir/details";
    }
    /**
     * 根据id查询旅游商品，跳转到修改页面
     */
    @RequestMapping(value = "/toEditSouvenir")
    public String toEditSouvenir(int id,Model model){
        Souvenir souvenir = souvenirService.getSouvenirMsgById(id);
        Date alter = new Date();
        souvenir.setS_uptime(alter);
        model.addAttribute("souvenir",souvenir);
        return "souvenir/edit";
    }

    /**
     * 修改旅游商品信息
     * @param souvenir
     * @return
     */
    @RequestMapping(value = "/editSouvenir")
    public String editSouvenir(Souvenir souvenir,
                               HttpServletRequest request, @RequestParam(value = "file")MultipartFile file) throws IOException {
        String oldImg = request.getParameter("oldImg");
        ImgUtil imgUtil = new ImgUtil();
        imgUtil.deleteImg(oldImg);
        String uploadPic = imgUtil.uploadPic(file);
        souvenir.setS_img(uploadPic);
        souvenirService.editSouvenir(souvenir);
        return "forward:/souvenir/souvenirMsg";
    }
    /**
     * 删除旅游商品信息
     */
    @RequestMapping(value = "/deleteSouvenir")
    public String deleteSouvenir(int id){
        souvenirService.deleteSouvenirById(id);
        return "forward:/souvenir/souvenirMsg";
    }

    /**
     * 跳转添加商品页面，商品添加时间、修改时间为当前时间，点赞数、浏览数为0。
     * 上述属性添加时不可修改
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddSouvenir")
    public String toAddSouvenir(Model model){
        Souvenir souvenir = new Souvenir();
        souvenir.setS_uptime(new Date());
        souvenir.setS_addTime(new Date());
        souvenir.setS_likes(0);
        souvenir.setS_views(0);
        model.addAttribute("souvenir",souvenir);
        return "souvenir/add";
    }

    /**
     * 添加商品信息
     * @param souvenir
     * @return
     */
    @RequestMapping(value = "/addSouvenir")
    public String addSouvenir(Souvenir souvenir,@RequestParam(value = "file")MultipartFile file) throws IOException {
        ImgUtil imgUtil = new ImgUtil();
        String uploadPic = imgUtil.uploadPic(file);
        souvenir.setS_img(uploadPic);
        souvenirService.addSouvenir(souvenir);
        return "forward:/souvenir/souvenirMsg";
    }
}
