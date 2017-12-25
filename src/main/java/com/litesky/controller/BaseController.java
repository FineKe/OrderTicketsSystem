package com.litesky.controller;

import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class BaseController {

   public String resultData(int code,Object data,String message) {
       Map<String,Object> map=new HashMap<>();
       map.put("code",code);
       if (data != null) {
           map.put("data",data);
       }
       map.put("message",message);
       return JSONObject.toJSONString(map);
   }
}
