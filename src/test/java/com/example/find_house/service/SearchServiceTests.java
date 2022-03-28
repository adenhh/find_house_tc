package com.example.find_house.service;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SearchServiceTests {

    @Autowired
    private ElasticsearchClient esClient;
}
