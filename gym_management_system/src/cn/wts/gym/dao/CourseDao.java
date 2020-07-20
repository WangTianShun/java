package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.Card;
import cn.wts.gym.domain.Coach;
import cn.wts.gym.domain.Course;

public interface CourseDao {
	/**
	 * 保存课程
	 * @param course
	 */
	public void saveCourse(Course course);
	/**
	 * 查询课程总记录数
	 * @param condition
	 * @return
	 */
	public int findCourseCount(Map<String, String[]> condition);
	/**
	 * 根据条件对课程进行分页查询
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<Course> findCourseByPage(int start, int rows,Map<String, String[]> condition);	
	/**
	 * 根据Course_id查找课程
	 * @param coach_id
	 * @return
	 */
	public Course findCourseByCourse_id(Integer course_id);
	/**
	 * 删除课程
	 * @param course
	 */
	public void deleteCourse(Course course);
	/**
	 * 更新课程
	 * @param course
	 */
	public void updateCourse(Course course);
	/**
	 * 查询全部课程
	 * @return
	 */
	public List<Course> findAllCourse();
	/**
	 * 根据课程号查找课程
	 * @param course_no
	 * @return
	 */
	public Course findCourseByCourse_no(String course_no);
}