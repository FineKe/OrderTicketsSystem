package com.litesky.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by finefine.com on 2017/12/14.
 */
@Entity
@Table(name = "line")
public class Line implements Serializable{

    private static final long serialVersionUID = -4256673794817723963L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /**
     * 车次
     */
    private String trainNumber;

    /**
     * 站点
     */
    private String stations;

    /**
     * 站点到达时间
     */
    private String stationTime;

    /**
     * 商务座票数
     */

    private int businessClassTickets;

    /**
     * 一等座票数
     */
    private int firstClassTickets;

    /**
     * 二等座票数
     */
    private int sencondClassTickets;

    /**
     * 高级软卧票数
     */
    private int seniorSoftSleeperTickets;

    /**
     * 软卧票数
     */
    private int softSleeperTickets;

    /**
     * 动卧票数
     */
    private int activelyingPosmonTickets;

    /**
     * 硬卧票数
     */
    private int touristCoachTickets;

    /**
     * 软座票数
     */
    private int softSeatTickets;

    /**
     * 硬座票数
     */
    private int hardTickets;

    /**
     * 无座票
     */
    private int noSeatTickets;

    /**
     * 路线创建时间
     */
    private Date createTime;

    /**
     * 路线更新时间
     */
    private Date updateTime;

    /**
     * 站点的票价
     */
    private String ticketsPrice;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTrainNumber() {
        return trainNumber;
    }

    public void setTrainNumber(String trainNumber) {
        this.trainNumber = trainNumber;
    }

    public String getStations() {
        return stations;
    }

    public void setStations(String stations) {
        this.stations = stations;
    }

    public String getStationTime() {
        return stationTime;
    }

    public void setStationTime(String stationTime) {
        this.stationTime = stationTime;
    }

    public int getBusinessClassTickets() {
        return businessClassTickets;
    }

    public void setBusinessClassTickets(int businessClassTickets) {
        this.businessClassTickets = businessClassTickets;
    }

    public int getFirstClassTickets() {
        return firstClassTickets;
    }

    public void setFirstClassTickets(int firstClassTickets) {
        this.firstClassTickets = firstClassTickets;
    }

    public int getSencondClassTickets() {
        return sencondClassTickets;
    }

    public void setSencondClassTickets(int sencondClassTickets) {
        this.sencondClassTickets = sencondClassTickets;
    }

    public int getSeniorSoftSleeperTickets() {
        return seniorSoftSleeperTickets;
    }

    public void setSeniorSoftSleeperTickets(int seniorSoftSleeperTickets) {
        this.seniorSoftSleeperTickets = seniorSoftSleeperTickets;
    }

    public int getSoftSleeperTickets() {
        return softSleeperTickets;
    }

    public void setSoftSleeperTickets(int softSleeperTickets) {
        this.softSleeperTickets = softSleeperTickets;
    }

    public int getActivelyingPosmonTickets() {
        return activelyingPosmonTickets;
    }

    public void setActivelyingPosmonTickets(int activelyingPosmonTickets) {
        this.activelyingPosmonTickets = activelyingPosmonTickets;
    }

    public int getTouristCoachTickets() {
        return touristCoachTickets;
    }

    public void setTouristCoachTickets(int touristCoachTickets) {
        this.touristCoachTickets = touristCoachTickets;
    }

    public int getSoftSeatTickets() {
        return softSeatTickets;
    }

    public void setSoftSeatTickets(int softSeatTickets) {
        this.softSeatTickets = softSeatTickets;
    }

    public int getHardTickets() {
        return hardTickets;
    }

    public void setHardTickets(int hardTickets) {
        this.hardTickets = hardTickets;
    }

    public int getNoSeatTickets() {
        return noSeatTickets;
    }

    public void setNoSeatTickets(int noSeatTickets) {
        this.noSeatTickets = noSeatTickets;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTicketsPrice() {
        return ticketsPrice;
    }

    public void setTicketsPrice(String ticketsPrice) {
        this.ticketsPrice = ticketsPrice;
    }

    @Override
    public String toString() {
        return "Line{" +
                "id=" + id +
                ", trainNumber='" + trainNumber + '\'' +
                ", stations='" + stations + '\'' +
                ", stationTime='" + stationTime + '\'' +
                ", businessClassTickets=" + businessClassTickets +
                ", firstClassTickets=" + firstClassTickets +
                ", sencondClassTickets=" + sencondClassTickets +
                ", seniorSoftSleeperTickets=" + seniorSoftSleeperTickets +
                ", softSleeperTickets=" + softSleeperTickets +
                ", activelyingPosmonTickets=" + activelyingPosmonTickets +
                ", touristCoachTickets=" + touristCoachTickets +
                ", softSeatTickets=" + softSeatTickets +
                ", hardTickets=" + hardTickets +
                ", noSeatTickets=" + noSeatTickets +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", ticketsPrice='" + ticketsPrice + '\'' +
                '}';
    }
}
