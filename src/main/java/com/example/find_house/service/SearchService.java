package com.example.find_house.service;

import com.example.find_house.service.bo.search.HouseIndexMessage;

import java.io.IOException;

public interface SearchService {

    /**
     * 索引目标房源
     * @param message
     */
    void createOrUpdateIndex(HouseIndexMessage message) throws IOException;

    /**
     * 移除房源索引
     * @param houseId
     */
    void remove(Long houseId);

    /**
     * 查询房源接口
     * @param rentSearch
     * @return
     */


}
