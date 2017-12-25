package com.litesky.service;

import com.litesky.model.Line;

import java.util.Date;
import java.util.List;

/**
 * Created by finefine.com on 2017/12/14.
 */
public interface LineService {

    List<Line> getAllLines();

    List<Line> findLineByStation(String station);

    /**
     * 正则匹配查询
     * @param station
     * @return
     */
    List<Line> findLineByStationRegexAndDate(String station, Date date);
}
