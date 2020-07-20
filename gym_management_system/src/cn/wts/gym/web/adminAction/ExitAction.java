package cn.wts.gym.web.adminAction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 后台系统退出的Action
 * @author 56354
 */
public class ExitAction extends ActionSupport {
	public String execute() throws Exception {
		if(ActionContext.getContext().getSession()!=null){
	         ActionContext.getContext().getSession().clear();
	         return SUCCESS;
	    }
	    return INPUT;
	}
}
