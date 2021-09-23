package com.zyg.smt.mapper;

import com.zyg.smt.model.Notes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Mapper
public interface NotesMapper {
    List<Map<String, Object>> getAllNotes();

    void deleteNotesById(int id);

    Notes selectNotesById(int id);

    void editNotes(Notes notes);
}
