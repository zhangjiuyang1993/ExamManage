package com.rdkl.management.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rdkl.common.domain.news.News;
import com.rdkl.common.util.Page;

@Service
public interface NewsService {

	public List<News> getNewsList(Page<News> page);
	
	public News getNewsById(int newsId);
	
	public void addNews(News news);
}
