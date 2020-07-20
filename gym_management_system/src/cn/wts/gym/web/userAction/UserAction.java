package cn.wts.gym.web.userAction;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.wts.gym.domain.User;
import cn.wts.gym.service.UserService;
/**
 * 用户修改个人信息的Action
 * @author 56354
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
	private User user = new User();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//用户修改个人信息
	public String execute()throws Exception {
		userService.updateUser(user);
		return "updateSuccess";
	}
}
