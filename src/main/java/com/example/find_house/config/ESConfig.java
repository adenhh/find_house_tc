package com.example.find_house.config;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ESConfig {
    // 注入Spring boot application.properties配置的属性的值
    @Value("${elasticsearch.host}")
    private String esHost;

    @Value("${elasticsearch.port}")
    private int esPort;

//    @Value("${elasticsearch.cluster.name}")
//    private String esName;

//     等价于spring的xml配置文件中的<bean>，作用为：注册bean对象
    @Bean
    public RestClient esClient() {

        RestClient restClient = RestClient.builder(
                new HttpHost("localhost", 9200, "http")).build();
        return restClient;
    }
}
