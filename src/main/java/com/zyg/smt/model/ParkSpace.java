package com.zyg.smt.model;

import lombok.Data;

/**
 * 停车位类
 */
@Data
public class ParkSpace {
    private Integer ps_id;
    private String ps_name;
    private Integer p_id;
    private String ps_size;
    private Integer ps_state;
    private Integer ps_price;
}
