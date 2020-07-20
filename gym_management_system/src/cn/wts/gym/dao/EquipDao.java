package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;
import cn.wts.gym.domain.Equip;

public interface EquipDao {
	/**
	 * 保存健身器材
	 * @param equip
	 */
	public void saveEquip(Equip equip);
	/**
	 * 查询健身器材记录总数
	 * @param condition
	 * @return
	 */
	public int findEquipCount(Map<String, String[]> condition);
	/**
	 * 根据条件分页查询健身器材
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<Equip> findEquipByPage(int start, int rows,Map<String, String[]> condition);
	/**
	 * 根据equip_id查询健身器材
	 * @param equip_id
	 * @return
	 */
	public Equip findEquipByEquip_id(Integer equip_id);
	/**
	 * 删除健身器材
	 * @param equip
	 */
	public void deleteEquip(Equip equip);
	/**
	 * 修改健身器材
	 * @param equip
	 */
	public void updateEquip(Equip equip);
	
	/**
	 * 查询全部equip
	 */
	public List<Equip> findAllEquip();
}
