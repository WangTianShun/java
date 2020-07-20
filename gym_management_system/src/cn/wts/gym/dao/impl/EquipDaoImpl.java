package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.wts.gym.dao.EquipDao;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.Equip;
import cn.wts.gym.web.page.PageHibernateCallback;

public class EquipDaoImpl extends HibernateDaoSupport implements EquipDao{

	@Override
	public void saveEquip(Equip equip) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(equip);
	}

	@Override
	public int findEquipCount(Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from Equip where 1 = 1 ";
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
	public List<Equip> findEquipByPage(int start, int rows, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from Equip where 1 = 1 ";
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
		List<Equip> list = (List<Equip>) this.getHibernateTemplate().execute(new PageHibernateCallback<Equip>(hql, params.toArray(), start, rows));
		return list;
	}

	@Override
	public Equip findEquipByEquip_id(Integer equip_id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Equip.class, equip_id);
	}

	@Override
	public void deleteEquip(Equip equip) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(equip);
	}

	@Override
	public void updateEquip(Equip equip) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(equip);
	}

	@Override
	public List<Equip> findAllEquip() {
		// TODO Auto-generated method stub
		return (List<Equip>) this.getHibernateTemplate().find("from Equip");
	}

}
