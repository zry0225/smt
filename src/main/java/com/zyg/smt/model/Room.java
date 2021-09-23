package com.zyg.smt.model;

import lombok.Data;

@Data
public class Room {
    private Integer r_id;
    private Integer hi_id;
    private String hi_name;
    private Integer r_price;
    private String r_type;//1.单人间 2、双人间 三人间
    private String r_floor;
    private String r_roomNum;
    private String r_size;
    private String r_note;
    private String r_img;
    private String r_bed;
    private String r_wifi;
    private String r_install;

}
