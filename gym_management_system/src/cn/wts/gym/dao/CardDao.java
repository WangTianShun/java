package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.Card;

public interface CardDao {

	/**
	 * 通过card_no得到Card对象
	 * @param card_no
	 * @return
	 */
	public Card findCardByCard_no(String card_no);
	/**
	 * 通过user_id得到Card对象
	 * @param user_id
	 * @return
	 */
	public Card findCardByUser_id(Integer user_id);
	/**
	 * 新增会员卡
	 * @param card
	 */
	public void saveCard(Card card);
	/**
	 * 查找会员卡记录总数
	 * @param card
	 * @return
	 */
	public int findCardCount(Card card);
	/**
	 * 对会员卡进行分页查询
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<Card> findCardByPage(int start, int rows,Card card);	
	/**
	 * 通过card_id得到Card对象
	 * @param card_id
	 * @return
	 */
	public Card findCardByCard_id(Integer card_id);
	/**
	 * 删除会员卡
	 * @param card
	 */
	public void deleteCard(Card card);
	/**
	 * 修改会员卡
	 * @param existCard
	 */
	public void updateCard(Card existCard);
}
