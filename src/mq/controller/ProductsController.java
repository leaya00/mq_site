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
	static String productsListPagesize = SystemUtils
			.getSystemPropertie("productsList.pagesize");

	@RequestMapping(value = "/products")
	public ModelAndView products_xq(@RequestParam(value = "pageNo") String pageNo,@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("products_xq");
		// 产品信息
		HashMap<String, Object> products = productsDao.getProductsOne(id);
		String type = products.get("type").toString();
		HashMap<String,Object> productdetail = productsDao.getProductdetail(
				pageNo,  id);
		String recordCount = productsDao.getProductdetailCount(id);
	
		mav.addObject("products", products);
		mav.addObject("productdetail", productdetail);

		// 获取分类
		HashMap<String, Object> types = typeDao.getTypeOne(type);
		List<HashMap<String, Object>> typeList = typeDao.getTypes("2");
		mav.addObject("types", types);
		mav.addObject("typeList", typeList);
		// 获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		// url
		mav.addObject("pageSize", "1");
		mav.addObject("recordCount", recordCount);
		mav.addObject("id", id);
		return mav;
	}

	@RequestMapping(value = "/productsList")
	public ModelAndView productsList(
			@RequestParam(value = "pageNo") String pageNo,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String type = request.getParameter("type");
		mav.setViewName("products");
		if (type == null) {
			// 获取第一个分类id
			type = typeDao.getTypes_topID("2");
		}
		// 产品列表
		String pageSize = productsListPagesize;
		ArrayList<HashMap<String, Object>> newsList = productsDao.getProducts(
				pageNo, pageSize, type);
		String recordCount = productsDao.getProductsCount(type);
		mav.addObject("productsList", newsList);
		// 获取分类
		HashMap<String, Object> types = typeDao.getTypeOne(type);
		List<HashMap<String, Object>> typeList = typeDao.getTypes("2");
		mav.addObject("types", types);
		mav.addObject("typeList", typeList);
		// 获取客服信息
		mav.addObject("serviceInfoList", otherDao.selectAllServiceInfo());
		// 传url
		mav.addObject("type", type);
		mav.addObject("pageSize", pageSize);
		mav.addObject("recordCount", recordCount);
		return mav;

	}

}
