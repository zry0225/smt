package com.zyg.smt.model;

import lombok.Data;

import java.util.Date;

/**
 * 留言类
 */
@Data
public class Message {
    private Integer m_id;
    private Integer u_id;
    private String u_name;
    private String m_qq;
    private String m_email;
    private String m_phone;
    private String m_title;
    private String m_content;
    private Date m_addTime;
    private Date m_updateTime;
}
