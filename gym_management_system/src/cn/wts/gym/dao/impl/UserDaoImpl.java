package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.UserDao;
import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.User;
import cn.wts.gym.web.page.PageHibernateCallback;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
/**
 * 用户注册、登录模块=======================================================
 */
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		String hql = "from User where username = ? and password = ?";
		List<User> list =(List<User>) this.getHibernateTemplate().find(hql, user.getUsername(),user.getPassword());
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	//用户模块=======================================================
	@Override
	public void saveUser(User user) {
		this.getHibernateTemplate().save(user);
	}
	
	@Override
	public User findUserByUsername(String username) {
		// TODO Auto-generated method stub
		String hql = "from User where username = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, username);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public int findUserCount(Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from User where 1 = 1 ";
		/**
         * 以下此内容为复杂查询
         * */
        StringBuilder sb = new StringBuilder(hql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key)){
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");//append连接的作用
                params.add("%"+value+"%");//？条件的值
            }
        }
        System.out.println(sb.toString());
        System.out.println(params);
        hql = sb.toString();
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,params.toArray());
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		
		return 0;
	}
	
	@Override
	public List<User> findUserByPage(int start, int rows, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from User where 1 = 1 ";
		StringBuilder sb = new StringBuilder(hql);
	    //2.遍历map
	    Set<String> keySet = condition.keySet();
	    //定义参数的集合
	    List<Object> params = new ArrayList<Object>();
	       for (String key : keySet) {
	    	   //排除分页条件参数
	           if("currentPage".equals(key)){
	               continue;
	           }
	           //获取value
	           String value = condition.get(key)[0];
	           //判断value是否有值
	           if(value != null && !"".equals(value)){
	               //有值
	               sb.append(" and "+key+" like ? ");
	               params.add("%"+value+"%");//？条件的值
	            }
	        }
	        hql = sb.toString();
	        System.out.println(hql);
	        System.out.println(params);
		List<User> list = (List<User>) this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, params.toArray(), start, rows));
		return list;
	}
	public User findUserByUser_id(Integer user_id) {
		return this.getHibernateTemplate().get(User.class, user_id);
	}
	public void deleteUser(User existUser) {
		this.getHibernateTemplate().delete(existUser);
	}
	@Override
	public void updateUser(User existUser) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(existUser);
		
	}

	
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return (List<User>) this.getHibernateTemplate().find("from User");
	}
	
	
	
	

}
