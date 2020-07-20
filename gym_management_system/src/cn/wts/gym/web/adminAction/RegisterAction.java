package cn.wts.gym.web.adminAction;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.UserService;
/**
 * 用户注册的Action
 * @author 56354
 */
public class RegisterAction extends ActionSupport implements ModelDriven<User>{
 	//模型驱动使用的对象，可以接收到用户
	private User user = new User();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;	
	}
	//接收验证码
	private String checkCode;
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String getCheckCode() {
		return checkCode;
	}
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String execute()throws Exception{
		//判断验证码程序:
		//从session中获得验证码的随机值:
		String checkCode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkCode");
		ServletActionContext.getRequest().getSession().removeAttribute("checkcode");
		if(checkCode.equalsIgnoreCase(checkCode1)){
			System.out.println("验证码===="+checkCode1);
			System.out.println("输入的验证码==="+checkCode);
			User u = userService.findUserByUsername(user.getUsername());
			if(u==null) {
				userService.saveUser(user);
				return SUCCESS;
			}else {
				ServletActionContext.getRequest().getSession().setAttribute("register_msg", "该用户已存在");
				return INPUT;
			}	
		}else {
			ServletActionContext.getRequest().getSession().setAttribute("register_msg", "验证码错误");
			return INPUT;
		}
		
		
		
		
	}
	
}
