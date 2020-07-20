package cn.wts.gym.web.adminAction;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.PRIVATE_MEMBER;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.Course;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理课程信息的Action
 * @author 56354
 */
public class AdminCourseAction extends ActionSupport implements ModelDriven<Course>{
	//模型驱动使用的类
	private Course course = new Course();
	@Override
	public Course getModel() {
		// TODO Auto-generated method stub
		return course;
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
	//保存课程前获取全部的教练
	public String toSaveCourse() {
		List<Coach> clist = adminService.findAllCoach();
		ServletActionContext.getRequest().setAttribute("clist", clist);
		return "toSaveCourse";
	}
	//保存课程
	public String saveCourse() throws IOException {
		Course existCourse = adminService.findCourseByCourse_no(course.getCourse_no());
		if(upload != null){
			//将课程图片上传到服务器上.
			// 获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath("/courses");
			System.out.println(path);
			//创建文件类型对象:
			File serverFile = new File(path + "//" + uploadFileName);
			//文件上传:
			FileUtils.copyFile(upload, serverFile);
			course.setCourse_image("courses/" + uploadFileName);
		}
		if(existCourse== null) {
			adminService.saveCourse(course);
			return "saveCourseSuccess";
		}else {
			ServletActionContext.getRequest().getSession().setAttribute("course_msg", "该课程号已存在");
			return "failSave";
		}		
	}
	//根据分页查找全部课程信息
	public String findAllCourse(){
		ServletActionContext.getRequest().getSession().removeAttribute("course_msg");
        Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Course> pageBean = adminService.findCourseByPage(currentPage,condition);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("condition", condition);
		return "allCourse";		
	}
	//根据课程id 删除课程
	public String deleteCourse() {
		//删除器材的图片
		String path = ServletActionContext.getServletContext().getRealPath(
					"/" + course.getCourse_image());
		File file = new File(path);
		file.delete();
		Course existCourse = adminService.findCourseByCourse_id(course.getCourse_id());
		adminService.deleteCourse(existCourse);
		return "deleteCourse";	
	}
	//批量删除课程
	public String delSelectCourse() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		//2、调用service删除
		adminService.delSelectCourse(ids);
		return "delSelectCourse";	
	}
	//根据课程id查找要修改的课程信息
	public String findCourseByCourse_id(){
		List<Coach> clist = adminService.findAllCoach();
		ServletActionContext.getRequest().setAttribute("clist", clist);
		Course updateCourse = adminService.findCourseByCourse_id(course.getCourse_id());
		ServletActionContext.getRequest().setAttribute("updateCourse",updateCourse);
		System.out.println("我是adminAction中的findCoachByCoach_id=========");
		return "findUpdateCourse";
	}
	//修改课程
	public String updateCourse() throws IOException {
		//如果要修改课程图片则先删除原先图片
		if(upload != null ){
			String delPath = ServletActionContext.getServletContext().getRealPath(
					"/" + course.getCourse_image());
			File file = new File(delPath);
			file.delete();
			//获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/equips");
			//创建文件类型对象:
			File diskFile = new File(path + "//" + uploadFileName);
			//文件上传:
			FileUtils.copyFile(upload, diskFile);
			course.setCourse_image("equips/" + uploadFileName);
		}
		adminService.updateCourse(course);
		return "updateCourse";
	}

}
