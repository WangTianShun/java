package cn.wts.gym.web.adminAction;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理会员卡信息的Action
 * @author 56354
 */
public class AdminCardAction extends ActionSupport implements ModelDriven<Card>{
	//模型驱动使用的类
	private Card card = new Card();
	@Override
	public Card getModel() {
		// TODO Auto-generated method stub
		return card;
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
	//保存会员卡前获取全部用户信息
	public String toSaveCard() {
		List<User> ulist = adminService.findAllUser();
		ServletActionContext.getRequest().setAttribute("ulist", ulist);
		return "toSaveCard";
	}
	//保存会员卡信息
	public String saveCard() {
		System.out.println("我是adminActionCard============");
		System.out.println("我添加的card"+card);
		Card existCard1 = adminService.findCardByCard_no(card.getCard_no());
		Card existCard2 = adminService.findCardByUser_id(card.getUser().getUser_id());
		System.out.println("我是existCard2的user_id========"+card.getUser().getUser_id());
		if(existCard1==null && existCard2==null ) {
			adminService.saveCard(card);
			return "saveCardSuccess";	
		}else {
			ServletActionContext.getRequest().getSession().setAttribute("card_msg", "该用户已注册会员卡或卡号已存在");
			return "failSave";
		}
	}
	//根据分页查找全部的会员卡信息
	public String findAllCard(){
		ServletActionContext.getRequest().getSession().removeAttribute("card_msg");
		//获取条件查询参数
       // Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Card> pageBean = adminService.findCardByPage(currentPage,card);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("card", card);
		System.out.println("我是adminAction中的findAllCard=========");
		return "allCard";		
	}
	//删除会员卡
	public String deleteCard() {
		Card existCard = adminService.findCardByCard_id(card.getCard_id());
		adminService.deleteCard(existCard);
		return "deleteCard";	
	}
	//根据会员卡号查找要修改的会员卡信息
	public String findCardByCard_id() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<User> ulist = adminService.findAllUser();
		request.setAttribute("ulist", ulist);
		Card updateCard = adminService.findCardByCard_id(card.getCard_id());
		request.setAttribute("updateCard",updateCard);
//		System.out.println("我是adminAction中的findCardByUser_id=========");
		return "findUpdateCard";	
	}
	//修改会员卡
	public String updateCard() {
		adminService.updateCard(card);
//		System.out.println("我是adminAction中的updateCard========="+card);
		return "updateCard";
	}
	//批量删除会员卡
	public String delSelectCard() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		System.out.println("我是ids========="+ids);
		//2、调用service删除
		adminService.delSelectCard(ids);
		return "delSelectCard";	
	}
}
