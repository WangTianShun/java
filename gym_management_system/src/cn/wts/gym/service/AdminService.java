package cn.wts.gym.service;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.Admin;
import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.Course;
import cn.wts.gym.domain.Equip;
import cn.wts.gym.domain.News;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.Reception;
import cn.wts.gym.domain.User;


public interface AdminService {
	/**
	 * 管理员登录  
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin);
	
	//模块1：用户管理==========================================================================

	/**
	 * 根据条件分页查询用户
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<User> findUserByPage(int currentPage, Map<String, String[]> condition);
	/**
	 * 通过user_id得到user对象
	 * @param user_id
	 * @return
	 */
	public User findUserByUser_id(Integer user_id);
	/**
	 * 删除用户
	 * @param existUser
	 */
	public void deleteUser(User existUser);
	/**
	 * 批量删除
	 * @param uids
	 */
	public void delSelectUser(String[] uids);
	/**
	 * 修改用户
	 * @param existUser
	 */
	public void updateUser(User existUser);
	/**
	 * 查找用户
	 * @param username
	 * @return
	 */
	public User findUserByUsername(String username);
	/**
	 * 添加用户
	 * @param user
	 */
	public void saveUser(User user);
	/**
	 * 查看所有用户不带分页的
	 * @return
	 */
	public List<User> findAllUser();
	//模块2：会员管理==========================================================================
	/**
	 * 通过card_id得到card对象
	 * @param card_no
	 * @return
	 */
	public Card findCardByCard_no(String card_no);
	/**
	 * 通过user_id得到user对象
	 * @param user_id
	 * @return
	 */
	public Card findCardByUser_id(Integer user_id);
	/**
	 * 添加会员卡
	 * @param card
	 */
	public void saveCard(Card card);
	/**
	 * 根据分页条件查询用户
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<Card> findCardByPage(int currentPage,Card card);
	/**
	 * 通过card_id得到card对象
	 * @param card_id
	 * @return
	 */
	public Card findCardByCard_id(Integer card_id);
	/**
	 * 删除会员卡
	 * @param card
	 */
	public void deleteCard(Card card);
	/**
	 * 修改会员卡
	 * @param existCard
	 */
	public void updateCard(Card existCard);
	/**
	 * 批量删除
	 * @param uids
	 */
	public void delSelectCard(String[] uids);
	
	// 模块3：教练管理==========================================================================
	 /**
	  * 添加教练
	  * @param coach
	  */
	public void saveCoach(Coach coach);
	/**
	 * 根据条件分页查询用户
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<Coach> findCoachByPage(int currentPage, Map<String, String[]> condition);
	/**
	 * 根据coach_id查找教练
	 * @param coach_id
	 */
	public Coach findCoachByCoach_id(Integer coach_id);
	/**
	 * 删除教练
	 * @param coach
	 */
	public void deleteCoach(Coach coach);
	/**
	 * 批量删除
	 * @param uids
	 */
	public void delSelectCoach(String[] uids);
	/**
	 * 修改教练
	 * @param coach
	 */
	
	public void updateCoach(Coach coach);
	/**
	 * 根据教练名查找教练并找到coach_id传给save
	 * @param coach_name
	 * @return
	 */
	public Coach findCoachByCoach_name(String coach_name);
	/**
	 * 根据教练号查找教练
	 * @param coach_no
	 * @return 
	 */
	public Coach findCoachByCoach_no(String coach_no);
	
	// 模块4：健身器材管理==========================================================================
	/**
	 * 保存健身器材
	 * @param equip
	 */
	public void saveEquip(Equip equip);
	/**
	 * 根据条件分页查询健身器材
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<Equip> findEquipByPage(int currentPage, Map<String, String[]> condition);
	/**
	 * 根据equip_id查询健身器材
	 * @param equip_id
	 * @return
	 */
	public Equip findEquipByEquip_id(Integer equip_id);
	/**
	 * 删除健身器材
	 * @param equip
	 */
	public void deleteEquip(Equip equip);
	/**
	 * 批量删除健身器材
	 * @param uids
	 */
	public void delSelectEquip(String[] uids);
	/**
	 * 修改健身器材
	 * @param equip
	 */
	public void updateEquip(Equip equip);
	/**
	 * 查看所有教练不带分页的
	 * @return
	 */
	public List<Coach> findAllCoach();
	
