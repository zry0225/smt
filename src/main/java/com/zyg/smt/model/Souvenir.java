package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 纪念品类
 */
@Data
public class Souvenir {
    private Integer s_id;
    private String s_name;
    private Double s_price;
    private String s_img;
    private String s_note;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date s_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date s_uptime;
    private Integer s_likes;
    private Integer s_views;
}
