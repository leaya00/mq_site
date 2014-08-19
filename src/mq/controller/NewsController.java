package mq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mq.dao.NewsDao;
import mq.dao.OtherDao;
import mq.dao.TypeDao;
import mq.utils.SystemUtils;

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
	@Autowired
	OtherDao otherDao;
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
		//获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		//获取top5
		mav.addObject("top5List", newsDao.getNews("1", "5", news.get("type").toString()));
		
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		return mav;

	}
	static String  newsListPagesize=SystemUtils.getSystemPropertie("newsList.pagesize");
	@RequestMapping(value = "/newsList")
	public ModelAndView news(@RequestParam(value = "pageNo") String pageNo,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String type=request.getParameter("type");
		if(type==null){
			//获取第一个分类id
			type=typeDao.getTypes_topID("1");
		}
		//新闻列表页显示条数
		String pageSize=newsListPagesize;
		mav.setViewName("news");
		ArrayList<HashMap<String, Object>> newsList = newsDao.getNews(pageNo, pageSize, type);
		String recordCount=newsDao.getNewsCount(type);
		mav.addObject("newsList",newsList );
		//获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		//其他
		mav.addObject("hot_telphone", otherDao.selectOneBaseInfoByCode("hot_telphone"));
		mav.addObject("hot_linkman", otherDao.selectOneBaseInfoByCode("hot_linkman"));
		mav.addObject("hot_email", otherDao.selectOneBaseInfoByCode("hot_email"));
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		//获取新闻分类
		HashMap<String, Object> types = typeDao.getTypeOne(type);
		List<HashMap<String, Object>> typeList = typeDao.getTypes("1");
		
		mav.addObject("types", types);
		mav.addObject("typeList", typeList);
		//传url
		mav.addObject("type",type);
		mav.addObject("pageSize",pageSize);
		mav.addObject("recordCount",recordCount);
		
		return mav;

	}
}
