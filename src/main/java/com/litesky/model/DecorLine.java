package com.litesky.model;

import java.io.Serializable;

public class DecorLine implements Serializable{

    private static final long serialVersionUID = -3281883806033629698L;

    private Line start;
    private Line destin;
    private String middleStation;
    private String startStation;
    private String DestinStation;

    public DecorLine(Line start, Line destin, String middleStation, String startStation, String destinStation) {
        this.start = start;
        this.destin = destin;
        this.middleStation = middleStation;
        this.startStation = startStation;
        this.DestinStation = destinStation;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Line getStart() {
        return start;
    }

    public void setStart(Line start) {
        this.start = start;
    }

    public Line getDestin() {
        return destin;
    }

    public void setDestin(Line destin) {
        this.destin = destin;
    }

    public String getMiddleStation() {
        return middleStation;
    }

    public void setMiddleStation(String middleStation) {
        this.middleStation = middleStation;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation;
    }

    public String getDestinStation() {
        return DestinStation;
    }

    public void setDestinStation(String destinStation) {
        DestinStation = destinStation;
    }

    @Override
    public String toString() {
        return "DecorLine{" +
                "start=" + start.toString() +
                ", destin=" + destin.toString() +
                ", middleStation='" + middleStation + '\'' +
                ", startStation='" + startStation + '\'' +
                ", DestinStation='" + DestinStation + '\'' +
                '}';
    }
}
