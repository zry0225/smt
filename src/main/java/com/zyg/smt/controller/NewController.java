package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.News;
import com.zyg.smt.model.Notes;
import com.zyg.smt.service.NewService;
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
 */
@Controller
@RequestMapping("/new")
public class NewController {
    @Resource
    private NewService newService;
    @RequestMapping(value = "/newMsg")
    public String newMsg(Model model, Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> news = newService.getAllNew(currentPage);
        model.addAttribute("news",news);
        return "new/msg";
    }
    /**
     * 通过id删除新闻
     * @param id
     */
    @RequestMapping(value = "/deleteNew")
    public String deleteNew(int id){
        newService.deleteNewById(id);
        return "forward:/new/newMsg";
    }
    /**
     * 跳转到添加新闻页面，设置创建时间和修改时间为当前系统时间；浏览量和点赞量不可修改，默认为0
     * @param model
     * @return
     */
    @RequestMapping(value = "/toAddNew")
    public String toAddNew(Model model){
        News  news = new News();
        news.setN_likes(0);
        news.setN_views(0);
        news.setN_addTime(new Date());
        news.setN_alter(new Date());
        model.addAttribute("news",news);
        return "new/add";
    }
    /**
     * 进行添加新闻操作
     * @param news
     * @return
     */
    @RequestMapping(value = "/addNews")
    public String addNews(News news, @RequestParam(value = "file")MultipartFile file) throws IOException {
        ImgUtil imgUtil = new ImgUtil();
        String uploadPic = imgUtil.uploadPic(file);
        news.setN_mainImg(uploadPic);
        newService.addNews(news);
        return "forward:/new/newMsg";
    }

    /**
     * 详情页
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/toNewDetails")
    public String toNewDetails(Model model,int id){
        News news = newService.toEditNewById(id);
        model.addAttribute("news", news);
        return "/new/details";
    }
    /**
     * 跳转到修改新闻页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toEditNew")
    public String toEditNew(int id,Model model){
        News news  = newService.toEditNewById(id);
        news.setN_alter(new Date());
        model.addAttribute("news",news);
        return "new/edit";
    }


    /**
     * 修改新闻
     * @param news
     * @return
     */
    @RequestMapping(value = "/editNews")
    public String editNews(News news, @RequestParam(value = "file")MultipartFile file,
                           HttpServletRequest request) throws IOException {
        String oldImg = request.getParameter("oldImg");
        ImgUtil imgUtil = new ImgUtil();
        imgUtil.deleteImg(oldImg);
        String uploadPic = imgUtil.uploadPic(file);
        news.setN_mainImg(uploadPic);
        newService.editNews(news);
        return "forward:/new/newMsg";
    }
}
