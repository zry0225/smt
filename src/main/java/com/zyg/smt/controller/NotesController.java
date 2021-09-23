package com.zyg.smt.controller;

import com.github.pagehelper.PageInfo;
import com.zyg.smt.model.Notes;
import com.zyg.smt.service.NotesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * @author zhangruiyan
 */
@Controller
@RequestMapping("/notes")
public class NotesController {
    @Resource
    private NotesService notesService;
    /**
     * 显示所有游记
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/notesMsg")
    public String notesMsg(Model model, Integer currentPage){
        if (currentPage == null){
            currentPage = 1;
        }
        PageInfo<Map<String,Object>> notes = notesService.getAllNotes(currentPage);
        model.addAttribute("notes",notes);
            return "notes/msg";
        }

    /**
     * 详情页
     * @param model
     * @param id
     * @return
     */
        @RequestMapping(value = "/toNoteDetails")
        public String toNoteDetails(Model model,int id){
            Notes note = notesService.selectNotesById(id);
            model.addAttribute("note",note);
            return "/notes/details";
        }
    /**
     * 通过id删除游记
     * @param id
     */
    @RequestMapping(value = "/deleteNotes")
    public String deleteNotes(int id){
        notesService.deleteNotesById(id);
        return "forward:/notes/notesMsg";
    }
    /**
     * 跳转到修改游记页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toEditNotes")
    public String toEditNotes(int id,Model model){
        Notes notes  = notesService.selectNotesById(id);
        notes.setT_updateTime(new Date());
        model.addAttribute("notes",notes);
        return "notes/edit";
    }


    /**
     * 修改游记
     * @param notes
     * @return
     */
    @RequestMapping(value = "/editNotes")
    public String editNotes(Notes notes){
        notesService.editNotes(notes);
        return "forward:/notes/notesMsg";
    }
}
