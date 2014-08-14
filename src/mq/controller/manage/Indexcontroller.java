package mq.controller.manage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import mq.dao.NewsDao;
import mq.dao.TypeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Conventions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Indexcontroller {
	@RequestMapping(value = "/m_home")
	public String home() {
		return "manage/index";
	}
	String pageSize="5";
	//新闻管理
	@Autowired
	NewsDao newsDao;
	
	@RequestMapping(value = "/m_news")
	public ModelAndView news_List(@RequestParam(value = "pageNo") String page,@RequestParam(value = "type") String type) {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, Object>> newsList=newsDao.getNews(page, pageSize,type);
		String recordCount=newsDao.getNewsCount(type);
		mav.addObject("type", type);
		mav.addObject("pageSize", pageSize);
		mav.addObject("recordCount", recordCount);
		mav.addObject("newsList", newsList);
		mav.addObject("typeList", typeDao.getTypes("1"));
		mav.setViewName("manage/newsList");
		return mav;

	}

	
	@RequestMapping(value = "/m_newsEdit")
	public ModelAndView newsEdit(@RequestParam(value = "id") String id,@RequestParam(value = "type") String type) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/newsEdit");
		mav.addObject("id", id);
		mav.addObject("typeList", typeDao.getTypes("1"));
		HashMap<String,Object> news=new HashMap<String, Object>();
		news.put("type", type);
		news.put("newsorder", 0);
		if (id.equals("-1") ==false) {
			news=newsDao.getNewsOne(id);
		}
		mav.addObject("news",news);
		return mav;

	}

	@RequestMapping(value = "/m_newsSave")
	public String newsSave(@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("title", request.getParameter("title"));
		map.put("author", request.getParameter("author"));
		map.put("type", request.getParameter("type"));
		map.put("newsorder", request.getParameter("newsorder")==null?0:request.getParameter("newsorder"));
		map.put("content", request.getParameter("content"));
		map.put("id", id);
		if (id.equals("-1") ) {
			//insert
			newsDao.insertTest(map);
			return "redirect:/m_news.shtml?pageNo=1&type="+request.getParameter("type");
		} else {
			if (request.getParameter("del") == null) {
				newsDao.updateNews(map);
			} else {
				newsDao.deleteNews(id);
			}
			
			return "redirect:/m_news.shtml?pageNo=1&type="+request.getParameter("type");
		}

	}
	
	//分类管理
	@Autowired
	TypeDao typeDao;
	@RequestMapping(value = "/m_type")
	public ModelAndView type_List(@RequestParam(value = "type") String type) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("typeList", typeDao.getTypes(type));
		mav.addObject("type", type);
		mav.setViewName("manage/typeList");
		return mav;

	}
	@RequestMapping(value = "/m_typeEdit")
	public ModelAndView typeEdit(@RequestParam(value = "type") String type,@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/typeEdit");
		mav.addObject("id", id);
		mav.addObject("type", type);
		if (id.equals("-1") ==false) {
			HashMap<String,Object> news=typeDao.getTypeOne(id);
			mav.addObject("types",news);
		}
		return mav;

	}
	@RequestMapping(value = "/m_typeSave")
	public String typeSave(@RequestParam(value = "type") String type,@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String,Object> map=new HashMap<String, Object>();
    	//title,type,xh
		map.put("title", request.getParameter("title"));
		map.put("type", type);
		map.put("xh", request.getParameter("xh"));
		map.put("id", id);
		if (id.equals("-1") ) {
			//insert
			typeDao.insertType(map);
			return "redirect:/m_type.shtml?type="+type;
		} else {
			typeDao.updateType(map);
			return "redirect:/m_type.shtml?type="+type;
		}

	}
}
