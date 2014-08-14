package mq.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class TestController {

//	@MustLogin
	@RequestMapping(value = "/test")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		mav.addObject("msg", "控制器消息");

		return mav;

	}

	@Autowired
	TestDao testDao;

	@RequestMapping(value = "/test1")
	public ModelAndView test1(@RequestParam(value = "a") String a,
			@RequestParam(value = "b") String b) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		mav.addObject("msg", "插入数据");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("a", a);
		map.put("b", b);
		testDao.insertTest(map);
		return mav;

	}

	// http://127.0.0.1:8080/mq_site/test2?a=6&b=0
	@Transactional
	@RequestMapping(value = "/test2")
	public ModelAndView test2(@RequestParam(value = "a") int a,
			@RequestParam(value = "b") int b) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("a", Integer.toString(a));
		map.put("b", Integer.toString(b));
		testDao.insertTest(map);
		mav.setViewName("test");
		double x = a / b;
		mav.addObject("msg", x);

		return mav;

	}

	// http://127.0.0.1:8080/mq_site/test2?a=6&b=0
	@RequestMapping(value = "/test3")
	public ModelAndView test3(@RequestParam(value = "a") int a,
			@RequestParam(value = "b") int b) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("a", Integer.toString(a));
		map.put("b", Integer.toString(b));
		testDao.insertTest(map);
		mav.setViewName("test");
		double x = a / b;
		mav.addObject("msg", x);

		return mav;

	}

	@RequestMapping(value = "/test4")
	public void test3(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		HttpSession session = request.getSession();

		ValidateCode vCode = new ValidateCode(120, 40, 5, 100);
		session.setAttribute("ValidateCode", vCode.getCode());
		vCode.write(response.getOutputStream());

	}
}
