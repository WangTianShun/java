package cn.wts.gym.web.userAction;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.wts.gym.domain.Course;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.UserService;
/**
 * 用户浏览健身课程的Action
 * @author 56354
 */
public class UserCourseAction extends ActionSupport {
	//接收course_id参数
	private int course_id;
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	//接收currentPage参数
	private int currentPage;
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	//注入userService
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//根据分页查找全部健身课程
	public String findAllCourse(){
		//获取条件查询参数
        Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Course> pageBean = userService.findCourseByPage(currentPage,condition);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("condition", condition);
		return "allCourse";		
	}
	//根据课程id查找要订购的课程信息
	public String findCourseByCourse_id() {
		int orders_count = userService.findOrdersCountByCourse_id(course_id);
		Course reserveCourse = userService.findCourseByCourse_id(course_id);
		int course_count = reserveCourse.getCourse_count();
		if(course_count>orders_count) {
			ServletActionContext.getRequest().getSession().setAttribute("reserveCourse", reserveCourse);
			return "prepareReserve";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("failCourse_id", course_id);
			ServletActionContext.getRequest().getSession().setAttribute("reserveFail", "该课程已预订完");
			return "reserveFail";
		}		
	}
	//该课程生成订单的操作
	public String makeOrders(){
		Course orderCourse = (Course) ServletActionContext.getRequest().getSession().getAttribute("reserveCourse");
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
			Orders orders = new Orders();
			orders.setCourse(orderCourse);
			orders.setUser(user);
			orders.setOrders_money(orderCourse.getCourse_cost());
			orders.setOrders_state("预订");
			orders.setOrders_time(new Date());	
			userService.saveOrders(orders);
			return "reserveSuccess";	
	}
	//查找全部健身课程订单，在健身课程页面中订购成功则跳转到我的订单页面
	public String findAllOrders() {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		System.out.println("我是用户订单========="+user.getUser_id());
		List<Orders> olist = userService.findOrdersByUser_id(user.getUser_id());
		System.out.println("我是==========olist"+olist);
		ServletActionContext.getRequest().getSession().setAttribute("olist",olist );
		return "allOrders";
	}
}
