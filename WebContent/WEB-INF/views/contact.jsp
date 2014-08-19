<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/classes/mq/utils/Tag/page1.tld" prefix="w"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>联系我们</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	$(function($) {
		setTitleMenu(5);
	});
</script>
</head>

<body>
	<!--top-->
	<%@ include file="sitehead.jsp"%>
	<div class="clear_both"></div>
	<div class="about_banner">
		<img src="img/about_banenr.jpg" />
	</div>
	<div class="noticeB"></div>
	<div class="about">
		<div class="about_left">
			<div class="left_top">
				<div class="title">
					联系我们<span>/ Contact us</span>
				</div>
				<div class="left_nav">
					<ul>
						<li><a href="about.shtml">公司概况</a></li>
						<li><a href="productsList.shtml?pageNo=1">品牌业务</a></li>
						<li><a href="newsList.shtml?pageNo=1">新闻资讯</a></li>
						<li><a href="mentsList.shtml?pageNo=1">加入米润</a></li>
						<li class="to"><a href="#">联系我们</a></li>
					</ul>
				</div>
			</div>
			<div class="service">
				<div class="title"></div>
				<div class="service_kf">
					<c:forEach items="${serviceInfoList }" var="serviceInfo">
                    		<p>${serviceInfo.name}：${serviceInfo.telphone}</p>
                    	</c:forEach>
				</div>
			</div>
		</div>
		<div class="about_right">
			<div class="title">
				联系我们<span>/ Contact us</span>
			</div>
			<div class="right_nr">
				<div class="contact">
					<p>重庆市江北区</p>
					<p>热 线：${hot_telphone.value}</p>
					<p>邮 箱：${hot_email.value }</p>
					<p>联系人：${ hot_linkman.value}</p>
				</div>
				<div class="ditu">
					<img src="img/ditu.jpg" width="719" height="323" />
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<%@ include file="sitefoot.jsp"%>