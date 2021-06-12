package com.just.mapper;

import com.just.pojo.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    /**
     * 获取所有订单
     * @return List
     */
    List<Order> getAllOrder();

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
    int updateOrder(Order order);

    /**
     * 通过id修改订单信息(状态)
     * @param id
     * @param orderState
     * @return
     */
    int updateOrderState(@Param("id") int id, @Param("orderState") int orderState);

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
    List<Order> getOrderByUserAndState(@Param("userId") Integer userId, @Param("i") int i);

    /**
     * 按照院系查询订单
     *
     * @param userDept
     * @param i
     * @return
     */
    List<Order> getOrderByStateAndDept(@Param("userDept") String userDept, @Param("i") int i);

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
    List<Order> getOrderInString(@Param("list") String[] idStr);

    /**
     * 按班级查询订单
     * @return
     */
    List<Order> getAllOrderinclass();

    /**
     * 按教材查询订单并排序
     * @return
     */
    List<Order> getAllOrderInTbookId();

    /**
     * 按出版社统计书籍数量
     * @return
     */
    List<Order> getAllOrderGyPublish();
}
