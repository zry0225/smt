package com.zyg.smt.model;

import lombok.Data;

@Data
public class RouteInfo {
    private Integer ri_id;//线路id
    private String ri_name;//线路名称
    private String ri_content;//线路主要内容
    private String ri_note;//特色或其他
    private String ri_type;//类型
    private Integer ri_collect;//收藏人数
    private Integer ri_views;//点赞人数

}
