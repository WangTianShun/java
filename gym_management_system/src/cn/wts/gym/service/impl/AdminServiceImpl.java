package cn.wts.gym.service.impl;

import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import cn.wts.gym.dao.AdminDao;
import cn.wts.gym.dao.CardDao;
import cn.wts.gym.dao.CoachDao;
import cn.wts.gym.dao.CourseDao;
import cn.wts.gym.dao.EquipDao;
import cn.wts.gym.dao.NewsDao;
import cn.wts.gym.dao.OrdersDao;
import cn.wts.gym.dao.ReceptionDao;
import cn.wts.gym.dao.UserDao;
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
import cn.wts.gym.service.AdminService;

@Transactional
public class AdminServiceImpl implements AdminService{
	//依赖注入
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	private CardDao cardDao;
	public void setCardDao(CardDao cardDao) {
		this.cardDao = cardDao;
	}

	private CoachDao coachDao;
	public void setCoachDao(CoachDao coachDao) {
		this.coachDao = coachDao;
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
	
	private NewsDao newsDao;
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
	private ReceptionDao receptionDao;
	public void setReceptionDao(ReceptionDao receptionDao) {
		this.receptionDao = receptionDao;
	}
	//登录
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
		
	}
	
	/**
	 * 模块1：用户管理==========================================================================
	 */
	
	@Override
	public PageBean<User> findUserByPage(int currentPage, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1 
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<User> pageBean = new PageBean<User>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = userDao.findUserCount(condition);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<User> list = userDao.findUserByPage(start,rows, condition);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}
	
	public User findUserByUser_id(Integer user_id) {
		return userDao.findUserByUser_id(user_id);
	}
	
	public void deleteUser(User existUser) {
		userDao.deleteUser(existUser);
	}
	
