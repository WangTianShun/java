package cn.wts.gym.web.adminAction;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理教练信息的Action
 * @author 56354
 */
public class AdminCoachAction extends ActionSupport implements ModelDriven<Coach>{
	//模型驱动使用的类
	private Coach coach = new Coach();
	@Override
	public Coach getModel() {
		// TODO Auto-generated method stub
		return coach;
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
	/**
	 * 文件上传需要的三个属性
	 * 需要上传文件（流）
	 * 需要上传文件名称
	 * （1）在action里面成员变量位置定义变量（命名规范）
	 * - 一个表示上传文件
	 * - 一个表示文件名称
	 * （2）生成get和set方法
	 * 
	 * 还有一个变量，上传文件的mine类型
	 */
	//上传文件
	//变量的名称需要是表单里面上传文件项的name的值
	private File upload;
	//上传文件名称，表单里面文件上传项的name值FileName
	private String uploadFileName;
	//生成get和set方法
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	//调用Service进行查询
	//保存教练
	public String saveCoach() throws IOException {
		if(upload != null){
			//将器材图片上传到服务器上.
			// 获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath("/coachs");
			System.out.println(path);
			//创建文件类型对象:
			File serverFile = new File(path + "//" + uploadFileName);
			//文件上传:
			FileUtils.copyFile(upload, serverFile);
			coach.setCoach_image("coachs/" + uploadFileName);
		}
		Coach existCoach = adminService.findCoachByCoach_no(coach.getCoach_no());
		if(existCoach == null) {
			adminService.saveCoach(coach);
			return "saveCoach";
		}else {
			ServletActionContext.getRequest().getSession().setAttribute("coach_msg", "该教练号已存在");
			return "failSave";
		}
		
	}
	//根据分页查找全部教练
	public String findAllCoach() {
		ServletActionContext.getRequest().getSession().removeAttribute("coach_msg");
		//获取条件查询参数
        Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Coach> pageBean = adminService.findCoachByPage(currentPage,condition);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("condition", condition);
		System.out.println("我是adminAction中的findAllCoach=========");
		return "allCoach";
	}
	//根据教练id 删除教练
	public String deleteCoach() {
		//删除器材的图片
		String path = ServletActionContext.getServletContext().getRealPath(
				"/" + coach.getCoach_image());
		File file = new File(path);
		file.delete();
		Coach existCoach = adminService.findCoachByCoach_id(coach.getCoach_id());
		adminService.deleteCoach(existCoach);
		return "deleteCoach";
		
	}
	//根据教练id查找要修改的教练信息
	public String findCoachByCoach_id() {
		Coach updateCoach = adminService.findCoachByCoach_id(coach.getCoach_id());
		ServletActionContext.getRequest().getSession().setAttribute("updateCoach",updateCoach);
		return "findUpdateCoach";
		
	}
	//修改教练
	public String updateCoach() throws IOException {
		if(upload != null ){
			String delPath = ServletActionContext.getServletContext().getRealPath(
					"/" + coach.getCoach_image());
			System.out.println("我是教练image============="+coach.getCoach_image());
			File file = new File(delPath);
			file.delete();
			//获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/coachs");
			//创建文件类型对象:
			File diskFile = new File(path + "//" + uploadFileName);
			//文件上传:
			FileUtils.copyFile(upload, diskFile);
			coach.setCoach_image("coachs/" + uploadFileName);
		}
		adminService.updateCoach(coach);
		return "updateCoach";	
	}
	//批量删除教练
	public String delSelectCoach() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		//2、调用service删除
		adminService.delSelectCoach(ids);
		return "delSelectCoach";	
	}
}
