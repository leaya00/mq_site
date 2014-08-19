package mq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mq.dao.OtherDao;
import mq.dao.TmentsDao;
import mq.utils.SystemUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class TmentController {
	static String  newsListPagesize=SystemUtils.getSystemPropertie("tmentsList.pagesize");
	@Autowired
	TmentsDao tmentsDao;
	@Autowired
	OtherDao otherDao;
	@RequestMapping(value = "/mentsList")
	public ModelAndView mentsList(@RequestParam(value = "pageNo") String pageNo,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//列表页显示条数
		String pageSize=newsListPagesize;
		mav.setViewName("tment");
		ArrayList<HashMap<String, Object>> tmentsList = tmentsDao.selectTments(pageNo, pageSize) ;
		String recordCount=tmentsDao.getTmentsCount();
		mav.addObject("tmentsList",tmentsList );
		//获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		//传url
		mav.addObject("pageSize",pageSize);
		mav.addObject("recordCount",recordCount);
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		return mav;

	}
	@RequestMapping(value = "/tments")
	public ModelAndView tments_xq(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tment_xq");
		HashMap<String, Object> tments=tmentsDao.selectOneTment(id) ;
		mav.addObject("tments",tments );
		mav.addObject("pretments", tmentsDao.getPreTmentId(id));
		mav.addObject("nextments", tmentsDao.getNextTmentId(id));
		
		
		//获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		return mav;

	}
}
