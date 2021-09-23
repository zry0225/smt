package com.zyg.smt.mapper;

import com.zyg.smt.model.Souvenir;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Mapper
public interface SouvenirMapper {

    ArrayList<Souvenir> getSouvenirMsg();

    Souvenir getSouvenirMsgById(int id);

    void editSouvenir(Souvenir souvenir);

    void deleteSouvenirById(int id);

    void addSouvenir(Souvenir souvenir);

    List<Map<String, Object>> getAllSouvenir();
}
