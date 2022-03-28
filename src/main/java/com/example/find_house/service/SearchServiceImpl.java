package com.example.find_house.service;

import com.example.find_house.entity.House;
import com.example.find_house.repository.HouseRepository;
import com.example.find_house.service.bo.search.HouseIndexMessage;
import com.example.find_house.service.bo.search.HouseIndexTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.client.Request;
import org.elasticsearch.client.Response;
import org.elasticsearch.client.RestClient;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class SearchServiceImpl implements SearchService {

    @Autowired
    private RestClient esCli;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private HouseRepository houseRepository;

    private void createOrUpdateIndex(HouseIndexMessage message) throws IOException {
        Long houseId = message.getHouseId();
        // id 反查
        House house = houseRepository.findOne(houseId);
        if (house == null) {

            return;
        }

        HouseIndexTemplate indexTemplate = new HouseIndexTemplate();
        modelMapper.map(house, indexTemplate);
        // json 序列化
        ObjectMapper mapper = new ObjectMapper();
        String houseDoc = mapper.writeValueAsString(indexTemplate);
        Request indexRequest = new Request("PUT", "/house-index-1/_doc");

        indexRequest.setJsonEntity(houseDoc);

        Response response = esCli.performRequest(indexRequest);
        // 错误处理逻辑

    }
}
