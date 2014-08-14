package mq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import mq.dao.NewsDao;
import mq.dao.TypeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsController {
	@Autowired
	NewsDao newsDao;
	@Autowired
	TypeDao typeDao;
	@RequestMapping(value = "/news")
	public ModelAndView news_xq(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("news_xq");
		HashMap<String, Object> news=newsDao.getNewsOne(id);
		mav.addObject("news",news );
		mav.addObject("preNews", newsDao.getPreNewsId(id));
		mav.addObject("nextNews", newsDao.getNextNewsId(id));
		
		//获取新闻分类
		HashMap<String, Object> types = typeDao.getTypeOne(news.get("type").toString());
		List<HashMap<String, Object>> typeList = typeDao.getTypes("1");
		
		mav.addObject("types", types);
		mav.addObject("typeList", typeList);
		return mav;

	}
	@RequestMapping(value = "/newsList")
	public ModelAndView news(@RequestParam(value = "pageNo") String pageNo,@RequestParam(value = "type") String type) {
		ModelAndView mav = new ModelAndView();
		String pageSize="5";
		mav.setViewName("news");
		ArrayList<HashMap<String, Object>> newsList = newsDao.getNews(pageNo, pageSize, type);
		String recordCount=newsDao.getNewsCount(type);
		mav.addObject("newsList",newsList );
		
		//获取新闻分类
		HashMap<String, Object> types = typeDao.getTypeOne(type);
		List<HashMap<String, Object>> typeList = typeDao.getTypes("1");
		
		mav.addObject("types", types);
		mav.addObject("typeList", typeList);
		
		mav.addObject("type",type);
		mav.addObject("pageSize",pageSize);
		mav.addObject("recordCount",recordCount);
		
		return mav;

	}
}
