package mq.controller.manage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mq.dao.OtherDao;
import mq.dao.TestDao;
import mq.interceptor.MustLogin;
import mq.utils.ValidateCode.ValidateCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OtherController {
	@Autowired
	OtherDao otherDao;

	@RequestMapping(value = "/m_serviceInfo")
	public ModelAndView serviceInfoList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/serviceInfoList");
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		return mav;

	}

	@RequestMapping(value = "/m_serviceInfoEdit")
	public ModelAndView serviceInfoEdit(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/serviceInfoEdit");
		mav.addObject("id", id);
		if (id.equals("-1") == false) {
			HashMap<String, Object> serviceInfo = otherDao
					.selectOneServiceInfo(id);
			mav.addObject("serviceInfo", serviceInfo);
		}
		return mav;

	}

	@RequestMapping(value = "/m_serviceInfoSave")
	public String serviceInfoSave(@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// title,type,xh
		map.put("name", request.getParameter("name"));
		map.put("telphone", request.getParameter("telphone"));
		map.put("xh", request.getParameter("xh"));
		map.put("id", id);
		if (id.equals("-1")) {
			// insert
			otherDao.insertServiceInfo(map);
			return "redirect:/m_serviceInfo.shtml";
		} else {
			if (request.getParameter("del") == null) {
				otherDao.updateServiceInfo(map);
			} else {
				otherDao.deleteServiceInfo(id);
			}
			return "redirect:/m_serviceInfo.shtml";
		}
	}

	// 基本信息
	@RequestMapping(value = "/m_baseInfo")
	public ModelAndView baseInfoList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/baseInfoList");
		mav.addObject("baseInfoList", otherDao.selectAllBaseInfo());
		return mav;

	}

	@RequestMapping(value = "/m_baseInfoEdit")
	public ModelAndView baseInfoEdit(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/baseInfoEdit");
		mav.addObject("id", id);
		if (id.equals("-1") == false) {
			mav.addObject("baseInfo", otherDao.selectOneBaseInfo(id));
		}
		return mav;

	}

	@RequestMapping(value = "/m_baseInfoSave")
	public String baseInfoSave(@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("value", request.getParameter("value"));
		map.put("xh", request.getParameter("xh"));
		map.put("id", id);
		otherDao.updateBaseInfo(map);

		return "redirect:/m_baseInfo.shtml";
	}
	@RequestMapping(value = "/m_login")
	public String login() {
		HashMap<String, Object> map = new HashMap<String, Object>();
	

		return "manage/login";
	}
}
