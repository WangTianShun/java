package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.User;


public interface UserDao {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	/**
	 * 用户注册
	 * @param user
	 */
	public void saveUser(User user);
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return
	 */
	public User findUserByUsername(String username);
	/**
	 * 查找用户记录总数
	 * @param condition
	 * @return
	 */
	public int findUserCount(Map<String, String[]> condition);
	/**
	 * 对用户进行分页查询
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<User> findUserByPage(int start, int rows,Map<String, String[]> condition);
	/**
	 * 通过user_id得到User对象
	 * @param user_id
	 * @return
	 */
	public User findUserByUser_id(Integer user_id);
	/**
	 * 删除用户
	 * @param existUser
	 */
	public void deleteUser(User existUser);
	/**
	 * 修改用户
	 * @param existUser
	 */
	public void updateUser(User existUser);
	/**
	 * 查找全部用户
	 * @return
	 */
	public List<User> findAllUser();
}
