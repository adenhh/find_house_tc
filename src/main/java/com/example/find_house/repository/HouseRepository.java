package com.example.find_house.repository;


import com.example.find_house.entity.House;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface HouseRepository extends JpaRepository<House, Long> {

    Page<House> findAll(Pageable pageable);

}
