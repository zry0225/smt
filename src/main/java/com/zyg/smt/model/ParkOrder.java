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
 * 停车场预订
 * @author zhangruiyan
 */
@Data
public class ParkOrder {
    private Integer po_id;
    private Integer p_id;
    private String p_name;
    private String p_address;

    private Integer ps_id;
    private String ps_name;
    private String ps_size;
    private Integer ps_price;

    private Integer u_id;
    private String u_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date po_addTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date po_endTime;
    /**
     * 已生效、已失效
     */
    private String po_state;


}
