package cn.wts.gym.web.userAction;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.service.UserService;
/**
 * 用户浏览教练团队的Action
 * @author 56354
 */
public class UserCoachAction extends ActionSupport implements ModelDriven<Coach> {
	private Coach coach = new Coach();
	@Override
	public Coach getModel() {
		// TODO Auto-generated method stub
		return coach;
	}
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//查找全部的教练信息
	public String findAllCoach() {
		List<Coach> clist = userService.findAllCoach();
		ServletActionContext.getRequest().setAttribute("clist", clist);
		return "allCoach";
	}
	//游客登录系统时，查找全部课程的信息
	public String indexCoach() {
		List<Coach> clist = userService.findAllCoach();
		ServletActionContext.getRequest().setAttribute("coachList", clist);
		return "indexCoach";
	}
}
