package com.zyg.smt.util;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-04-09
 */
public class ImgUtil {
    public String uploadPic(@RequestParam(value = "file")MultipartFile file) throws IOException {
        /**
         * 上传图片
         */
        //图片上传成功后，将图片的地址写到数据库
        //保存图片的路径
        String filePath = "/Users/zhangruiyan/Desktop/IdeaProjects/smt/src/main/webapp/img";
        //获取原始图片的拓展名
        String originalFilename = file.getOriginalFilename();
        //新的文件名字
        String newFileName = UUID.randomUUID() + originalFilename;
        //封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        //把本地文件上传到封装上传文件位置的全路径
        file.transferTo(targetFile);
        return newFileName;
    }
    public void deleteImg(String imgName){
        //保存图片的路径
        String filePath = "/Users/zhangruiyan/Desktop/IdeaProjects/smt/src/main/webapp/img/";
        String newFileName = filePath+imgName;
        File file = new File(newFileName);
        file.delete();
    }
}
