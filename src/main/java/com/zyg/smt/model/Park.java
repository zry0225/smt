package com.zyg.smt.model;

import lombok.Data;

import java.util.Date;

/**
 * 停车场类
 */
@Data
public class Park {
    private Integer p_id;
    private String p_name;
    private String p_address;
    private String p_information;
    private String p_notes;
    private Date p_addTime;
    private String p_img;
}
