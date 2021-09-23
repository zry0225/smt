package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.SouvenirMapper;
import com.zyg.smt.model.Souvenir;
import com.zyg.smt.service.SouvenirService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Service
public class SouvenirSerivceImpl implements SouvenirService {
    @Resource
    private SouvenirMapper souvenirMapper;
    @Override
    public ArrayList<Souvenir> getSouvenirMsg() {
        return souvenirMapper.getSouvenirMsg();
    }

    @Override
    public Souvenir getSouvenirMsgById(int id) {
        return souvenirMapper.getSouvenirMsgById(id);
    }

    @Override
    public void editSouvenir(Souvenir souvenir) {
        souvenirMapper.editSouvenir(souvenir);
    }

    @Override
    public void deleteSouvenirById(int id) {
        souvenirMapper.deleteSouvenirById(id);
    }

    @Override
    public void addSouvenir(Souvenir souvenir) {
        souvenirMapper.addSouvenir(souvenir);
    }

    @Override
    public PageInfo<Map<String, Object>> getAllSouvenir(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = souvenirMapper.getAllSouvenir();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
