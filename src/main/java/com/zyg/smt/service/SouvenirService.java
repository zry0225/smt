package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Souvenir;

import java.util.ArrayList;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface SouvenirService {
     ArrayList<Souvenir> getSouvenirMsg();

    Souvenir getSouvenirMsgById(int id);

    void editSouvenir(Souvenir souvenir);

    void deleteSouvenirById(int id);

    void addSouvenir(Souvenir souvenir);

    PageInfo<Map<String, Object>> getAllSouvenir(Integer currentPage);
}
