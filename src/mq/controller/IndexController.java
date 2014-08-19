package mq.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mq.dao.NewsDao;
import mq.dao.ProductsDao;
import mq.dao.TypeDao;
import mq.utils.SystemUtils;
import mq.utils.ValidateCode.ValidateCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@Autowired
	NewsDao newsDao;
	@Autowired
	TypeDao typeDao;
	@Autowired
	ProductsDao productsDao;
	static String newsScrollCount = SystemUtils
			.getSystemPropertie("newsScroll.count");
	static String news_hotListCount = SystemUtils
			.getSystemPropertie("news_hotList.count");
	@RequestMapping(value = "/index")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		// 滚动新闻
		mav.addObject("newsScrollList", newsDao.getNewsOrderByTime(newsScrollCount));
		// 新闻栏目
		ArrayList<HashMap<String, Object>> news_hotList = newsDao
				.getNewsOrderByNewsorder(news_hotListCount);
		if (news_hotList.size() > 0) {
			HashMap<String, Object> news_top1 = news_hotList.remove(0);
			mav.addObject("news_top1", news_top1);
			mav.addObject("news_hotList", news_hotList);
		}
		//产品分类展示
		mav.addObject("yewuList", typeDao.getTypesTop("2", "4"));
		//产品top
		mav.addObject("productsIndexTop", productsDao.getProductsIndexTop());
		
		return mav;

	}
}
