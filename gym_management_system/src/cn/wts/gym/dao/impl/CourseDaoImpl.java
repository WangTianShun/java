package cn.wts.gym.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import cn.wts.gym.dao.CourseDao;
import cn.wts.gym.domain.Course;
import cn.wts.gym.web.page.PageHibernateCallback;

public class CourseDaoImpl extends HibernateDaoSupport implements CourseDao {

	@Override
	public void saveCourse(Course course) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(course);
	}

	@Override
	public int findCourseCount(Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板hql
		String hql = "select count(*) from Course where 1 = 1 ";
		// 以下此内容为复杂查询
        StringBuilder sb = new StringBuilder(hql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key)){
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");//append连接的作用
                params.add("%"+value+"%");//？条件的值
            }
        }
		System.out.println(sb.toString());
	    System.out.println(params);
	    hql = sb.toString();
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,params.toArray());
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Course> findCourseByPage(int start, int rows, Map<String, String[]> condition) {
		// TODO Auto-generated method stub
		//定义模板
		String hql = "from Course where 1 = 1 ";
		//String hql = "from Course c inner join fetch c.coach where 1 = 1 ";
		StringBuilder sb = new StringBuilder(hql);
	    //2.遍历map
	    Set<String> keySet = condition.keySet();
	    //定义参数的集合
	    List<Object> params = new ArrayList<Object>();
	       for (String key : keySet) {
	    	   //排除分页条件参数
	           if("currentPage".equals(key)){
	               continue;
	           }
		        //获取value
		         String value = condition.get(key)[0];
		         //判断value是否有值
		         if(value != null && !"".equals(value)){
		        	 //有值
		        	 sb.append(" and "+key+" like ? ");//append连接的作用
		        	 params.add("%"+value+"%");//？条件的值
		         }
		    }
   
	        hql = sb.toString();
	        System.out.println(hql);
	        System.out.println(params);
		List<Course> list = (List<Course>) this.getHibernateTemplate().execute(new PageHibernateCallback<Course>(hql, params.toArray(), start, rows));
		return list;
	}

	@Override
	public Course findCourseByCourse_id(Integer course_id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Course.class, course_id);
	}

	@Override
	public void deleteCourse(Course course) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(course);
	}

	@Override
	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(course);
	}

	@Override
	public List<Course> findAllCourse() {
		// TODO Auto-generated method stub
		return (List<Course>) this.getHibernateTemplate().find("from Course");
	}

	@Override
	public Course findCourseByCourse_no(String course_no) {
		// TODO Auto-generated method stub
		String hql = "from Course where course_no = ?";
		List<Course> list = (List<Course>) this.getHibernateTemplate().find(hql,course_no);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	
}
