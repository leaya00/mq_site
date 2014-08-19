package mq.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mq.dao.NewsDao;
import mq.dao.OtherDao;
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
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		// 滚动新闻
		mav.addObject("newsScrollList",
				newsDao.getNewsOrderByTime(newsScrollCount));
		// 新闻栏目
		ArrayList<HashMap<String, Object>> news_hotList = newsDao
				.getNewsOrderByNewsorder(news_hotListCount);
		if (news_hotList.size() > 0) {
			HashMap<String, Object> news_top1 = news_hotList.remove(0);
			mav.addObject("news_top1", news_top1);
			mav.addObject("news_hotList", news_hotList);
		}
		// 产品分类展示
		mav.addObject("yewuList", typeDao.getTypesTop("2", "4"));
		// 产品top
		mav.addObject("productsIndexTop", productsDao.getProductsIndexTop());
		//其他
		mav.addObject("index_about", otherDao.selectOneBaseInfoByCode("index_about"));
		mav.addObject("index_about_biaoyu", otherDao.selectOneBaseInfoByCode("index_about_biaoyu"));
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		return mav;

	}

	@Autowired
	OtherDao otherDao;

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("about");
		// 获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		// 其他
		mav.addObject("hot_telphone",
				otherDao.selectOneBaseInfoByCode("hot_telphone"));
		mav.addObject("hot_linkman",
				otherDao.selectOneBaseInfoByCode("hot_linkman"));
		mav.addObject("hot_email",
				otherDao.selectOneBaseInfoByCode("hot_email"));

		mav.addObject("about", otherDao.selectOneBaseInfoByCode("about"));
		
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		return mav;
	}
}
