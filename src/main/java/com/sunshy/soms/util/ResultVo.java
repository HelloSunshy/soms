package com.sunshy.soms.util;

import lombok.Data;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-15   21:51
 */
@Data
public class ResultVo<T> {

    private Integer code;

    private String msg;

    private T data ;



    public static  ResultVo success(Object object){

        ResultVo resultVo = new ResultVo();

        resultVo.setCode(0);

        resultVo.setMsg("成功");

        resultVo.setData(object);

        return  resultVo;

    }


    public static  ResultVo success(){

        return  success(null);

    }

    public  static  ResultVo erro(Integer code, String msg){

        ResultVo resultVo = new ResultVo();

        resultVo.setMsg(msg);

        resultVo.setCode(code);

        return  resultVo;

    }

}