	// 模块5：课程管理==========================================================================
	
	
	/**
	 * 添加课程
	 * @param course
	 */
	public void saveCourse(Course course);
	/**
	 * 根据条件分页查询课程
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<Course> findCourseByPage(int currentPage, Map<String, String[]> condition);
	/**
	 * 根据course_id查找课程
	 * @param course_id
	 * @return
	 */
	public Course findCourseByCourse_id(Integer course_id);
	/**
	 * 根据course_no查找课程
	 * @param course_no
	 * @return
	 */
	public Course findCourseByCourse_no(String course_no);
	/**
	 * 删除课程
	 * @param course
	 */
	public void deleteCourse(Course course);
	/**
	 * 批量删除课程
	 * @param uids
	 */
	public void delSelectCourse(String[] uids);
	/**
	 * 修改课程
	 * @param course
	 */
	public void updateCourse(Course course);
	/**
	 * 查询全部课程
	 * @return
	 */
	public List<Course> findAllCourse();
	
	// 模块6：订单管理==========================================================================
	/**
	 * 保存订单
	 * @param orders
	 */
	public void saveOrders(Orders orders);
	/**
	 * 根据条件分页查询
	 * @param currentPage
	 * @param orders
	 * @return
	 */
	public PageBean<Orders> findOrdersByPage(int currentPage, Orders orders);
	/**
	 * 根据orders_id查询订单
	 * @param orders_id
	 * @return
	 */
	public Orders findOrdersByOrders_id(Integer orders_id);
	/**
	 * 删除订单
	 * @param orders
	 */
	public void deleteOrders(Orders orders);
	/**
	 * 批量删除订单
	 * @param uids
	 */
	public void delSelectOrders(String[] uids);
	/**
	 * 修改订单
	 * @param orders
	 */
	public void updateOrders(Orders orders);
	// 模块7：新闻管理==========================================================================
	/**
	 * 保存新闻
	 * @param news
	 */
	public void saveNews(News news);
	/**
	 * 根据条件分页查询
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<News> findNewsByPage(int currentPage,News news);
	/**
	 * 删除新闻
	 * @param news
	 */
	public void deleteNews(News news);
	/**
	 * 批量删除
	 * @param uids
	 */
	public void delSelectNews(String[] uids);
	/**
	 * 修改新闻
	 * @param news
	 */
	public void updateNews(News news);
	
	/**
	 * 查询全部新闻
	 */
	public List<News> findAllNews();
	/**
	 * 根据news_id查询新闻
	 * @param news_id
	 * @return
	 */
	public News findNewsByNews_id(Integer news_id);
	// 模块8：前台管理========================================================================
	/**
	 * 前台登录
	 * @param reception
	 * @return
	 */
	public Reception login(Reception reception);
	/**
	 * 根据条件分页查询用户
	 * @param currentPage
	 * @param condition
	 * @return
	 */
	public PageBean<Reception> findReceptionByPage(int currentPage, Map<String, String[]> condition);
	/**
	 * 通过reception_id得到reception对象
	 * @param reception_id
	 * @return
	 */
	public Reception findReceptionByReception_id(Integer reception_id);
	/**
	 * 删除用户
	 * @param existReception
	 */
	public void deleteReception(Reception existReception);
	/**
	 * 批量删除
	 * @param uids
	 */
	public void delSelectReception(String[] uids);
	/**
	 * 修改用户
	 * @param existUser
	 */
	public void updateReception(Reception existReception);
	/**
	 * 查找用户
	 * @param username
	 * @return
	 */
	public Reception findReceptionByUsername(String username);
	/**
	 * 添加用户
	 * @param user
	 */
	public void saveReception(Reception reception);
	/**
	 * 多条件查询
	 * @return 
	 */
	

}
