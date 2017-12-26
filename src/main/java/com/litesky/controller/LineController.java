package com.litesky.controller;

import com.alibaba.fastjson.JSONObject;
import com.litesky.common.LineProcess;
import com.litesky.dao.LineDao;
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
public class LineController extends BaseController {
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
        System.out.println(search.getStartingDate().toString());
        Date date=search.getStartingDate();
        date.setHours(0);
        date.setMinutes(0);
        date.setSeconds(0);
        System.out.println(search.getStartingDate().toString());
        Page page=new Page();
        List<Line> lines=lineService.findLineByStationRegexAndDate(search.getStarting()+"%"+search.getDestination(),search.getStartingDate());
        for (Line line : lines) {
            LineProcess.lineDecoration(line,search.getStarting(),search.getDestination());
        }
        page.setRows(lines);
        page.setTotal(lines.size());
        return JSONObject.toJSONString(page);
    }

    @ResponseBody
    @PostMapping("/delete")
    public String deleteLineById(Long id) {
        System.out.println("id:"+id);
        lineService.deleteById(id);
        return resultData(0, null, "删除成功");
    }

    @ResponseBody
    @RequestMapping("/update")
    public String updateLine(@RequestBody Line line) {

        System.out.println(line);
        if (lineService.saveLine(line) != null) {
            return resultData(0, line, "更新成功");
        } else {
            return resultData(-1,null,"更新失败，服务器内部错误");
        }
//        return resultData(-1,null,"更新失败，服务器内部错误");

    }

    @ResponseBody
    @RequestMapping("/create")
    public String createLine(@RequestBody Line line) {
        System.out.println(line);
        line.setCreateTime(new Date());
        if (lineService.saveLine(line) != null) {
            return resultData(0, line, "更新陈宫");
        } else {
            return resultData(-1,null,"更新失败，服务器内部错误");
        }
    }
}
