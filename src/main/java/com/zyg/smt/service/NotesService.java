package com.zyg.smt.service;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Notes;

import java.util.Map;

/**
 * @author zhangruiyan
 */
public interface NotesService {
    PageInfo<Map<String, Object>> getAllNotes(Integer currentPage);

    void deleteNotesById(int id);

    Notes selectNotesById(int id);

    void editNotes(Notes notes);
}
