package cn.wts.gym.web.userAction;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.wts.gym.domain.News;
import cn.wts.gym.service.UserService;
/**
 * 用户浏览健身动态的Action
 * @author 56354
 */
public class UserNewsAction extends ActionSupport{
private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//查找全部的健身动态
	public String findAllNews() {
		//获取条件查询参数
		List<News> nlist = userService.findAllNews();
		ServletActionContext.getRequest().setAttribute("nlist", nlist);
		return "allNews";
	}
	//游客登录系统时，查找全部的健身动态
	public String indexNews() {
		//获取条件查询参数
		List<News> nlist = userService.findAllNews();
		ServletActionContext.getRequest().setAttribute("newsList", nlist);
		return "indexNews";
	}
}
