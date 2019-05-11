package com.sunshy.soms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-22   17:52
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public ModelAndView toindex(){

        return new ModelAndView("index");
    }

}
