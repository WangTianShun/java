package cn.wts.gym.web.adminAction;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.wts.gym.domain.Equip;
import cn.wts.gym.domain.News;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理动态信息的Action
 * @author 56354
 */
public class AdminNewsAction extends ActionSupport implements ModelDriven<News>{
	private News news = new News();
	@Override
	public News getModel() {
		// TODO Auto-generated method stub
		return news;
	}
	//接收currentPage参数
	private int currentPage;
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	//保存动态
	public String saveNews(){
		adminService.saveNews(news);
		return "saveNews";
	}
	//根据分页查找全部动态信息
	public String findAllNews() {
		PageBean<News> pageBean = adminService.findNewsByPage(currentPage, news);
	    ServletActionContext.getRequest().getSession().setAttribute("pageBean", pageBean);
	    ServletActionContext.getRequest().getSession().setAttribute("news", news);
		return "findAllNews";
		
	}
	//根据动态id删除动态
	public String deleteNews() {
		News existNews = adminService.findNewsByNews_id(news.getNews_id());
		adminService.deleteNews(existNews);
		System.out.println("我是deleteNews===============");
		return "deleteNews";
	}
	//批量删除动态
	public String delSelectNews() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		//2、调用service删除
		adminService.delSelectNews(ids);
		return "delSelectNews";	
	}
	//根据动态id查找要修改的动态信息
	public String findNewsByNews_id() {
		News updateNews = adminService.findNewsByNews_id(news.getNews_id());
		ServletActionContext.getRequest().getSession().setAttribute("updateNews",updateNews);
		System.out.println("我是findNewsByNews_id===============");
		return "findUpdateNews";
	}
	//修改动态
	public String updateNews() {
		adminService.updateNews(news);
		System.out.println("我是updateNews===============");
		return "updateNews";
	}
}
