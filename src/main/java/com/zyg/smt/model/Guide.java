package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 指南实体类
 */
@Data
public class Guide {
    private Integer g_id;
    private String g_title;
    private String g_content;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date g_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date g_updateTime;
    private Integer g_views;//浏览人数


}
