<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/classes/mq/utils/Tag/page1.tld" prefix="w"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${types.title}</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery1.42.min.js"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
		<script type="text/javascript">
			$(function($) {
				setTitleMenu(2);
			});
		</script>
	</head>

	<body>
		<!--top-->
		<%@ include file="sitehead.jsp"%>
  <div class="clear_both"></div>
		<div class="about_banner"><img src="img/about_banenr.jpg"/></div>
		<div class="noticeB">
		</div>
        <div class="about">
        	<div class="about_left">
            	<div class="left_top">
            		<div class="title">品牌业务<span>/ Products</span></div>
                    	<div class="left_nav">
                			<ul>
                            	<li class="to"><a href="#">智能门禁</a></li>
                            	<li><a href="#">智慧社区</a></li>
                                <li><a href="#">节能产品与服务</a></li>
                                <li><a href="#">3D人脸识别</a></li>
                                <li><a href="#">碳纤维供暖系统</a></li>
                    		</ul>
                    	</div>
                </div>
                <div class="service">
                	<div class="title"></div>
                    <div class="service_kf">
                    	<p>客服1：00000000</p>
                        <p>客服2：11111111</p>
                        <p>客服3：22222222</p>
                        <p>客服4：33333333</p>
                    </div>
                </div>
            </div>
            <div class="about_right">
            	<div class="title">智能门禁<span>/ Products</span></div>
                <div class="right_nr">
                	<div class="Products_by">
                    	<p>启动安全便捷新生活</p>
                        <p>米润【智能门神】各项功能设计均立足于人性化，想你所想，为您的生活提供360°的保驾护航。</p>
                        <p>安全+便捷，我就是米润生活私享家。</p>
                    </div>
                    <div class="products_lb">
                    	<ul>
                        	<li>
                            	<p class="products_pic"><a href="#"><img src="img/products_pic01.jpg" /></a></p>
                                <p class="products_mz"><a href="#">标配版</a></p>
                            </li>
                            <li>
                            	<p class="products_pic"><a href="#"><img src="img/products_pic01.jpg" /></a></p>
                                <p class="products_mz"><a href="#">经济版</a></p>
                            </li>
                            <li>
                            	<p class="products_pic"><a href="#"><img src="img/products_pic01.jpg" /></a></p>
                                <p class="products_mz"><a href="#">豪华版</a></p>
                            </li>
                            <li>
                            	<p class="products_pic"><a href="#"><img src="img/products_pic01.jpg" /></a></p>
                                <p class="products_mz"><a href="#">锁体款式</a></p>
                            </li>
                            <li>
                            	<p class="products_pic"><a href="#"><img src="img/products_pic01.jpg" /></a></p>
                                <p class="products_mz"><a href="#">门禁款式</a></p>
                            </li>
                        </ul>
                    </div>
                 </div>
                </div>
            </div>
        </div>
	</div>
		<%@ include file="sitefoot.jsp"%>