package mq.controller;

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
public class ContactController {
	@Autowired
	OtherDao otherDao;

	@RequestMapping(value = "/contact")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contact");
		// 获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		// 其他
		mav.addObject("hot_telphone",
				otherDao.selectOneBaseInfoByCode("hot_telphone"));
		mav.addObject("hot_linkman",
				otherDao.selectOneBaseInfoByCode("hot_linkman"));
		mav.addObject("hot_email",
				otherDao.selectOneBaseInfoByCode("hot_email"));
		mav.addObject("foot_hottel", otherDao.selectOneBaseInfoByCode("foot_hottel"));
		return mav;

	}

}