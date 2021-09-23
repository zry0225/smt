package com.zyg.smt.mapper;

import com.zyg.smt.model.User;
import org.apache.ibatis.annotations.Mapper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Mapper
public interface AdminMapper {
    /**
     * 获取用户数据
     * @return
     */
    ArrayList<User> getUserMsg();

    User getOneById(int id);

    void editUser(User user);

    void deleteUserById(int id);

    List<Map<String, Object>> getAllUser();

    User getuserByName(String name);
}
