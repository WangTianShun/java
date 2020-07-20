package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.OrdersDao;
import cn.wts.gym.domain.Orders;
import cn.wts.gym.web.page.PageHibernateCallback;

public class OrdersDaoImpl extends HibernateDaoSupport implements  OrdersDao{

	@Override
	public void saveOrders(Orders orders) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(orders);
	}

	@Override
	public int findOrdersCount(Orders orders) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from Orders where 1 = 1 ";
		//创建list集合，如果值不为空，把值设置到list里面
		List<Object> value = new ArrayList<Object>();
		if(orders.getOrders_id()!=0 && !"".equals(orders.getOrders_id())) {
			hql +=" and orders_id = ?";
			//把值设置到list里面
			value.add(orders.getOrders_id());
		}
		if(orders.getUser()!=null && !"".equals(orders.getUser())) {
			hql +=" and user_id = ?";
			//把值设置到list里面
			value.add(orders.getUser().getUser_id());
		}
		if(orders.getOrders_state()!=null && !"".equals(orders.getOrders_state())) {
			hql +=" and orders_state = ?";
			//把值设置到list里面
			value.add(orders.getOrders_state());
		}
		System.out.println(hql);
	    System.out.println(value);
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,value.toArray());
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Orders> findOrdersByPage(int start, int rows,Orders orders) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from Orders where 1 = 1 ";
		//创建list集合，如果值不为空，把值设置到list里面
		List<Object> value = new ArrayList<Object>();
		if(orders.getOrders_id()!=0 && !"".equals(orders.getOrders_id())) {
			hql +=" and orders_id = ?";
			//把值设置到list里面
			value.add(orders.getOrders_id());
		}
		if(orders.getUser()!=null && !"".equals(orders.getUser())) {
			hql +=" and user_id = ?";
			//把值设置到list里面
			value.add(orders.getUser().getUser_id());
		}
		if(orders.getOrders_state()!=null && !"".equals(orders.getOrders_state())) {
			hql +=" and orders_state = ?";
			//把值设置到list里面
			value.add(orders.getOrders_state());
		}
        System.out.println(hql);
        System.out.println(value);
		List<Orders> list = (List<Orders>) this.getHibernateTemplate().execute(new PageHibernateCallback<Orders>(hql, value.toArray(), start, rows));
		return list;
	}

	@Override
	public Orders findOrdersByOrders_id(Integer orders_id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Orders.class, orders_id);
	}

	@Override
	public void deleteOrders(Orders orders) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(orders);
	}

	@Override
	public void updateOrders(Orders orders) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(orders);
	}

	@Override
	public Orders findOrdersByOrders_no(String orders_no) {
		// TODO Auto-generated method stub
		String hql = "from Orders where orders_no = ?";
		List<Orders> list = (List<Orders>) this.getHibernateTemplate().find(hql,orders_no);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public int findOrdersCountByCourse_id(Integer course_id) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Orders where course_id = ? ";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,course_id);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Orders> findOrdersByUser_id(Integer user_id) {
		// TODO Auto-generated method stub
		String hql = "from Orders where user_id = ? ";
		List<Orders> list  = (List<Orders>) this.getHibernateTemplate().find(hql, user_id);
		return list;
	}

}
