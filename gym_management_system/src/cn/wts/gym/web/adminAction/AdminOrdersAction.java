package cn.wts.gym.web.adminAction;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.Course;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理健身课程订单信息的Action
 * @author 56354
 */
public class AdminOrdersAction extends ActionSupport implements ModelDriven<Orders>{
	//模型驱动使用的类
	private Orders orders = new Orders();
	@Override
	public Orders getModel() {
		// TODO Auto-generated method stub
		return orders;
	}
	//接收currentPage参数
	private int currentPage;
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	//注入adminService
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	//添加课程订单之前获取所有的用户和课程信息
	public String toSaveOrders() {
		List<User> ulist = adminService.findAllUser();
		ServletActionContext.getRequest().setAttribute("ulist", ulist);
		List<Course> clist = adminService.findAllCourse();
		ServletActionContext.getRequest().setAttribute("clist", clist);
		return "toSaveOrders";
	}
	//添加课程订单
	public String saveOrders() {
		adminService.saveOrders(orders);
		return "saveOrdersSuccess";	
	}
	//根据分页查找全部订单
	public String findAllOrders(){
		//获取条件查询参数
        //Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Orders> pageBean = adminService.findOrdersByPage(currentPage, orders);
		List<User> ulist = adminService.findAllUser();
		ServletActionContext.getRequest().getSession().setAttribute("ulist", ulist);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("orders", orders);
		return "allOrders";		
	}
	//根据订单id删除订单
	public String deleteOrders() {
		Orders existOrders = adminService.findOrdersByOrders_id(orders.getOrders_id());
		adminService.deleteOrders(existOrders);
		return "deleteOrders";	
	}
	//根据订单id查找要修改的订单信息
	public String findOrdersByOrders_id() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<User> ulist = adminService.findAllUser();
		List<Course> clist = adminService.findAllCourse();
		request.setAttribute("ulist", ulist);
		request.setAttribute("clist", clist);
		Orders updateOrders = adminService.findOrdersByOrders_id(orders.getOrders_id());
		request.setAttribute("updateOrders",updateOrders);
		return "findUpdateOrders";	
	}
	//修改订单
	public String updateOrders() {
		adminService.updateOrders(orders);
		return "updateOrders";
	}
	//批量删除订单
	public String delSelectOrders() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		//2、调用service删除
		adminService.delSelectOrders(ids);
		return "delSelectOrders";	
	}
}
