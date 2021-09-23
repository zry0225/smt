package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class HotelReservation {
    private Integer hr_id;
    private String uuid;
    private Integer hi_id;
    private String hi_name;
    private Integer r_id;
    private Integer r_price;
    private Integer hr_price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hr_time;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hr_endTime;
    private Integer hr_day;
    private String hr_phone;
    private String hr_note;
    private String u_name;
    private Integer u_id;
    private String u_phone;
}
