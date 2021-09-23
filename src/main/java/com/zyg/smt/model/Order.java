package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Order {
    private Integer o_id;
    private String o_uuid;//订单标号，由UUIDUtil生成，唯一
    private Integer ti_id;
    private String ti_name;
    private String ti_type;
    private Integer ti_price;
    private String ti_usage;//使用方法
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date o_addTime;
    private Integer u_id;//用户id
    private String u_pid;
    private String u_name;
    private String u_phone;
}
