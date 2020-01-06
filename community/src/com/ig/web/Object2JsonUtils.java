package com.ig.web;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Object2JsonUtils {
    public static void java2Json(Object o , String[] exclueds, HttpServletResponse response){
        //指定哪些属性不需要转json
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(exclueds);
        //使用json-lib 将PageBean对象转化为json，通过通过输出流写回到页面中
        //JSONObject---将单一对象转化为json
        //JSONArray---将数组或者集合对象转化为json
        String json = JSONObject.fromObject(o,jsonConfig).toString();
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void java2Json(List o , String[] exclueds, HttpServletResponse response){
        //指定哪些属性不需要转json
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(exclueds);
        //使用json-lib 将PageBean对象转化为json，通过通过输出流写回到页面中
        //JSONObject---将单一对象转化为json
        //JSONArray---将数组或者集合对象转化为json
        String json = JSONArray.fromObject(o,jsonConfig).toString();
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
