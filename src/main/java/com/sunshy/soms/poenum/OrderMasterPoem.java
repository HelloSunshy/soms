package com.sunshy.soms.poenum;

import lombok.Getter;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-12   20:39
 */
@Getter
public enum OrderMasterPoem {

    SUCCESS(1,"预约成功"),

    FAIL(2,"预约失败")
    ;

    private Integer statue;

    private String msg;

    OrderMasterPoem(Integer statue, String msg) {
        this.statue = statue;
        this.msg = msg;
    }}
