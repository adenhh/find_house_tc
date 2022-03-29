package com.example.find_house.service.house;

import com.example.find_house.entity.House;
import com.example.find_house.repository.HouseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseRepository houseRepository;

    public Page<House> findAll(Pageable pageable) {
        return houseRepository.findAll(pageable);
    }

}
