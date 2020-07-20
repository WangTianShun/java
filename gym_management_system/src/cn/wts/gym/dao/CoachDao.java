package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.User;

public interface CoachDao {
	/**
	 * 添加教练
	 * @param coach
	 */
	public void saveCoach(Coach coach);
	/**
	 * 查找教练记录总数
	 * @param condition
	 * @return
	 */
	public int findCoachCount(Map<String, String[]> condition);
	/**
	 * 对教练进行分页查询
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<Coach> findCoachByPage(int start, int rows,Map<String, String[]> condition);
	/**
	 * 通过user_id得到User对象
	 * @param coach_id
	 * @return
	 */
	public Coach findCoachByCoach_id(Integer coach_id);
	/**
	 * 删除教练
	 * @param coach
	 */
	public void deleteCoach(Coach coach);
	/**
	 * 修改Coach
	 * @param coach
	 */
	public void updateCoach(Coach coach);
	/**
	 * 一对多用到需要添加教练
	 * @return
	 */
	public List<Coach> findAllCoach();
	/**
	 * 根据教练姓名查找教练	
	 * @param coach_name
	 * @return
	 */
	public Coach findCoachByCoach_name(String coach_name);
	/**
	 * 根据教练号查找教练
	 * @param coach_no
	 * @return
	 */
	public Coach findCoachByCoach_no(String coach_no);
}
