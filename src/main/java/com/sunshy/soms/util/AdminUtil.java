package com.sunshy.soms.util;

import javax.servlet.http.HttpSession;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-19   20:45
 */
public class AdminUtil {


    public static  Integer getId(HttpSession session){

        Integer adminId = (Integer) session.getAttribute("adminId");

        return adminId;
    }

}
