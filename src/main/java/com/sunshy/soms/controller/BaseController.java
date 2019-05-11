package com.sunshy.soms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   17:53
 */
@Controller
@RequestMapping("/base")
public class BaseController {


    @RequestMapping("/tologin")
    public ModelAndView loginView(){

        return new ModelAndView("login");
    }

    @RequestMapping("/hi")
    public ModelAndView hi(){

        return new ModelAndView("doctor");
    }







}
