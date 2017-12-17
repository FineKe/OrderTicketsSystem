package com.litesky.controller;

import com.alibaba.fastjson.JSONObject;
import com.litesky.dao.LineDao;
import com.litesky.dao.UserDao;
import com.litesky.model.Line;
import com.litesky.model.User;
import com.litesky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by finefine.com on 2017/12/11.
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    UserService userService;

    @ResponseBody
    @PostMapping("/user")
    public String addUser(@RequestBody User user) {

        return JSONObject.toJSONString(userService.save(user));
    }
}
