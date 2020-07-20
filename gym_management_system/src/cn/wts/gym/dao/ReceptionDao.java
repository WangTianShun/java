package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.Reception;
import cn.wts.gym.domain.User;


public interface ReceptionDao {
	/**
	 * 前台登录
	 * @param reception
	 * @return
	 */
	public Reception login(Reception reception);
	
	/**
	 * 前台添加
	 * @param reception
	 */
	public void saveReception(Reception reception);
	/**
	 * 根据用户名查找前台
	 * @param username
	 * @return
	 */
	public Reception findReceptionByUsername(String username);
	/**
	 * 查找前台记录总数
	 * @param condition
	 * @return
	 */
	public int findReceptionCount(Map<String, String[]> condition);
	/**
	 * 对用户进行分页查询
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<Reception> findReceptionByPage(int start, int rows,Map<String, String[]> condition);
	/**
	 * 通过reception_id得到reception对象
	 * @param reception_id
	 * @return
	 */
	public Reception findReceptionByReception_id(Integer reception_id);
	/**
	 * 删除前台
	 * @param existReception
	 */
	public void deleteReception(Reception existReception);
	/**
	 * 修改前台
	 * @param existReception
	 */
	public void updateReception(Reception existReception);
}
