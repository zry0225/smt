package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author zhangruiyan
 */
@Data
public class Announcement {
    private int ac_id;
    private String ac_title;
    private String ac_context;
    private String ac_mainImg;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ac_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ac_alter;
    private int ac_likes;
    private int ac_views;
    private String ac_author;
}
