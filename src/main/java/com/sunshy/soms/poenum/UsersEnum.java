package com.sunshy.soms.poenum;

import lombok.Getter;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-11   08:17
 */

@Getter
public enum UsersEnum {

    EXIT(1,"退出成功"),

    LOGFAIL(2,"用户名或者密码错误");



    private Integer integer;

    private String msg;

    UsersEnum(Integer integer, String msg) {
        this.integer = integer;
        this.msg = msg;
    }}
