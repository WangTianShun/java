package cn.wts.gym.web.page;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

//为了实现分页查询而写的类
public class PageHibernateCallback<T> implements HibernateCallback<T> {
	private String hql;
	private Object[] params;
	private int start;
	private int limit;
	
	

	public PageHibernateCallback(String hql, Object[] params, int start, int limit) {
		super();
		this.hql = hql;
		this.params = params;
		this.start = start;
		this.limit = limit;
	}

	@Override
	public T doInHibernate(Session session) throws HibernateException {
		// TODO Auto-generated method stub
		//1 执行hql语句
		Query query = session.createQuery(hql);
		//2 实际参数
		if(params != null){
			for(int i = 0 ; i < params.length ; i++){
				query.setParameter(i, params[i]);
			}
		}
		//3 分页
		query.setFirstResult(start);
		query.setMaxResults(limit);
		return (T) query.list();
	}

}
