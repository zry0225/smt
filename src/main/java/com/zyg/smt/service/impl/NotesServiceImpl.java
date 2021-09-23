package com.zyg.smt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyg.smt.mapper.NotesMapper;
import com.zyg.smt.model.Notes;
import com.zyg.smt.service.NotesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class NotesServiceImpl implements NotesService {
    @Resource
    private NotesMapper notesMapper;
    @Override
    public PageInfo<Map<String, Object>> getAllNotes(Integer currentPage) {
        PageHelper.startPage(currentPage, 4);
        List<Map<String,Object>> list = notesMapper.getAllNotes();
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void deleteNotesById(int id) {
        notesMapper.deleteNotesById(id);
    }

    @Override
    public Notes selectNotesById(int id) {
       return notesMapper.selectNotesById(id);
    }

    @Override
    public void editNotes(Notes notes) {
        notesMapper.editNotes(notes);
    }
}
