package com.ig.service;

import com.ig.pojo.Dictionary;

import java.util.List;

public interface DictionaryService {
    List<Dictionary> getActivityType();
    Dictionary getActivityType(int id);


    List<Dictionary> getActivityTransport();
    Dictionary getActivityTransport(int id);

}
