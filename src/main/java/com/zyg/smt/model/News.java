package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 新闻类
 */
@Data
public class News {
    private Integer n_id;
    private String n_title;
    private String n_content;
    private String n_mainImg;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date n_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date n_alter;
    private Integer n_likes;
    private Integer n_views;
    private String n_author;
}
