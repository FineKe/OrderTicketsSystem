package com.litesky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

    @RequestMapping({"/","/index"})
    public String index() {
        return "home/index";
    }
}
