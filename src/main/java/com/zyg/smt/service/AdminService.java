package com.zyg.smt.service;


import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.User;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.ArrayList;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface AdminService {

    User getOneById(int id);

    void editUser(User user);

    void deleteUserById(int id);

    PageInfo<Map<String, Object>> getAllUser(Integer currentPage);

    User getuserByName(String name);

    XSSFWorkbook downLoad();
}
