package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.CoachDao;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.web.page.PageHibernateCallback;

public class CoachDaoImpl extends HibernateDaoSupport implements CoachDao {

	@Override
	public void saveCoach(Coach coach) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(coach);
	}
	
	@Override
	public int findCoachCount(Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from Coach where 1 = 1 ";
		// 以下此内容为复杂查询
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
	public List<Coach> findCoachByPage(int start, int rows, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from Coach where 1 = 1 ";
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
		List<Coach> list = (List<Coach>) this.getHibernateTemplate().execute(new PageHibernateCallback<Coach>(hql, params.toArray(), start, rows));
		return list;
	}

	@Override
	public void deleteCoach(Coach coach) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(coach);
	}

	@Override
	public Coach findCoachByCoach_id(Integer coach_id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Coach.class, coach_id);
	}

	@Override
	public void updateCoach(Coach coach) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(coach);
	}

	@Override
	public Coach findCoachByCoach_name(String coach_name) {
		// TODO Auto-generated method stub
		String hql = "from Coach where coach_name = ?";
		List<Coach> list = (List<Coach>) this.getHibernateTemplate().find(hql, coach_name);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	//一对多用到
	public List<Coach> findAllCoach() {
		String hql = "from Coach";
		List<Coach> list = (List<Coach>) this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public Coach findCoachByCoach_no(String coach_no) {
		// TODO Auto-generated method stub
		String hql = "from Coach where coach_no = ?";
		List<Coach> list = (List<Coach>) this.getHibernateTemplate().find(hql, coach_no);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

}
