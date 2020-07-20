package cn.wts.gym.web.adminAction;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理用户信息的Action
 * @author 56354
 */
public class AdminUserAction extends ActionSupport implements ModelDriven<User>{
	
	//模型驱动使用的类
		private User user = new User();
		public User getModel() {
				return user;
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
		//调用Service进行查询
		//保存用户
		public String saveUser() {
			User u = adminService.findUserByUsername(user.getUsername());
			if(u==null) {
				adminService.saveUser(user);
				return "saveSuccess";
			}else {
				ServletActionContext.getRequest().getSession().setAttribute("user_msg", "该用户已存在");
				return "failSave";
			}
		}
		//根据分页查找全部用户信息
		public String findAllUser(){
			ServletActionContext.getRequest().getSession().removeAttribute("user_msg");
			//获取条件查询参数
	        Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
			PageBean<User> pageBean = adminService.findUserByPage(currentPage,condition);
			ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
			ServletActionContext.getRequest().setAttribute("condition", condition);
			return "allUser";	
		}
		//删除用户
		public String deleteUser(){
			User existUser = adminService.findUserByUser_id(user.getUser_id());
			adminService.deleteUser(existUser);
			return "delete";
		}
		//批量删除用户
		public String delSelectUser() {
			 //1、获取所有id
			String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
			System.out.println("我是ids========="+ids);
			//2、调用service删除
			adminService.delSelectUser(ids);
			return "deleteSelect";	
		}
		//根据用户id查找要修改的用户信息
		public String findUserByUser_id() {
			User updateUser = adminService.findUserByUser_id(user.getUser_id());
			ServletActionContext.getRequest().getSession().setAttribute("updateUser",updateUser);
			return "findUpdateUser";	
		}
		//修改用户
		public String updateUser() {
			adminService.updateUser(user);
			return "updateSuccess";
		}
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
