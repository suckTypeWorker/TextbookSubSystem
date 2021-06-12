package com.just.mapper;

import com.just.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    /**
     * 查询用户登陆信息-用户名&密码
     * @param userName
     * @return
     */
    User findUserByLogin(String userName);

    /**
     * 增加用户
     * @param user
     * @return
     */
    int insertUser(User user);

    /**
     * 查询用户信息
     * @param userName
     * @return
     */
    User selectUserByName(String userName);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    int updateUser(User user);

    /**
     * 修改用户密码
     * @param userId
     * @param password
     * @return
     */
    int updatePwd(@Param("userId") int userId, @Param("password") String password);

    /**
     * 获取所有用户信息
     * @return
     */
    List<User> getAllUser();

    /**
     * 通过Id查询用户信息
     * @param userId
     * @return
     */
    User findUserById(int userId);

    /**
     * 通过id删除用户
     * @param userId
     * @return
     */
    int deleteUserById(int userId);

}
