package com.just.mapper;

import com.just.pojo.TextBook;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TextBookMapper {
    /**
     * 获取所有教材
     * @return
     */
    List<TextBook> getAllTextbook();

    TextBook getTextbookById(@Param("bookId") int bookId);

    /**
     * 修改教材信息
     * @param textBook
     * @return
     */
    int updateTextbook(TextBook textBook);

    /**
     * 添加教材
     * @param textBook
     * @return
     */
    int insertTextbook(TextBook textBook);

    /**
     * 根据Id删除教材
     * @param bookId
     * @return
     */
    int deleteTextbookById(Integer bookId);
}
