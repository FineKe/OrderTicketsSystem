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
     * 历经时间
     */
    private String arrivadeTime;

    /**
     * 出发日期
     */
    private Date statrtingDate;

    /**
     * 商务座票数
     */

    private String businessClassTickets;

    /**
     * 一等座票数
     */
    private String firstClassTickets;

    /**
     * 二等座票数
     */
    private String sencondClassTickets;

    /**
     * 高级软卧票数
     */
    private String seniorSoftSleeperTickets;

    /**
     * 软卧票数
     */
    private String softSleeperTickets;

    /**
     * 动卧票数
     */
    private String activelyingPosmonTickets;

    /**
     * 硬卧票数
     */
    private String touristCoachTickets;

    /**
     * 软座票数
     */
    private String softSeatTickets;

    /**
     * 硬座票数
     */
    private String hardTickets;

    /**
     * 无座票
     */
    private String noSeatTickets;

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

    public String getArrivadeTime() {
        return arrivadeTime;
    }

    public void setArrivadeTime(String arrivadeTime) {
        this.arrivadeTime = arrivadeTime;
    }

    public Date getStatrtingDate() {
        return statrtingDate;
    }

    public void setStatrtingDate(Date statrtingDate) {
        this.statrtingDate = statrtingDate;
    }

    public String getBusinessClassTickets() {
        return businessClassTickets;
    }

    public void setBusinessClassTickets(String businessClassTickets) {
        this.businessClassTickets = businessClassTickets;
    }

    public String getFirstClassTickets() {
        return firstClassTickets;
    }

    public void setFirstClassTickets(String firstClassTickets) {
        this.firstClassTickets = firstClassTickets;
    }

    public String getSencondClassTickets() {
        return sencondClassTickets;
    }

    public void setSencondClassTickets(String sencondClassTickets) {
        this.sencondClassTickets = sencondClassTickets;
    }

    public String getSeniorSoftSleeperTickets() {
        return seniorSoftSleeperTickets;
    }

    public void setSeniorSoftSleeperTickets(String seniorSoftSleeperTickets) {
        this.seniorSoftSleeperTickets = seniorSoftSleeperTickets;
    }

    public String getSoftSleeperTickets() {
        return softSleeperTickets;
    }

    public void setSoftSleeperTickets(String softSleeperTickets) {
        this.softSleeperTickets = softSleeperTickets;
    }

    public String getActivelyingPosmonTickets() {
        return activelyingPosmonTickets;
    }

    public void setActivelyingPosmonTickets(String activelyingPosmonTickets) {
        this.activelyingPosmonTickets = activelyingPosmonTickets;
    }

    public String getTouristCoachTickets() {
        return touristCoachTickets;
    }

    public void setTouristCoachTickets(String touristCoachTickets) {
        this.touristCoachTickets = touristCoachTickets;
    }

    public String getSoftSeatTickets() {
        return softSeatTickets;
    }

    public void setSoftSeatTickets(String softSeatTickets) {
        this.softSeatTickets = softSeatTickets;
    }

    public String getHardTickets() {
        return hardTickets;
    }

    public void setHardTickets(String hardTickets) {
        this.hardTickets = hardTickets;
    }

    public String getNoSeatTickets() {
        return noSeatTickets;
    }

    public void setNoSeatTickets(String noSeatTickets) {
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
                ", arrivadeTime=" + arrivadeTime +
                ", statrtingDate=" + statrtingDate +
                ", businessClassTickets='" + businessClassTickets + '\'' +
                ", firstClassTickets='" + firstClassTickets + '\'' +
                ", sencondClassTickets='" + sencondClassTickets + '\'' +
                ", seniorSoftSleeperTickets='" + seniorSoftSleeperTickets + '\'' +
                ", softSleeperTickets='" + softSleeperTickets + '\'' +
                ", activelyingPosmonTickets='" + activelyingPosmonTickets + '\'' +
                ", touristCoachTickets='" + touristCoachTickets + '\'' +
                ", softSeatTickets='" + softSeatTickets + '\'' +
                ", hardTickets='" + hardTickets + '\'' +
                ", noSeatTickets='" + noSeatTickets + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", ticketsPrice='" + ticketsPrice + '\'' +
                '}';
    }
}
