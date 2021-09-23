package com.zyg.smt.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class User {
    private Integer u_id;
    private String u_name;
    private String u_sex;
    private String u_password;
    private Integer u_age;
    private String u_phone;
    private String u_qq;
    private String u_img;
    private String u_pid;//身份证
    private String u_mail;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date u_bir;//生日
    private String u_power;
    private String u_state;//正常、禁用
    private String user_question;
    private String user_answer;

}
