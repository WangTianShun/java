package cn.wts.gym.web.adminAction;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.wts.gym.domain.Equip;
import cn.wts.gym.domain.PageBean;
import cn.wts.gym.service.AdminService;
/**
 * 管理员管理器材信息的Action
 * @author 56354
 */
public class AdminEquipAction extends ActionSupport implements ModelDriven<Equip> {
	//模型驱动使用的类
	private Equip equip =new Equip();
	@Override
	public Equip getModel() {
		// TODO Auto-generated method stub
		return equip;
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
	//保存器材信息
	public String saveEquip() throws IOException {
		if(upload != null){
			//将器材图片上传到服务器上.
			// 获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath("/equips");
			System.out.println(path);
			//创建文件类型对象:
			File serverFile = new File(path + "//" + uploadFileName);
			//文件上传:
			FileUtils.copyFile(upload, serverFile);
			equip.setEquip_image("equips/" + uploadFileName);
		}
		System.out.println("我是saveequip"+equip);
		adminService.saveEquip(equip);
		return "saveEquip";
	}
	//根据分页查找全部器材信息
	public String findAllEquip() {
		//获取条件查询参数
        Map<String, String[]> condition = ServletActionContext.getRequest().getParameterMap();
		PageBean<Equip> pageBean = adminService.findEquipByPage(currentPage,condition);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("condition", condition);
		return "allEquip";
	}
	//根据器材id删除器材
	public String deleteEquip() {
		Equip existEquip = adminService.findEquipByEquip_id(equip.getEquip_id());
		//删除器材的图片
		String path = ServletActionContext.getServletContext().getRealPath(
						"/" + equip.getEquip_image());
				File file = new File(path);
				file.delete();
		adminService.deleteEquip(existEquip);
		return "deleteEquip";
	}
	//批量删除器材
	public String delSelectEquip() {
		 //1、获取所有id
		String[] ids = ServletActionContext.getRequest().getParameterValues("uid");
		//2、调用service删除
		adminService.delSelectEquip(ids);
		return "delSelectEquip";	
	}
	//根据器材id查找要修改的器材信息
	public String findEquipByEquip_id() {
		Equip updateEquip = adminService.findEquipByEquip_id(equip.getEquip_id());
		ServletActionContext.getRequest().getSession().setAttribute("updateEquip",updateEquip);
		return "findUpdateEquip";
	}
	//修改器材
	public String updateEquip() throws IOException {
		if(upload != null ){
			String delPath = ServletActionContext.getServletContext().getRealPath(
					"/" + equip.getEquip_image());
			System.out.println("我是getimage============="+equip.getEquip_image());
			File file = new File(delPath);
			file.delete();
			//获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/equips");
			//创建文件类型对象:
			File diskFile = new File(path + "//" + uploadFileName);
			//文件上传:
			FileUtils.copyFile(upload, diskFile);
			equip.setEquip_image("equips/" + uploadFileName);
		}
		System.out.println("我是updateequip=========="+equip);
		adminService.updateEquip(equip);
		return "updateEquip";	
	}
}
