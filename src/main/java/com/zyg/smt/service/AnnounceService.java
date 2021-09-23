package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Announcement;

import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface AnnounceService {
    PageInfo<Map<String, Object>> getAllannounce(Integer currentPage);

    void deleteAnnounceById(int id);

    void addAnnounce(Announcement announcement);

    Announcement selectAnnounceById(int id);

    void editAnnounce(Announcement announcement);
}
