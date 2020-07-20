package cn.wts.gym.web.userAction;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.UserService;
/**
 * 用户查看我的会员卡的Action
 * @author 56354
 */
public class UserCardAction extends ActionSupport {

	//注入userService
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String execute() throws Exception {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		System.out.println("我是user============="+user.getUser_id());
		Card card = userService.findCardByUser_id(user.getUser_id());
			ServletActionContext.getRequest().getSession().setAttribute("card", card);		
			return "allCard";	
	}
}
