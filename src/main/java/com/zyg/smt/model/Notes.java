package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 游记类
 */
@Data
public class Notes {
    private Integer t_id;
    private Integer u_id;
    private String u_name;
    private String t_title;
    private String t_content;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date t_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date t_updateTime;
    private Integer t_likes;
    private Integer t_views;
}
