package com.rdkl.management.persistence;

import java.util.List;

import com.rdkl.common.domain.news.News;
import com.rdkl.common.util.Page;

public interface NewsMapper {

	public List<News> getNewsList(Page<News> page);
	
	public News getNewsById(int newsId);
	
	public void addNews(News news);
}
