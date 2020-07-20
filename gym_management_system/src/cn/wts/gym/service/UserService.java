package cn.wts.gym.service;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.User;
import cn.wts.gym.dao.OrdersDao;
import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.Course;
import cn.wts.gym.domain.Equip;
import cn.wts.gym.domain.News;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.domain.PageBean;

public interface UserService {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	/**
	 * 用户注册
	 * @param user
	 */
	public void saveUser(User user);
	/**
	 * 根据用户名查找
	 * @param username
	 * @return
	 */
	// 模块1：个人信息==========================================================================
	public User findUserByUsername(String username);
	/**
	 * 修改个人信息
	 * @param user
	 */
	public void updateUser(User user);
	
	// 模块2：健身器材==========================================================================
	/**
	 * 查询健身器材
	 * @param currentPage
	 * @return
	 */
	public List<Equip> findAllEquip();
	
	// 模块3：教练团队==========================================================================
	public  List<Coach> findAllCoach();
	
	// 模块4：健身课程和订单======================================================================
	/**
	 * 分页查询健身课程
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<Course> findCourseByPage(int currentPage, Map<String, String[]> condition);
	/**
	 * 根据course_id查询课程
	 * @param course_id
	 * @return
	 */
	public Course findCourseByCourse_id(Integer course_id);
	/**
	 * 根据course_id查询该课程订单数量
	 * @param course_id
	 * @return
	 */
	public int findOrdersCountByCourse_id(Integer course_id);
	/**保存订单
	 * 
	 * @param orders
	 */
	public void saveOrders(Orders  orders);
	/**
	 * 根据user_id查找所有orders
	 * @param user_id
	 * @return
	 */
	public List<Orders> findOrdersByUser_id(Integer user_id);
	/**
	 * 根据orders_id查找订单
	 * @param orders_id
	 * @return
	 */
	public Orders FindOrdersByOrders_id(Integer orders_id);
	/**
	 * 删除订单
	 * @param orders
	 */
	public void deleteOrders(Orders orders);
	/**
	 * 修改订单
	 * @param orders
	 */
	public void updateOrders(Orders orders);
	
	// 模块5：健身动态==========================================================================
	
	public List<News> findAllNews();
	
	// 模块6：会员卡==========================================================================
	public Card findCardByUser_id(Integer user_id);
}
