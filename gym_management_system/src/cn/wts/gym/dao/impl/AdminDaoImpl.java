package cn.wts.gym.dao.impl;

import java.util.List;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.AdminDao;
import cn.wts.gym.domain.Admin;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		String hql = "from Admin where username = ? and password = ?";
		List<Admin> list =  (List<Admin>) this.getHibernateTemplate().find(hql, admin.getUsername(),admin.getPassword());
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	
	

	



}
