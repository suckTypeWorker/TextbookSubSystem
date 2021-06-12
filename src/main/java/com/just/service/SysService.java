package com.just.service;

import com.just.pojo.*;

import java.util.List;

public interface SysService {

    /**
     * 获取所有订单
     * @return orderMapper.getAllOrder();
     */
    List<Order> getAllOrder();


    /**
     * 获取所有教材
     * @return
     */
    List<TextBook> getAllTextbook();

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
    int updatePwd(int userId,String password);

    /**
     * 查询所有出版社名称
     * @return publishList
     */
    List<PublishHouse> getAllPublish();

    TextBook getTextbookById(int bookId);

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

    /**
     * 通过Id查询订单
     * @param id
     * @return
     */
    Order getOrderById(Integer id);

    /**
     * 修改订单信息
     * @param order
     * @return
     */
    int updateOrderState(Order order);

    /**
     * 通过id修改订单信息(状态)
     * @param id
     * @param orderState
     * @return
     */
    int updateOrderState(int id, int orderState);

    /**
     * 添加订单
     * @param order
     * @return
     */
    int insertOrder(Order order);

    /**
     * 通过订单状态查询订单
     * @param i
     * @return
     */
    List<Order> getOrderByState(int i);

    /**
     * 通过用户名和订单状态查询订单
     * @param userId
     * @param i
     * @return
     */
    List<Order> getOrderByUserAndState(Integer userId, int i);

    /**
     * 按照院系查询订单
     *
     * @param userDept
     * @param i
     * @return
     */
    List<Order> getOrderByStateAndDept(String userDept, int i);

    /**
     * 获取通过最终审核的订单
     * @param orderState
     * @return
     */
    List<Order> getManOrderByState(int orderState);

    /**
     * 同过String获取订单列表
     * @param idStr
     * @return
     */
    List<Order> getOrderInString(String[] idStr);

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
     * 修改订单
     * @param order
     * @return
     */
    int updateOrder(Order order);

    /**
     * 按班级查询订单
     * @return
     */
    List<Order> getAllOrderinclass();

    /**
     * 获得所有的班级信息
     * @return
     */
    List<Class1> getAllClass();

    /**
     * 按教材查询订单并排序
     * @return
     */
    List<Order> getAllOrderInTbookId();

    /**
     * 通过id删除用户
     * @param userId
     * @return
     */
    int deleteUserById(int userId);

    /**
     * 按出版社统计书籍数量
     * @return
     */
    List<Order> getAllOrderGyPublish();
}
