package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;
import cn.wts.gym.domain.Orders;

public interface OrdersDao {
	/**
	 * 保存订单
	 * @param orders
	 */
	public void saveOrders(Orders orders);
	/**
	 * 查询订单总记录数
	 * @param condition
	 * @return
	 */
	public int findOrdersCount(Orders orders);
	/**
	 * 根据条件对订单进行分页查询
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<Orders> findOrdersByPage(int start, int rows,Orders orders);	
	/**
	 * 根据Orders_id查找课程
	 * @param orders_id
	 * @return
	 */
	public Orders findOrdersByOrders_id(Integer orders_id);
	/**
	 * 删除订单
	 * @param course
	 */
	public void deleteOrders(Orders orders);
	/**
	 * 更新订单
	 * @param course
	 */
	public void updateOrders(Orders orders);
	/**
	 * 根据订单号查询订单
	 * @param orders_no
	 * @return
	 */
	public Orders findOrdersByOrders_no(String orders_no);
	/**
	 * 根据课程号查询订单数量
	 * @param course_id
	 * @return
	 */
	public int findOrdersCountByCourse_id(Integer course_id);
	/**
	 * 根据用户id查询所有订单
	 * @param user_id
	 * @return
	 */
	public List<Orders> findOrdersByUser_id(Integer user_id);
}
