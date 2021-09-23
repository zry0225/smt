package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.User;
import com.zyg.smt.service.AdminService;
import com.zyg.smt.util.ImgUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    /**
     * 管理员主页
     * @return String
     */
    @RequestMapping("main")
    public String toAdmin() {
        return "admin/main";

    }

    /**
     * 跳转个人信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/getUserById")
    public String getUserById(int id,Model model){
        User user = adminService.getOneById(id);
        model.addAttribute("user",user);
        return "admin/oneMsg";
    }

    /**
     * 显示用户信息
     * @return ArrayList
     */
    @RequestMapping("/userMsg")
    public String toUserMsg(Model model,Integer currentPage){
        //分页显示用户数据
        if (currentPage == null){
            currentPage = 1;
        }
        //获得数据
        PageInfo<Map<String,Object>> users = adminService.getAllUser(currentPage);
        model.addAttribute("users",users);
        return "admin/msg";
    }

    /**
     * 用户详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/toDetails")
    public String toDetails(int id,Model model){
        User user = adminService.getOneById(id);
        model.addAttribute("user",user);
        return "/admin/detail";
    }

    /**
     * 获取信息，跳转到修改用户信息页面
     * @return
     */
    @RequestMapping(value = "/toEditUser")
    public String toEditUser(int id,Model model){
        User user = adminService.getOneById(id);
        model.addAttribute("user",user);
        return "/admin/edit";
    }
    /**
     * 修改用户信息
     */
    @RequestMapping(value = "/editUser")
    public String editUser(User user, @RequestParam(value = "file")MultipartFile file
    , HttpServletRequest request) throws IOException {
        String oldImg = request.getParameter("oldImg");
        ImgUtil imgUtil = new ImgUtil();
        if (oldImg.equals("avatar.png")){
            String uploadPic = imgUtil.uploadPic(file);
            user.setU_img(uploadPic);
            adminService.editUser(user);
        }else {
            imgUtil.deleteImg(oldImg);
            String uploadPic = imgUtil.uploadPic(file);
            user.setU_img(uploadPic);
            adminService.editUser(user);
        }
        return "forward:/admin/userMsg";
    }
    /**
     * 删除用户
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(int id){
        adminService.deleteUserById(id);
        return "forward:/admin/userMsg";
    }

    /**
     * 导出xlsx文件
     * @param resp
     */
    @RequestMapping("/downLoadXlsx")
    public void downLoadXlsx(HttpServletResponse resp){
        //设置相应头，告诉浏览器我们响应的是一个xlsx文件
        resp.setHeader("Content-Disposition","attachment;filename=user.xlsx");
        XSSFWorkbook xssfWorkbook = adminService.downLoad();
        try {
            //通过响应获得输出流对象，然后使用输出流对象将文件写到客户端
            xssfWorkbook.write(resp.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
