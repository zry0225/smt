package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 友情链接类
 */
@Data
public class Link {
    private Integer l_id;
    private String l_webName;
    private String l_url;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date l_addTime;


}
