package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.ReceptionDao;
import cn.wts.gym.domain.Reception;
import cn.wts.gym.web.page.PageHibernateCallback;

public class ReceptionDaoImpl extends HibernateDaoSupport implements ReceptionDao{

	@Override
	public Reception login(Reception reception) {
		// TODO Auto-generated method stub
		String hql = "from Reception where username = ? and password = ?";
		List<Reception> list =(List<Reception>) this.getHibernateTemplate().find(hql, reception.getUsername(),reception.getPassword());
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void saveReception(Reception reception) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(reception);
	}

	@Override
	public Reception findReceptionByUsername(String username) {
		// TODO Auto-generated method stub
		String hql = "from Reception where username = ?";
		List<Reception> list = (List<Reception>) this.getHibernateTemplate().find(hql, username);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public int findReceptionCount(Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from Reception where 1 = 1 ";
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
	public List<Reception> findReceptionByPage(int start, int rows, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from Reception where 1 = 1 ";
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
		List<Reception> list = (List<Reception>) this.getHibernateTemplate().execute(new PageHibernateCallback<Reception>(hql, params.toArray(), start, rows));
		return list;
	}

	@Override
	public Reception findReceptionByReception_id(Integer reception_id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Reception.class, reception_id);
	}

	@Override
	public void deleteReception(Reception existReception) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(existReception);
	}

	@Override
	public void updateReception(Reception existReception) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(existReception);
	}

}