	public void delSelectUser(String[] uids) {
        if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	User user = userDao.findUserByUser_id(Integer.parseInt(id));
            	//2.调用dao删除
                userDao.deleteUser(user);
            }     
        }
    }
	
	@Override
	public void updateUser(User existUser) {
		// TODO Auto-generated method stub
		userDao.updateUser(existUser);
	}
	
	@Override
	public User findUserByUsername(String username) {
		// TODO Auto-generated method stub	
		return userDao.findUserByUsername(username);
	}
	
	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		userDao.saveUser(user);
	}
	
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return userDao.findAllUser();
	}
	/**
	 * 模块2：会员卡管理==========================================================================
	 */
	@Override
	public Card findCardByCard_no(String card_no) {
		// TODO Auto-generated method stub
		return cardDao.findCardByCard_no(card_no);
	}
	
	@Override
	public Card findCardByUser_id(Integer user_id) {
		// TODO Auto-generated method stub
		return cardDao.findCardByUser_id(user_id);
	}
	
	@Override
	public void saveCard(Card card) {
		// TODO Auto-generated method stub
		System.out.println("我是adminCardService============");
		cardDao.saveCard(card);
	}
	
	@Override
	public PageBean<Card> findCardByPage(int currentPage,Card card) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<Card> pageBean = new PageBean<Card>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = cardDao.findCardCount(card);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<Card> list = cardDao.findCardByPage(start,rows,card);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		System.out.println("我是adminService中的findCardByPage=========");
		return pageBean;
	}
	
	@Override
	public Card findCardByCard_id(Integer card_id) {
		// TODO Auto-generated method stub
		return cardDao.findCardByCard_id(card_id);
	}
	
	@Override
	public void deleteCard(Card card) {
		// TODO Auto-generated method stub
		cardDao.deleteCard(card);	
	}
	
	@Override
	public void delSelectCard(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	Card card = cardDao.findCardByCard_id(Integer.parseInt(id));
            	//2.调用dao删除
            	cardDao.deleteCard(card);
            }     
        }
	}
	
	@Override
	public void updateCard(Card existCard) {
		// TODO Auto-generated method stub
		cardDao.updateCard(existCard);
	}
	
	
	/**
	 * 模块3：教练管理==========================================================================
	 */
	
	
	@Override
	public void saveCoach(Coach coach) {
		// TODO Auto-generated method stub
		coachDao.saveCoach(coach);	
	}
	
	@Override
	public PageBean<Coach> findCoachByPage(int currentPage, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1 
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<Coach> pageBean = new PageBean<Coach>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = coachDao.findCoachCount(condition);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<Coach> list = coachDao.findCoachByPage(start, rows, condition);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}
	@Override
	public Coach findCoachByCoach_id(Integer coach_id) {
		// TODO Auto-generated method stub
		return coachDao.findCoachByCoach_id(coach_id);
	}
	@Override
	public void deleteCoach(Coach coach) {
		// TODO Auto-generated method stub
		coachDao.deleteCoach(coach);
	}
	@Override
	public void delSelectCoach(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	Coach coach = coachDao.findCoachByCoach_id(Integer.parseInt(id));
            	//2.调用dao删除
                coachDao.deleteCoach(coach);
            }     
        }
	}
	@Override
	public void updateCoach(Coach coach) {
		// TODO Auto-generated method stub
		coachDao.updateCoach(coach);
	}
	
	@Override
	public List<Coach> findAllCoach() {
		// TODO Auto-generated method stub
		return (List<Coach>) coachDao.findAllCoach();
	}
	
	@Override
	public Coach findCoachByCoach_no(String coach_no) {
		// TODO Auto-generated method stub
		return coachDao.findCoachByCoach_no(coach_no);
	}
	/**
	 * 模块4：健身器材管理==========================================================================
	 */	
	
	@Override
	public void saveEquip(Equip equip) {
		// TODO Auto-generated method stub
		equipDao.saveEquip(equip);
	}
	@Override
	public PageBean<Equip> findEquipByPage(int currentPage, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1 
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<Equip> pageBean = new PageBean<Equip>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = equipDao.findEquipCount(condition);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<Equip> list = equipDao.findEquipByPage(start, rows, condition);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}
	@Override
	public Equip findEquipByEquip_id(Integer equip_id) {
		// TODO Auto-generated method stub
		return equipDao.findEquipByEquip_id(equip_id);
	}
	@Override
	public void deleteEquip(Equip equip) {
		// TODO Auto-generated method stub
		equipDao.deleteEquip(equip);
	}
	@Override
	public void delSelectEquip(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	Equip equip = equipDao.findEquipByEquip_id(Integer.parseInt(id));
            	//2.调用dao删除
                equipDao.deleteEquip(equip);
            }     
        }
	}
	@Override
	public void updateEquip(Equip equip) {
		// TODO Auto-generated method stub
		equipDao.updateEquip(equip);
	}

	/**
	 * 模块5：课程管理==========================================================================
	 */
	@Override
	public Course findCourseByCourse_no(String course_no) {
		// TODO Auto-generated method stub
		return courseDao.findCourseByCourse_no(course_no);
	}

	@Override
	public Coach findCoachByCoach_name(String coach_name) {
		// TODO Auto-generated method stub
		return coachDao.findCoachByCoach_name(coach_name);
	}
	
	@Override
	public void saveCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.saveCourse(course);
	}

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
		System.out.println("我是adminService中的findCourseByPage=========");
		return pageBean;
	}

	@Override
	public Course findCourseByCourse_id(Integer course_id) {
		// TODO Auto-generated method stub
		return courseDao.findCourseByCourse_id(course_id);
	}

	@Override
	public void deleteCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.deleteCourse(course);
	}

	@Override
	public void delSelectCourse(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	Course course = courseDao.findCourseByCourse_id(Integer.parseInt(id));
            	//2.调用dao删除
            	courseDao.deleteCourse(course);
            }     
        }
	}
	
	@Override
	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.updateCourse(course);
	}
	
	@Override
	public List<Course> findAllCourse() {
		// TODO Auto-generated method stub
		return courseDao.findAllCourse();
	}

	/**
	 * 模块6：订单管理==========================================================================
	 */

	@Override
	public void saveOrders(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.saveOrders(orders);
	}

	@Override
	public PageBean<Orders> findOrdersByPage(int currentPage, Orders orders) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<Orders> pageBean = new PageBean<Orders>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = ordersDao.findOrdersCount(orders);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<Orders> list = ordersDao.findOrdersByPage(start, rows, orders);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		System.out.println("我是adminService中的findOrdersByPage=========");
		return pageBean;
	}

	@Override
	public Orders findOrdersByOrders_id(Integer orders_id) {
		// TODO Auto-generated method stub
		return ordersDao.findOrdersByOrders_id(orders_id);
	}

	@Override
	public void deleteOrders(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.deleteOrders(orders);
	}

	@Override
	public void delSelectOrders(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	Orders orders = ordersDao.findOrdersByOrders_id(Integer.parseInt(id));
            	//2.调用dao删除
            	ordersDao.deleteOrders(orders);
            }     
        }
	}

	@Override
	public void updateOrders(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.updateOrders(orders);
	}
	/**
	 * 模块7：新闻管理==========================================================================
	 */
	@Override
	public void saveNews(News news) {
		// TODO Auto-generated method stub
		newsDao.saveNews(news);
	}

	@Override
	public void deleteNews(News news) {
		// TODO Auto-generated method stub
		newsDao.deleteNews(news);
	}
	@Override
	public void delSelectNews(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	News news = newsDao.findNewsByNews_id(Integer.parseInt(id));
            	//2.调用dao删除
            	newsDao.deleteNews(news);
            }     
        }
	}
	@Override
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		newsDao.updateNews(news);
	}

	@Override
	public List<News> findAllNews() {
		// TODO Auto-generated method stub
		List<News> list = newsDao.findAllNews();
		return list;
	}

	@Override
	public News findNewsByNews_id(Integer news_id) {
		// TODO Auto-generated method stub
		return newsDao.findNewsByNews_id(news_id); 
	}
	@Override
	public PageBean<News> findNewsByPage(int currentPage,News news) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<News> pageBean = new PageBean<News>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 2;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = newsDao.findNewsCount(news);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<News> list = newsDao.findNewsByPage(start, rows, news);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		return  pageBean;
	}

	/**
	 * 模块8：前台管理==========================================================================
	 */
	@Override
	public Reception login(Reception reception) {
		// TODO Auto-generated method stub
		return receptionDao.login(reception);
	}

	@Override
	public void saveReception(Reception reception) {
		// TODO Auto-generated method stub
		receptionDao.saveReception(reception);
	}
	@Override
	public PageBean<Reception> findReceptionByPage(int currentPage, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		// 对于点击《 如果currentPage小于0,则让他始终为1
        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean
		PageBean<Reception> pageBean = new PageBean<Reception>();
		//2.设置参数
		//设置当前页数
		pageBean.setCurrentPage(currentPage);
		//设置每页显示记录数:
		int rows = 10;
		pageBean.setRows(rows);
		//3.调用dao查询总记录数
		int totalCount = 0;
		totalCount = receptionDao.findReceptionCount(condition);
		pageBean.setTotalCount(totalCount);
		//4.调用dao查询List集合
        //计算开始的记录索引
		int start = (currentPage - 1) * rows;
		List<Reception> list = receptionDao.findReceptionByPage(start, rows, condition);
		pageBean.setList(list);
		//5.计算总页码
		int totalPage = 0;
		totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	@Override
	public Reception findReceptionByReception_id(Integer reception_id) {
		// TODO Auto-generated method stub
		return receptionDao.findReceptionByReception_id(reception_id);
	}

	@Override
	public void deleteReception(Reception existReception) {
		// TODO Auto-generated method stub
		receptionDao.deleteReception(existReception);
	}

	@Override
	public void delSelectReception(String[] uids) {
		// TODO Auto-generated method stub
		if(uids != null && uids.length > 0){
            //1.遍历数组
            for (String id : uids) {
            	Reception reception = receptionDao.findReceptionByReception_id(Integer.parseInt(id));
            	//2.调用dao删除
            	receptionDao.deleteReception(reception);
            }     
        }
	}

	@Override
	public void updateReception(Reception existReception) {
		// TODO Auto-generated method stub
		receptionDao.updateReception(existReception);
	}

	@Override
	public Reception findReceptionByUsername(String username) {
		// TODO Auto-generated method stub
		return receptionDao.findReceptionByUsername(username);
	}

	
	
	



	
	

	
	

	


	
	
	
	
}
