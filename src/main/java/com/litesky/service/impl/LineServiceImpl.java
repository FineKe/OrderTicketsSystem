package com.litesky.service.impl;

import com.litesky.dao.LineDao;
import com.litesky.model.Line;
import com.litesky.service.LineService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by finefine.com on 2017/12/14.
 */
@Service
@Transactional
public class LineServiceImpl implements LineService{

    @Resource
    private LineDao lineDao;

    @Override
    public List<Line> getAllLines() {
       List<Line> lines=new ArrayList<>();
        for (Line line : lineDao.findAll()) {
            lines.add(line);
        }
        return lines;
    }

    @Override
    public List<Line> findLineByStation(String station) {
        return lineDao.findByStationsLike(station);
    }

    @Override
    public List<Line> findLineByStationRegexAndDate(String station, Date date) {
        return lineDao.findByStationsContainingAndStatrtingDate(station,date);
    }

    @Override
    public Line findById(Long id) {
        return lineDao.findById(id);
    }

    @Override
    public void deleteById(Long id) {
        lineDao.delete(id);
    }


}
