package com.zyg.smt.model;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-05-07
 */

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 评价表，对景点、停车场、酒店、文创进行评价
 * @author zhangruiyan
 */

@Data
public class Evaluate {
    private Integer e_id;
    private String e_content;
    /**
     * 评价的类型：景点、停车场、酒店、文创
     */
    private String e_type;
    /**
     * 景点、停车场等的id
     */
    private Integer b_id;
    private String b_name;
    private Integer u_id;
    private String u_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date e_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date e_updateTime;
}
