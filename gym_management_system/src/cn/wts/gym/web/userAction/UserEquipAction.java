package cn.wts.gym.web.userAction;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.Equip;
import cn.wts.gym.service.UserService;
/**
 * 用户浏览健身器材的Action
 * @author 56354
 */
public class UserEquipAction extends ActionSupport implements ModelDriven<Equip>{
	private Equip equip  = new Equip();
	@Override
	public Equip getModel() {
		// TODO Auto-generated method stub
		return equip;
	}
	
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//查找全部的器材信息
	public String findAllEquip() {
		//获取条件查询参数
		List<Equip> elist = userService.findAllEquip();
		ServletActionContext.getRequest().setAttribute("elist", elist);
		return "allEquip";
	}
	//游客登录系统时，查找全部全部器材的信息
	public String indexEquip() {
		//获取条件查询参数
		List<Equip> elist = userService.findAllEquip();
		ServletActionContext.getRequest().setAttribute("equipList", elist);
		return "indexEquip";
	}
}
