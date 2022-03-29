package com.example.find_house.service.house;

import com.example.find_house.entity.House;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;

public interface HouseService {

    Page<House>  findAll(Pageable pageable);
}
