 package cn.wts.gym.web.adminAction;

import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.wts.gym.domain.User;
import cn.wts.gym.domain.Admin;
import cn.wts.gym.domain.Reception;
import cn.wts.gym.service.AdminService;
import cn.wts.gym.service.UserService;
import cn.wts.gym.service.impl.AdminServiceImpl;
/**
 * 登录的Action
 * @author 56354
 */
public class LoginAction extends ActionSupport {
	private String username;
	private String password;
	private String role;
	//接收验证码
	private String checkCode;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}


	//设置注入
	private AdminService adminService;
	private UserService userService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String execute() throws Exception {
		String flag ="input";
		//从session中获得验证码的随机值:
		String checkCode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkCode");
		ServletActionContext.getRequest().getSession().removeAttribute("checkcode");
//		System.out.println("imgCode--"+checkCode1);
//		System.out.println("imput--"+checkCode);
		
		if(role.equals("管理员")) {
			Admin admin = new Admin();
			admin.setUsername(username);
			admin.setPassword(password);
			if(checkCode.equalsIgnoreCase(checkCode1)) {
				Admin a = adminService.login(admin);
				if(a!=null) {
					flag="admin_success";
					ServletActionContext.getRequest().getSession().setAttribute("admin", a);
				}else {
					ServletActionContext.getRequest().getSession().setAttribute("login_msg", "用户名或密码错误");
					flag="login";
				}
			}else {
				ServletActionContext.getRequest().getSession().setAttribute("login_msg", "验证码错误");
				flag="login";
			}	
		}else if(role.equals("用户")){//用户进行登录时
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			if(checkCode.equalsIgnoreCase(checkCode1)) {
				User u = userService.login(user);
				if(u!=null) {
					flag="user_success";
					ServletActionContext.getRequest().getSession().setAttribute("user", u);
				}else {
					ServletActionContext.getRequest().getSession().setAttribute("login_msg", "用户名或密码错误");
					flag="login";
				}
			}else {
				ServletActionContext.getRequest().getSession().setAttribute("login_msg", "验证码错误");
				flag="login";
			}
		}else if(role.equals("前台")) {
			Reception reception = new Reception();
			reception.setUsername(username);
			reception.setPassword(password);
			if(checkCode.equalsIgnoreCase(checkCode1)) {
				Reception r = adminService.login(reception);
				if(r!=null) {
					flag="reception_success";
					ServletActionContext.getRequest().getSession().setAttribute("admin", r);
				}else {
					ServletActionContext.getRequest().getSession().setAttribute("login_msg", "用户名或密码错误");
					flag="login";
				}
			}else {
				ServletActionContext.getRequest().getSession().setAttribute("login_msg", "验证码错误");
				flag="login";
			}	
		}
		return flag;	
		
	}
}
