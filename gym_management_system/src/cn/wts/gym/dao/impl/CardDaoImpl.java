package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.wts.gym.dao.CardDao;
import cn.wts.gym.domain.Card;
import cn.wts.gym.web.page.PageHibernateCallback;

public class CardDaoImpl extends HibernateDaoSupport implements CardDao{
	/**
	 *会员卡模块===================================================================
	 */	
	@Override
	public Card findCardByCard_no(String card_no) {
		// TODO Auto-generated method stub
		String hql = "from Card where card_no = ?";
		List<Card> list = (List<Card>) this.getHibernateTemplate().find(hql, card_no);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
		
	@Override
	public Card findCardByUser_id(Integer user_id) {
		// TODO Auto-generated method stub
		String hql = "from Card where user_id = ?";
		List<Card> list = (List<Card>) this.getHibernateTemplate().find(hql, user_id);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
		
	@Override
	public void saveCard(Card card) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(card);
	}
		
	@Override
	public int findCardCount(Card card) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from Card where 1 = 1 ";
		//创建list集合，如果值不为空，把值设置到list里面
		List<Object> value = new ArrayList<Object>();
		if(card.getCard_no()!=null && !"".equals(card.getCard_no())) {
			hql +=" and card_no = ?";
			//把值设置到list里面
			value.add(card.getCard_no());
		}
		if(card.getCard_end()!=null  && !"".equals(card.getCard_end())) {
			hql +=" and card_end = ?";
			value.add(card.getCard_end());
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
	public List<Card> findCardByPage(int start, int rows,Card card) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from Card where 1 = 1 ";
		//创建list集合，如果值不为空，把值设置到list里面
		List<Object> value = new ArrayList<Object>();
		if(card.getCard_no()!=null && !"".equals(card.getCard_no())) {
			hql +=" and card_no = ?";
			//把值设置到list里面
			value.add(card.getCard_no());
		}
		if(card.getCard_end()!=null  && !"".equals(card.getCard_end())) {
			hql +=" and card_end = ?";
			value.add(card.getCard_end());
		}
		System.out.println(hql);
		System.out.println(value);
	    List<Card> list = (List<Card>) this.getHibernateTemplate().execute(new PageHibernateCallback<Card>(hql, value.toArray(), start, rows));
		return list;
	}
		
	@Override
	public Card findCardByCard_id(Integer card_id) {
		// TODO Auto-generated method stubs
		return this.getHibernateTemplate().get(Card.class, card_id);
	}
		
	@Override
	public void deleteCard(Card card) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(card);
	}
		
	public void updateCard(Card existCard) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(existCard);	
	}
}
