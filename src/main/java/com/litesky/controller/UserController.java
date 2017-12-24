package com.litesky.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.hibernate.cache.spi.access.UnknownAccessTypeException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class UserController {

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, Map<String,Object> map) throws Exception {
        Subject subject=SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout();
        }
        String exception= (String) request.getAttribute("shiroLoginFailure");
        System.out.println(exception);
        String msg="";
        if (exception != null) {
            if (UnknownAccessTypeException.class.getName().equals(exception)) {
                msg="账号不存在";
            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
                msg = "密码错误";
            } else {
                msg=exception;
            }
        }
        map.put("msg",msg);
        return "/login";
    }

    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String logout() {
        Subject subject=SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login";
    }

    @RequiresPermissions("user:update")
    @RequestMapping("/user/user")
    public String userManager() {
        return "user";
    }
}
