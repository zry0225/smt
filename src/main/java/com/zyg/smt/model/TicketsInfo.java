package com.zyg.smt.model;

import lombok.Data;

@Data
public class TicketsInfo {
    private Integer ti_id;
    private String ti_name;
    private String ti_type;//
    private Integer ti_price;
    private String ti_note;//其他
    private String ti_apply;//适用条件
    private String ti_policy;//购买政策
    private String ti_usage;//使用方法
    private String ti_other;//补充说明
    private String ti_booking;//预约场次
}
