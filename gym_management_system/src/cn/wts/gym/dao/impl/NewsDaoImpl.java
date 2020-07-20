package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.NewsDao;
import cn.wts.gym.domain.News;
import cn.wts.gym.web.page.PageHibernateCallback;

public class NewsDaoImpl extends HibernateDaoSupport implements NewsDao{

	@Override
	public void saveNews(News news) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(news);
	}
	@Override
	public int findNewsCount(News news) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from News where 1 = 1 ";
		//创建list集合，如果值不为空，把值设置到list里面
		List<Object> value = new ArrayList<Object>();
		if(news.getNews_title()!=null && !"".equals(news.getNews_title())) {
			hql +=" and news_title = ?";
			//把值设置到list里面
			value.add(news.getNews_title());
		}
		if(news.getNews_id()!=0 && !"".equals(news.getNews_id())) {
			hql +=" and news_id = ?";
			value.add(news.getNews_id());
		}
		if(news.getNews_time()!=null  && !"".equals(news.getNews_time())) {
			hql +=" and news_time = ?";
			value.add(news.getNews_time());
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
	public List<News> findNewsByPage(int start, int rows,News news) {
		// TODO Auto-generated method stub
		//创建list集合，如果值不为空，把值设置到list里面
		List<Object> value = new ArrayList<Object>();
		//定义模板
		String hql = "from News where 1 = 1 ";
		//判断条件是否为空，如果不为空拼接hql语句
		if(news.getNews_title()!=null && !"".equals(news.getNews_title())) {
			hql +=" and news_title = ?";
			//把值设置到list里面
			value.add(news.getNews_title());
		}
		if(news.getNews_id()!=0 && !"".equals(news.getNews_id())) {
			hql +=" and news_id = ?";
			value.add(news.getNews_id());
		}
		if(news.getNews_time()!=null  && !"".equals(news.getNews_time())) {
			hql +=" and news_time = ?";
			value.add(news.getNews_time());
		}
		System.out.println(hql);
	    System.out.println(value);
		List<News> list = (List<News>) this.getHibernateTemplate().execute(new PageHibernateCallback<News>(hql, value.toArray(), start, rows));
		return list;	
	}
	
	@Override
	public void deleteNews(News news) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(news);
	}

	@Override
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(news);
	}

	@Override
	public List<News> findAllNews() {
		// TODO Auto-generated method stub
		String hql ="from News";
		
		return (List<News>) this.getHibernateTemplate().find(hql);
	}

	@Override
	public News findNewsByNews_id(Integer news_id) {
		// TODO Auto-generated method stub
		String hql ="from News where news_id = ?";
		return this.getHibernateTemplate().get(News.class, news_id);
	}
	

}
