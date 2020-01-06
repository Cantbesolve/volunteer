package com.ig.utils;

import org.apache.commons.beanutils.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDateConverter implements Converter {
    @Override
    public Object convert(Class arg0, Object arg1) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = simpleDateFormat.parse(arg1.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

}
