package com.just.service.impl;

import com.just.mapper.*;
import com.just.pojo.*;
import com.just.service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysServiceImpl implements SysService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private PublishHouseMapper publishHouseMapper;
    @Autowired
    private TextBookMapper textBookMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private Class1Mapper classMapper;

    /**
     * 获取所有订单
     *
     * @return orderMapper.getAllOrder();
     */
    @Override
    public List<Order> getAllOrder() {
        return orderMapper.getAllOrder();
    }


    /**
     * 获取所有教材
     *
     * @return textBookMapper.getAllTextbook()
     */
    @Override
    public List<TextBook> getAllTextbook() {
        return textBookMapper.getAllTextbook();
    }

    /**
     * 查询用户登陆信息-用户名&密码
     *
     * @param userName
     * @return
     */

    @Override
    public User findUserByLogin(String userName) {
        return userMapper.findUserByLogin(userName);
    }

    /**
     * 增加用户
     *
     * @param user
     * @return
     */
    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    /**
     * 查询用户信息
     *
     * @param userName
     * @return
     */
    @Override
    public User selectUserByName(String userName) {
        return userMapper.selectUserByName(userName);
    }

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    /**
     * 修改用户密码
     *
     * @param userId
     * @param password
     * @return
     */
    @Override
    public int updatePwd(int userId, String password) {
        return userMapper.updatePwd(userId, password);
    }

    /**
     * 查询所有出版社名称
     *
     * @return publishList
     */
    @Override
    public List<PublishHouse> getAllPublish() {
        return publishHouseMapper.getAllPublish();
    }

    @Override
    public TextBook getTextbookById(int bookId) {
        return textBookMapper.getTextbookById(bookId);
    }

    /**
     * 修改教材信息
     *
     * @param textBook
     * @return
     */
    @Override
    public int updateTextbook(TextBook textBook) {
        return textBookMapper.updateTextbook(textBook);
    }

    /**
     * 添加教材
     *
     * @param textBook
     * @return
     */
    @Override
    public int insertTextbook(TextBook textBook) {
        return textBookMapper.insertTextbook(textBook);
    }

    /**
     * 根据Id删除教材
     *
     * @param bookId
     * @return
     */
    @Override
    public int deleteTextbookById(Integer bookId) {
        return textBookMapper.deleteTextbookById(bookId);
    }

    /**
     * 通过Id查询订单
     *
     * @param id
     * @return
     */
    @Override
    public Order getOrderById(Integer id) {
        return orderMapper.getOrderById(id);
    }

    /**
     * 修改订单信息
     *
     * @param order
     * @return
     */
    @Override
    public int updateOrderState(Order order) {
        return orderMapper.updateOrder(order);
    }

    /**
     * 通过id修改订单信息(状态)
     *
     * @param id
     * @param orderState
     * @return
     */
    @Override
    public int updateOrderState(int id, int orderState) {
        return orderMapper.updateOrderState(id, orderState);
    }

    /**
     * 添加订单
     *
     * @param order
     * @return
     */
    @Override
    public int insertOrder(Order order) {
        return orderMapper.insertOrder(order);
    }

    /**
     * 通过订单状态查询订单
     *
     * @param i
     * @return
     */
    @Override
    public List<Order> getOrderByState(int i) {
        return orderMapper.getOrderByState(i);
    }

    /**
     * 通过用户名和订单状态查询订单
     *
     * @param userId
     * @param i
     * @return
     */
    @Override
    public List<Order> getOrderByUserAndState(Integer userId, int i) {
        return orderMapper.getOrderByUserAndState(userId, i);
    }

    /**
     * 按照院系查询订单
     *
     * @param userDept
     * @param i
     * @return
     */
    @Override
    public List<Order> getOrderByStateAndDept(String userDept, int i) {
        return orderMapper.getOrderByStateAndDept(userDept, i);
    }

    /**
     * 获取通过最终审核的订单
     *
     * @param orderState
     * @return
     */
    @Override
    public List<Order> getManOrderByState(int orderState) {
        return orderMapper.getManOrderByState(orderState);
    }

    /**
     * 同过String获取订单列表
     *
     * @param idStr
     * @return
     */
    @Override
    public List<Order> getOrderInString(String[] idStr) {
        return orderMapper.getOrderInString(idStr);
    }

    /**
     * 获取所有用户信息
     *
     * @return
     */
    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    /**
     * 通过Id查询用户信息
     *
     * @param userId
     * @return
     */
    @Override
    public User findUserById(int userId) {
        return userMapper.findUserById(userId);
    }

    /**
     * 修改订单
     *
     * @param order
     * @return
     */
    @Override
    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    /**
     * 按班级查询订单
     *
     * @return
     */
    @Override
    public List<Order> getAllOrderinclass() {
        return orderMapper.getAllOrderinclass();
    }

    /**
     * 获得所有的班级信息
     *
     * @return
     */
    @Override
    public List<Class1> getAllClass() {
        return classMapper.getAllClass();
    }

    /**
     * 按教材查询订单并排序
     * @return
     */
    @Override
    public List<Order> getAllOrderInTbookId() {
        return orderMapper.getAllOrderInTbookId();
    }

    /**
     * 通过id删除用户
     * @param userId
     * @return
     */
    @Override
    public int deleteUserById(int userId) {
        return userMapper.deleteUserById(userId);
    }

    /**
     * 按出版社统计书籍数量
     * @return
     */
    @Override
    public List<Order> getAllOrderGyPublish() {
        return orderMapper.getAllOrderGyPublish();
    }
}
