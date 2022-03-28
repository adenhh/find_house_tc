package com.example.find_house.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import com.example.find_house.entity.House;
import org.springframework.data.repository.PagingAndSortingRepository;


public interface HouseRepository extends PagingAndSortingRepository<House, Long>, JpaSpecificationExecutor<House> {

    House findOne(Long houseId);
}
