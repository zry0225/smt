package com.zyg.smt.mapper;

import com.zyg.smt.model.Announcement;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface AnnounceMapper {
    List<Map<String, Object>> getAllannounce();

    void deleteAnnounceById(int id);

    void addAnnounce(Announcement announcement);

    Announcement selectAnnounceById(int id);

    void editAnnounce(Announcement announcement);
}
