package com.just.mapper;

import com.just.pojo.Class1;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Class1Mapper {

    /**
     * 获得所有的班级信息
     * @return
     */
    List<Class1> getAllClass();
}
