package com.zyg.smt.model;

import lombok.Data;

import java.util.Date;

/**
 * 线路收藏表
 */
@Data
public class Routecollect {
    private Integer rc_id;//id
    private Integer ri_id;//线路ID
    private String ri_name;//线路名称
    private String ri_content;//线路内容
    private Integer u_id;//用户id，根据id，可以查看自己收藏的线路
    private String u_name;//用户姓名
    private Date rc_addTime;//添加时间
}
