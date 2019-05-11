package com.sunshy.soms.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-12   20:18
 */
public class Key {

    public  static synchronized String uuid(){

        Random random = new Random();

        Integer num   = random.nextInt(900000) + 100000;

        long l = System.currentTimeMillis();

        return String.valueOf(num)+l;

    }



    public static synchronized String timeUuid(){


        Date date = new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String format = simpleDateFormat.format(date);

        String uuid = String.valueOf(UUID.randomUUID());

        return uuid+"-"+format;

    }


}
