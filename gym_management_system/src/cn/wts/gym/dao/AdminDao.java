package cn.wts.gym.dao;

import cn.wts.gym.domain.Admin;

public interface AdminDao {
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin);	
}
