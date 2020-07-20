package cn.wts.gym.dao;

import java.util.List;
import java.util.Map;

import cn.wts.gym.domain.News;

public interface NewsDao {
	/**
	 * 保存新闻
	 * @param news
	 */
	public void saveNews(News news);
	/**
	 * 查询新闻记录总数
	 * @param condition
	 * @return
	 */
	public int findNewsCount(News news);
	/**
	 * 根据条件分页查询新闻
	 * @param start
	 * @param rows
	 * @param condition
	 * @return
	 */
	public List<News> findNewsByPage(int start, int rows,News news);
	/**
	 * 删除新闻
	 * @param news
	 */
	public void deleteNews(News news);
	/**
	 * 修改新闻
	 * @param news
	 */
	public void updateNews(News news);
	
	/**
	 * 查询全部新闻
	 */
	public List<News> findAllNews();
	/**
	 * 根据news_id查询新闻
	 * @param news_id
	 * @return
	 */
	public News findNewsByNews_id(Integer news_id);
}
