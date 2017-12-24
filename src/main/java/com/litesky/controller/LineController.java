package com.litesky.controller;

import com.alibaba.fastjson.JSONObject;
import com.litesky.model.Line;
import com.litesky.model.Page;
import com.litesky.model.Search;
import com.litesky.service.LineService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.sun.tools.corba.se.idl.ParameterGen;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by finefine.com on 2017/12/15.
 */
@Controller
@RequestMapping("/tickets")
public class LineController {
    @Resource
    private LineService lineService;


    @ResponseBody
    @PostMapping("/lines")
    public String lines(@RequestBody Page page) {
        List<Line> lines=lineService.getAllLines();
        page.setRows(lines);
        page.setTotal(lines.size());
        return JSONObject.toJSONString(page);
    }

    @GetMapping("/query")
    public String lineQuery() {

        return "list";
    }

    @RequiresPermissions("lines:add")
    @RequestMapping("addline")
    public String addLine() {

        return "addLine";
    }

    @RequiresPermissions("lines:delete")
    @RequestMapping("deleteline")
    public String deleteLine() {
        return "deleteLine";
    }

    @RequiresPermissions("lines:update")
    @RequestMapping("updateline")
    public String updateLine() {
        return "updateLine";
    }

    @ResponseBody
    @RequestMapping("/search")
    public String search(@RequestBody Search search){
        System.out.println(search.toString());
        Page page=new Page();
        List<Line> lines=lineService.findLineByStation(search.getStarting());
        page.setRows(lines);
        page.setTotal(lines.size());
        return JSONObject.toJSONString(page);
    }
}
