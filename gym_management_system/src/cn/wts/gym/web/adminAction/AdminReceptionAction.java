package cn.wts.gym.web.adminAction;

import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.Reception;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理前台信息的Action
 * @author 56354
 */
public class AdminReceptionAction extends ActionSupport implements ModelDriven<Reception> {
	private Reception reception = new Reception();
	@Override
	public Reception getModel() {
		// TODO Auto-generated method stub
		return reception;
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
	//保存前台信息
	public String saveReception() {
		System.out.println("我是saveReception========="+reception);
		Reception r = adminService.findReceptionByUsername(reception.getUsername());
		if(r==null) {
			adminService.saveReception(reception);
			return "saveSuccess";
		}else {
			ServletActionContext.getRequest().getSession().setAttribute("reception_msg", "该用户已存在");
			return "failSave";
		}
	}
	//根据分页查找全部前台信息
	public String findAllReception(){
		System.out.println("我是findAllReception==================");
		ServletActionContext.getRequest().getSession().removeAttribute("reception_msg");
		//获取条件查询参数
        Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Reception> pageBean = adminService.findReceptionByPage(currentPage, condition);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("condition", condition);
		return "findAllReception";
	}
	//根据前台id删除前台信息
	public String deleteReception(){
		Reception existReception = adminService.findReceptionByReception_id(reception.getReception_id());
		adminService.deleteReception(existReception);
		return "deleteReception";
	}
	//批量删除前台信息
	public String delSelectReception() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		System.out.println("我是ids========="+ids);
		//2、调用service删除
		adminService.delSelectReception(ids);
		return "delSelectReception";	
	}
	//根据前台id查找要修改的前台信息
	public String findReceptionByReception_id() {
		Reception updateReception = adminService.findReceptionByReception_id(reception.getReception_id());
		ServletActionContext.getRequest().getSession().setAttribute("updateReception",updateReception);
		return "findUpdateReception";
	}
	//修改前台
	public String updateReception() {
		adminService.updateReception(reception);
		return "updateSuccess";
	}
	public String toPassword() {
		Reception rr = (Reception) ServletActionContext.getRequest().getSession().getAttribute("admin");
		System.out.println("前台登录之后的的前台信息"+rr);
		Reception passwordReception = adminService.findReceptionByReception_id(rr.getReception_id());
		System.out.println("返回给修改密码页面的前台信息"+passwordReception);
		ServletActionContext.getRequest().getSession().setAttribute("passwordReception",passwordReception);
		return "toAlterReception";
	}
	//前台修改密码
	public String alterReception() {
		String pwd = reception.getPassword();
		System.out.println("修改之后的密码"+pwd);
		Reception pwdReception = adminService.findReceptionByReception_id(reception.getReception_id());
		pwdReception.setPassword(pwd);
		System.out.println("修改之后的前台信息"+pwdReception);
		adminService.updateReception(pwdReception);
		return "alterSuccess";
	}
}
