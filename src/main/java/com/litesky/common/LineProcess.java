package com.litesky.common;

import com.litesky.model.Line;

/*
票价，历时转换加工
 */
public class LineProcess {

    public static final double[] rate={4,2.5,2,3,2.3,2,1.8,1.5,1,1};//票价倍率
    public static final String tickets = "余票:";
    public static final String sPrice = "票价:";

    public static void lineDecoration(Line line,String startStation,String destination) {
       String [] stations=splitStation(line.getStations());
       double [] prices=splitPrice(line.getTicketsPrice());
       String [] stationsTime=splitStationTimes(line.getStationTime());

       //寻找站头站尾的位置
       int start=findStationIndex(startStation,stations);
       int end=findStationIndex(destination,stations);

       //计算将价格
       double price=(prices[end]-prices[start]);

       //商务座票数和价格
       line.setBusinessClassTickets(tickets+line.getBusinessClassTickets()+"\n"+ sPrice +rate[0]*price);
       //一等座
       line.setFirstClassTickets(tickets +line.getFirstClassTickets()+"\n"+sPrice+rate[1]*price);
       //二等座
       line.setSencondClassTickets(tickets +line.getSencondClassTickets()+"\n"+sPrice+rate[2]*price);
       //高级软卧
       line.setSeniorSoftSleeperTickets(tickets +line.getSeniorSoftSleeperTickets()+"\n"+sPrice+rate[3]*price);
       //软卧
       line.setSoftSleeperTickets(tickets +line.getSoftSleeperTickets()+"\n"+sPrice+rate[4]*price);
       //动卧
       line.setActivelyingPosmonTickets(tickets +line.getActivelyingPosmonTickets()+"\n"+sPrice+rate[5]*price);
       //硬卧
       line.setTouristCoachTickets(tickets +line.getTouristCoachTickets()+"\n"+sPrice+rate[6]*price);
       //软座
       line.setSoftSeatTickets(tickets +line.getSoftSeatTickets()+"\n"+sPrice+rate[7]*price);
       //硬座
       line.setHardTickets(tickets +line.getHardTickets()+"\n"+sPrice+rate[8]*price);
       //无座
       line.setNoSeatTickets(tickets +line.getNoSeatTickets()+"\n"+sPrice+rate[9]*price);
       line.setStations(stations[start]+":"+stations[end]);
       line.setStationTime(startEndTime(start,end,stationsTime));
       line.setArrivadeTime(makeArrivadeTime(start,end,stationsTime));
   }

    /**
     * 分割价格并转换成double[]
     * @param price
     * @return
     */
   public static double[] splitPrice(String price) {
       String[]prices=price.split(":");
       double []p=new double[prices.length];
       for (int i = 0; i < prices.length; i++) {
           p[i]=Double.parseDouble(prices[i]);
       }
       return p;
   }

    /**
     * 分割站点
     * @param stations
     * @return
     */
   public static String[] splitStation(String stations) {
       return stations.split(":");
   }

    /**
     * 查找站点的数组下标
     * @param station
     * @param stations
     * @return
     */
   public static int findStationIndex(String station,String [] stations) {
       for (int i = 0; i < stations.length; i++) {
           if (station.equals(stations[i])) {
               return i;
           }
       }
       return 0;
   }

    /**
     * 分割站点时间
     * @param stationTime
     * @return
     */
   public static String[] splitStationTimes(String stationTime) {
       return stationTime.split(";");
   }

    /**
     * 计算乘坐时间
     * @param start
     * @param end
     * @param stationTimes
     * @return
     */
   public static String makeArrivadeTime(int start,int end,String[] stationTimes) {
        String[] startTime=stationTimes[start].split(":");
        String[] endTime=stationTimes[end].split(":");
        int[] startTimeTemp=new int[2];
        int[] endTimeTemp=new int[2];

        startTimeTemp[0]=Integer.parseInt(startTime[0]);
        startTimeTemp[1]=Integer.parseInt(startTime[1]);
        endTimeTemp[0]=Integer.parseInt(endTime[0]);
        endTimeTemp[1]=Integer.parseInt(endTime[1]);
       if (startTimeTemp[1] > endTimeTemp[1]) {
           endTimeTemp[0]-=1;
           endTimeTemp[1]+=60;
       }
       return (endTimeTemp[0]-startTimeTemp[0])+":"+(endTimeTemp[1]-startTimeTemp[1]);
   }

    /**
     * 开始，到达时间
     * @param start
     * @param end
     * @param stationTimes
     * @return
     */
   public static String startEndTime(int start,int end,String[] stationTimes) {
       return stationTimes[start]+"\n\n"+stationTimes[end];
   }
}
