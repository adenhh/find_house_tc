package com.example.find_house;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// same as @Configuration @EnableAutoConfiguration @ComponentScan
@SpringBootApplication
// @ResponseBody和@Controller的合集
@RestController
public class FindHouseApplication {

    public static void main(String[] args) {
        SpringApplication.run(FindHouseApplication.class, args);
    }

    @GetMapping("/hello")
    public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
        return String.format("Hello %s!", name);
    }

}
