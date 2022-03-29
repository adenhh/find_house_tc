package com.example.find_house.web.controller.house;

import com.example.find_house.base.ApiResponse;
import com.example.find_house.entity.House;
import com.example.find_house.service.house.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class house {

    @Autowired
    private HouseService houseService;

    @GetMapping("/api/house/list")
    public ApiResponse GetHouseList(
            @RequestParam(value = "page", defaultValue = "0") int pageNo,
            @RequestParam(value = "size", defaultValue = "10") int size
    ) {


        Page<House> page = houseService.findAll(PageRequest.of(pageNo, size));

        ApiResponse response = ApiResponse.toSuccess(page);
        return response;
    }

}
