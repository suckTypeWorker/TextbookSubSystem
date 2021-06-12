package com.just.mapper;

import com.just.pojo.PublishHouse;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublishHouseMapper {

    /**
     * 查询所有出版社名称
     * @return publishList
     */
    List<PublishHouse> getAllPublish();
}
