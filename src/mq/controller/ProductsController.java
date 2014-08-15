package mq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mq.dao.OtherDao;
import mq.dao.ProductsDao;
import mq.dao.TypeDao;
import mq.utils.SystemUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductsController {
	@Autowired
	ProductsDao productsDao;
	@Autowired
	TypeDao typeDao;
	@Autowired
	OtherDao otherDao;
	@RequestMapping(value = "/productsList")
	public ModelAndView productsList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Products");
		
		
		return mav;

	}
	
}
