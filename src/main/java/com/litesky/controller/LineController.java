package com.litesky.controller;

import com.alibaba.fastjson.JSONObject;
import com.litesky.common.LineProcess;
import com.litesky.dao.LineDao;
import com.litesky.model.DecorLine;
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
import java.util.*;

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
        List<Line> lines = lineService.getAllLines();
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
    public String search(@RequestBody Search search) {
        System.out.println(search.toString());
        List<Line> lines=new ArrayList<>();
        Page page = new Page();
        switch (search.getAdvance()) {
            case 2:
            case 1:
                DecorLine decorLine = shortLine(search);
                if (decorLine != null) {
                    LineProcess.lineDecoration(decorLine.getStart(),decorLine.getStartStation(),decorLine.getMiddleStation());
                    LineProcess.lineDecoration(decorLine.getDestin(),decorLine.getMiddleStation(),decorLine.getDestinStation());
                    lines.add(decorLine.getStart());
                    lines.add(decorLine.getDestin());
                }

                break;
//            case 2:
//                lines = cheapLine(search);
//                break;
            default:
                lines = lineService.findLineByStationRegexAndDate(search.getStarting() + "%" + search.getDestination(), search.getStartingDate());
                for (Line line : lines) {
                    LineProcess.lineDecoration(line, search.getStarting(), search.getDestination());
                }
        }

        if (lines != null && lines.size() > 0) {
            page.setRows(lines);
            page.setTotal(lines.size());
        } else {
            page.setRows(null);
            page.setTotal(0);
        }
        return JSONObject.toJSONString(page);
    }

    @ResponseBody
    @PostMapping("/delete")
    public String deleteLineById(Long id) {
        System.out.println("id:" + id);
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
            return resultData(-1, null, "更新失败，服务器内部错误");
        }
    }

    @ResponseBody
    @RequestMapping("/create")
    public String createLine(@RequestBody Line line) {
        System.out.println(line);
        line.setCreateTime(new Date());
        if (lineService.saveLine(line) != null) {
            return resultData(0, line, "更新成功");
        } else {
            return resultData(-1, null, "更新失败，服务器内部错误");
        }
    }

    @RequestMapping(value = "/advanced", method = RequestMethod.GET)
    public String advanceSearch() {
        return "advanceSearch";
    }


    /**
     * 最短路径搜索
     *
     * @param search
     * @return
     */
    public DecorLine shortLine(Search search) {

        Set<Line> linesStart = new HashSet<>();
        Set<Line> linesDestin = new HashSet<>();
        linesStart.addAll(lineService.findLineByStationRegexAndDate(search.getStarting(),search.getStartingDate()));
        linesDestin.addAll(lineService.findLineByStationRegexAndDate(search.getDestination(),search.getStartingDate()));
        linesStart.removeAll(lineService.findLineByStationRegexAndDate(search.getStarting() + "%" + search.getDestination(), search.getStartingDate()));
        linesDestin.removeAll(lineService.findLineByStationRegexAndDate(search.getStarting() + "%" + search.getDestination(), search.getStartingDate()));
        for (Line start : linesStart) {
            for (Line destin : linesDestin) {
                String middleStation=findMiddleStation(start, destin);
                if ( middleStation!= null) {
                    DecorLine decorLine=new DecorLine(start,destin,middleStation,search.getStarting(),search.getDestination());
                    return decorLine;
                }
            }
        }


        return null;
    }

    /**
     * 价格最低搜索
     *
     * @param search
     * @return
     */
    public List<Line> cheapLine(Search search) {
        return null;
    }


    /**
     * 寻找中间站点
     * @return
     */
    public String findMiddleStation(Line start,Line Destin)
    {
        String[] stationsStart=start.getStations().split(":");
        String[] stationsDesti=Destin.getStations().split(":");
        for (String s : stationsStart) {
            for (String stemp : stationsDesti) {
                if (s.equals(stemp)) {
                    return s;
                }
            }
        }
        return null;
    }



}
