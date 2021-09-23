package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Announcement;
import com.zyg.smt.service.AnnounceService;
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
 * 公告管理
 */
@Controller
@RequestMapping("/announce")
public class AnnounceController {
    @Resource
    private AnnounceService announceService;

    /**
     * 显示所有公告
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/announceMsg")
    public String announceMsg(Model model,Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> announce = announceService.getAllannounce(currentPage);
        model.addAttribute("announce",announce);
        return "announcement/msg";
    }
    /**
     * 通过id删除公告
     * @param id
     */
    @RequestMapping(value = "/deleteAnnounce")
    public String deleteAnnounce(int id){
        announceService.deleteAnnounceById(id);
        return "forward:/announce/announceMsg";
    }
    /**
     * 跳转到添加公告页面，设置创建时间和修改时间为当前系统时间；浏览量和点赞量不可修改，默认为0
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddAnnounce")
    public String toAddAttractions(Model model){
        Announcement announce = new Announcement();
        announce.setAc_likes(0);
        announce.setAc_views(0);
        announce.setAc_addTime(new Date());
        announce.setAc_alter(new Date());
        model.addAttribute("announce",announce);
        return "announcement/add";
    }
    /**
     * 进行添加公告操作
     * @param announcement
     * @return
     */
    @RequestMapping(value = "/addAnnounce")
    public String addAnnounce(Announcement announcement, @RequestParam(value = "file") MultipartFile file)
            throws IOException {
        /**
         * 上传图片
         */
        ImgUtil imgUtil = new ImgUtil();
        String newFileName = imgUtil.uploadPic(file);
        announcement.setAc_mainImg(newFileName);
        announceService.addAnnounce(announcement);
        return "forward:/announce/announceMsg";
    }

    /**
     * 详情页
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/toAnnounceDetails")
    public String toAnnounceDetails(Model model,int id){
        Announcement announcement = announceService.selectAnnounceById(id);
        model.addAttribute("announcement",announcement);
        return "/announcement/details";
    }

    /**
     * 跳转到修改公告页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toEditAnnounce")
    public String toEditAnnounce(int id,Model model){
        Announcement announcement  = announceService.selectAnnounceById(id);
        announcement.setAc_alter(new Date());
        model.addAttribute("announcement",announcement);
        return "announcement/edit";
    }


    /**
     * 修改公告
     * @param announcement
     * @return
     */
    @RequestMapping(value = "/editAnnounce")
    public String editAttractions(Announcement announcement,
                                  HttpServletRequest request,@RequestParam(value = "file")MultipartFile file) throws IOException {
        //删除旧图片
        String oldImg = request.getParameter("oldImg");
        ImgUtil imgUtil = new ImgUtil();
        imgUtil.deleteImg(oldImg);
        String uploadPic = imgUtil.uploadPic(file);
        announcement.setAc_mainImg(uploadPic);
        announceService.editAnnounce(announcement);
        return "forward:/announce/announceMsg";
    }
}
