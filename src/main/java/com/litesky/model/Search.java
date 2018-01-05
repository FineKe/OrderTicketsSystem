package com.litesky.model;

import java.io.Serializable;
import java.util.Date;

public class Search implements Serializable{

    private static final long serialVersionUID = -235377423523683443L;

    /**
     * 出发地
     */
    private String starting;

    /**
     * 目的地
     */
    private String destination;

    /**
     * 出发日期
     */
    private Date startingDate;

    /**
     * 高级搜索选项
     */
    private int advance;


    public String getStarting() {
        return starting;
    }

    public void setStarting(String starting) {
        this.starting = starting;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(Date startingDate) {
        this.startingDate = startingDate;
    }

    public int getAdvance() {
        return advance;
    }

    public void setAdvance(int advance) {
        this.advance = advance;
    }

    @Override
    public String toString() {
        return "Search{" +
                "starting='" + starting + '\'' +
                ", destination='" + destination + '\'' +
                ", startingDate=" + startingDate +
                ", advance=" + advance +
                '}';
    }
}
