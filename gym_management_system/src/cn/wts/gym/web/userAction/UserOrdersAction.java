package cn.wts.gym.web.userAction;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.domain.User;
import cn.wts.gym.service.UserService;
/**
 * 用户操作我的订单的Action
 * @author 56354
 *
 */
public class UserOrdersAction extends ActionSupport{
	//接收orders_id参数
	private int orders_id;
	//JSON操作
	private String data;
		
	@JSON(serialize=false)  
	public int getOrders_id() {
		return orders_id;
	}

	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}
	
	public String getData() {
		return data;
	}
	//注入userService
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//查找全部的用户订单
	public String findAllOrders() {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		System.out.println("我是用户订单========="+user.getUser_id());
		List<Orders> olist = userService.findOrdersByUser_id(user.getUser_id());
		System.out.println("我是==========olist"+olist);
		ServletActionContext.getRequest().getSession().setAttribute("olist",olist );
		return "allOrders";
	}
	//根据订单id删除订单
	public String deleteOrders() {
		Orders existOrders = userService.FindOrdersByOrders_id(orders_id);
		userService.deleteOrders(existOrders);
		return "deleteOrders";
	}
	//进行付款操作
	public String payMoney() {
		Orders updateOrders = userService.FindOrdersByOrders_id(orders_id);
		if(updateOrders.getOrders_state().equals("已付款")) {
			 data=null;
			return "finishPay";
		}else {
			updateOrders.setOrders_state("已付款");
			userService.updateOrders(updateOrders);
			//返回ajax操作
	        data="1";
			return "finishPay";
		}
	}
}
