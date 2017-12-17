package com.litesky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by finefine.com on 2017/12/15.
 */
@Controller
@RequestMapping("/tickets")
public class LineController {

    @GetMapping("/query")
    public String lineQuery() {

        return "list";
    }
}
