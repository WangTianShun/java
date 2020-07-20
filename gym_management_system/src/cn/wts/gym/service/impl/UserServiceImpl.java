package cn.wts.gym.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import cn.wts.gym.dao.CardDao;
import cn.wts.gym.dao.CoachDao;
import cn.wts.gym.dao.CourseDao;
import cn.wts.gym.dao.EquipDao;
import cn.wts.gym.dao.NewsDao;
import cn.wts.gym.dao.OrdersDao;
import cn.wts.gym.dao.UserDao;
import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.Course;
import cn.wts.gym.domain.Equip;
import cn.wts.gym.domain.News;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.UserService;
@Transactional
public class UserServiceImpl implements UserService{
	//依赖注入
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	private EquipDao equipDao;
	public void setEquipDao(EquipDao equipDao) {
		this.equipDao = equipDao;
	}
	
	private CourseDao courseDao;
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
	
	private OrdersDao ordersDao;
	public void setOrdersDao(OrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}
	
	private CoachDao coachDao;
	public void setCoachDao(CoachDao coachDao) {
		this.coachDao = coachDao;
	}
	private NewsDao newsDao;
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	private CardDao cardDao;

	public void setCardDao(CardDao cardDao) {
		this.cardDao = cardDao;
	}

	/**
	 *  模块1：用户模块==========================================================================
	 */
	//用户登录
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}
	
	//用户注册
	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("添加用户service执行。。。。");
		userDao.saveUser(user);
	}
	@Override
	public User findUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userDao.findUserByUsername(username);
	}
	//修改个人信息
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}
	
	
	
	/**
	 *  模块2：健身器材==========================================================================
	 */
	
	@Override
	public List<Equip> findAllEquip() {
		// TODO Auto-generated method stub
		return equipDao.findAllEquip();
	}
	/**
	 *  模块3：教练团队==========================================================================
	 */
	
	@Override
	public List<Coach> findAllCoach() {
		// TODO Auto-generated method stub
		return coachDao.findAllCoach();
	}
	/**
	 *  模块4：健身课程和订单==========================================================================
	 */
	@Override
	public PageBean<Course> findCourseByPage(int currentPage, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<Course> pageBean = new PageBean<Course>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = courseDao.findCourseCount(condition);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<Course> list = courseDao.findCourseByPage(start, rows, condition);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}
	@Override
	public Course findCourseByCourse_id(Integer course_id) {
		// TODO Auto-generated method stub
		return courseDao.findCourseByCourse_id(course_id);
	}
	@Override
	public int findOrdersCountByCourse_id(Integer course_id) {
		// TODO Auto-generated method stub
		return ordersDao.findOrdersCountByCourse_id(course_id);
	}
	@Override
	public void saveOrders(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.saveOrders(orders);
	}
	@Override
	public List<Orders> findOrdersByUser_id(Integer user_id) {
		// TODO Auto-generated method stub
		return ordersDao.findOrdersByUser_id(user_id);
	}
	@Override
	public Orders FindOrdersByOrders_id(Integer orders_id) {
		// TODO Auto-generated method stub
		return ordersDao.findOrdersByOrders_id(orders_id);
	}
	@Override
	public void deleteOrders(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.deleteOrders(orders);
	}
	@Override
	public void updateOrders(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.updateOrders(orders);
	}
	/**
	 *  模块5：健身动态==========================================================================
	 */
	@Override
	public List<News> findAllNews() {
		// TODO Auto-generated method stub
		return newsDao.findAllNews();
	}

	@Override
	public Card findCardByUser_id(Integer user_id) {
		// TODO Auto-generated method stub
		return cardDao.findCardByUser_id(user_id);
	}
	
	
	

}
