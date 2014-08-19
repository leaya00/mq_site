package mq.controller.manage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mq.dao.NewsDao;
import mq.dao.ProductsDao;
import mq.dao.TmentsDao;
import mq.dao.TypeDao;
import mq.interceptor.MustLogin;
import mq.utils.ValidateCode.ValidateCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Conventions;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
		map.put("imgurl1", request.getParameter("imgurl1"));
		map.put("id", id);
		if (id.equals("-1") ) {
			//insert
			newsDao.insertNews(map);
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
	//产品管理
	@Autowired
	ProductsDao productsDao;
	@RequestMapping(value = "/m_products")
	public ModelAndView products_List(@RequestParam(value = "pageNo") String page,@RequestParam(value = "type") String type) {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, Object>> productsList=productsDao.getProducts(page, pageSize,type);
		String recordCount=productsDao.getProductsCount(type);
		mav.addObject("type", type);
		mav.addObject("pageSize", pageSize);
		mav.addObject("recordCount", recordCount);
		mav.addObject("productsList", productsList);
		mav.addObject("typeList", typeDao.getTypes("2"));
		mav.setViewName("manage/productsList");
		return mav;

	}
	@RequestMapping(value = "/m_productsEdit")
	public ModelAndView productsEdit(@RequestParam(value = "id") String id,@RequestParam(value = "type") String type) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/productsEdit");
		mav.addObject("id", id);
		
		mav.addObject("typeList", typeDao.getTypes("2"));
		HashMap<String,Object> products=new HashMap<String, Object>();
		products.put("xh", 0);
		products.put("type", type);
		if (id.equals("-1") ==false) {
			products=productsDao.getProductsOne(id);
		}
		mav.addObject("products",products);
		
		mav.addObject("productdetailList",productsDao.getProductdetailByProductid(id));
		return mav;

	}
	@Transactional
	@RequestMapping(value = "/m_productsSave")
	public String productsSave(@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("title", request.getParameter("title"));
		map.put("type", request.getParameter("type"));
		map.put("xh", request.getParameter("xh")==null?0:request.getParameter("xh"));
		map.put("remark", request.getParameter("remark"));
		map.put("imgurl1", request.getParameter("imgurl1"));
		map.put("imgurl2", request.getParameter("imgurl2"));
		map.put("isindextop", request.getParameter("isindextop"));
		map.put("id", id);
		if (id.equals("-1") ) {
			//insert
			productsDao.insertProducts(map);
			return "redirect:/m_products.shtml?pageNo=1&type="+request.getParameter("type");
		} else {
			if (request.getParameter("del") == null) {
				productsDao.updateProducts(map);
			} else {
				productsDao.deleteProducts(id);
				productsDao.deleteAllProductdetail(id);
			}
			
			return "redirect:/m_products.shtml?pageNo=1&type="+request.getParameter("type");
		}

	}
	//产品详情
	@RequestMapping(value = "/m_productdetailEdit")
	public ModelAndView productdetailEdit(@RequestParam(value = "id") String id,@RequestParam(value = "type") String type,@RequestParam(value = "productid") String productid) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/productdetailEdit");
		mav.addObject("id", id);
		mav.addObject("type", type);
		mav.addObject("productid", productid);
		HashMap<String,Object> productdetail=new HashMap<String, Object>();
		productdetail.put("productid", productid);
		productdetail.put("xh", 0);
		if (id.equals("-1") ==false) {
			productdetail=productsDao.getProductdetailOne(id) ;
		}
		mav.addObject("productdetail",productdetail);
		return mav;

	}
	@RequestMapping(value = "/m_productdetailSave")
	public String productdetailSave(@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("productid", request.getParameter("productid"));
		map.put("xh", request.getParameter("xh")==null?0:request.getParameter("xh"));
		map.put("content", request.getParameter("content"));
		map.put("id", id);
		if (id.equals("-1") ) {
			//insert
			productsDao.insertProductdetail(map);
		} else {
			if (request.getParameter("del") == null) {
				productsDao.updateProductdetail(map);
			} else {
				productsDao.deleteProductdetail(id);
			}
			
		}
		return "redirect:/m_productsEdit.shtml?id="+request.getParameter("productid")+"&type="+request.getParameter("type");
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
		map.put("imgurl1", request.getParameter("imgurl1"));
		map.put("remark", request.getParameter("remark"));
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
	//招聘管理
	@Autowired
	TmentsDao tmentsDao;
	@RequestMapping(value = "/m_tments")
	public ModelAndView tments_List(@RequestParam(value = "pageNo") String page) {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, Object>> tmentsList=tmentsDao.selectTments(page, pageSize);
		String recordCount=tmentsDao.getTmentsCount();
		mav.addObject("pageSize", pageSize);
		mav.addObject("recordCount", recordCount);
		mav.addObject("tmentsList", tmentsList);
		mav.setViewName("manage/tmentsList");
		return mav;

	}
	@RequestMapping(value = "/m_tmentsEdit")
	public ModelAndView newsTments(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/tmentsEdit");
		mav.addObject("id", id);
		HashMap<String,Object> tments=new HashMap<String, Object>();
		tments.put("xh", 0);
		if (id.equals("-1") ==false) {
			tments=tmentsDao.selectOneTment(id);
		}
		mav.addObject("tments",tments);
		return mav;

	}
	@RequestMapping(value = "/m_tmentsSave")
	public String tmentsSave(@RequestParam(value = "id") String id,
			HttpServletRequest request) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("title", request.getParameter("title"));
		map.put("xh", request.getParameter("xh")==null?0:request.getParameter("xh"));
		map.put("content", request.getParameter("content"));
		map.put("id", id);
		if (id.equals("-1") ) {
			//insert
			tmentsDao.insertTment(map);
			
		} else {
			if (request.getParameter("del") == null) {
				tmentsDao.updateTment(map);
			} else {
				tmentsDao.deleteTment(id);
			}
			
		}
		return "redirect:/m_tments.shtml?pageNo=1";
	}
	//验证码
	@RequestMapping(value = "/m_vc")
	public void vc(HttpServletRequest request, HttpServletResponse response)
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
