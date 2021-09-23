package com.zyg.smt.model;

import lombok.Data;

/**
 * 景点类
 */
@Data
public class Attractions {
    private Integer a_id;
    private String a_name;
    private Integer a_level;
    private String a_phone;
    private String a_information;
    private String a_img;
    private String a_note;
    private Integer a_views;
    private Integer a_likes;

}
