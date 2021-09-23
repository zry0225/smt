package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.AdminMapper;
import com.zyg.smt.model.User;
import com.zyg.smt.service.AdminService;
import com.zyg.smt.util.exportUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper adminMapper;
    @Override
    public User getOneById(int id) {
        return adminMapper.getOneById(id);
    }

    @Override
    public void editUser(User user) {
        adminMapper.editUser(user);
    }

    @Override
    public void deleteUserById(int id) {
        adminMapper.deleteUserById(id);
    }

    @Override
    public PageInfo<Map<String, Object>> getAllUser(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = adminMapper.getAllUser();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public User getuserByName(String name) {
        return adminMapper.getuserByName(name);
    }

    /**
     * 获取用户信息下载xlsx文件
     * @return
     */
    @Override
    public XSSFWorkbook downLoad() {
        List<User> list = adminMapper.getUserMsg();
        XSSFWorkbook book = exportUtil.getBook(list, "用户ID","用户名", "用户性别", "用户密码", "用户年龄", "用户手机号", "QQ号", "用户头像链接", "身份证号", "邮箱", "生日"
                , "权限", "状态");
        return book;
    }


}
