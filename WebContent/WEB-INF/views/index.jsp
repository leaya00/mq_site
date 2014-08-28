<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>重庆米润科技有限公司欢迎您</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery1.42.min.js"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
		<script type="text/javascript">
			$(function($) {
				setTitleMenu(0);
			});
		</script>
	</head>

	<body>
		<!--top-->
		<%@ include file="sitehead.jsp"%>
		<div class="fullSlide">
			<div class="bd">
				<ul>
					<c:forEach items="${bannerList }" var="banner">
						<li _src="url(${banner.src})" style="background:#66b6e5 center 0 no-repeat;">
						<a  href="${banner.href}"></a>
					</li>
					</c:forEach>
					
				</ul>
			</div>

			<div class="hd">
				<ul></ul>
			</div>
			
		</div>
		<div class="noticeW">
			<div class="notice">
				<span class="notice_title">最新动态</span>
				<div class="txtScroll-top">
					<div class="bd">
						<ul class="infoList">
							<c:forEach items="${newsScrollList }" var="newsScroll">
								<li><span class="date">
									<fmt:formatDate value="${newsScroll.createtime}"	pattern="yyyy-MM-dd" />
								</span>
								<a href="news.shtml?id=${newsScroll.id}" >${newsScroll.title }</a></li>
							</c:forEach>
						
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="anliW">
			<div class="manli" style="margin:0 auto">
				<div class="bd">
					<a href="javascript:void(0)" class="prev"></a>
					<a href="javascript:void(0)" class="next"></a>
					<div class="scrollWrap">
							<ul class="picList">
									<c:forEach items="${productsIndexTop }" var="pindextop">
									<li>
										<h3><a  href="products.shtml?pageNo=1&id=${pindextop.id}">${pindextop.title }</a></h3>
										<div class="left_text">${pindextop.remark }</div>
										<div class="right_img">
											<a  href="products.shtml?pageNo=1&id=${pindextop.id}"><img src="${pindextop.imgurl1 }"/></a>
											<a  href="products.shtml?pageNo=1&id=${pindextop.id}" class="more">查看详细</a>
										</div>
								   </li>
									</c:forEach>
									
							</ul>
					</div>
				</div>
		</div>
	</div>
		<div class="yewu">
			<div class="title">
				<div class="left">产品中心<span>The main brand business</span></div>
				<a href="productsList.shtml?pageNo=1">查看更多</a>
			</div>
			<ul id="yewuUl">
				<c:forEach items="${yewuList }" var="yewu" varStatus="yewuStatus">
					<li  <c:if test="${yewuStatus.last}">class="endli"</c:if>>
					<div id="yewu0${yewuStatus.index+1}" class="myewu">
					<img src="${yewu.imgurl1}"/>
					<a href="productsList.shtml?type=${yewu.id}&pageNo=1"><span>查看详细</span></a>
					</div><div class="shuoming"><h3>${yewu.title}</h3><p>${yewu.remark}</p></div></li>
				</c:forEach>
				
				
			</ul>
		</div>
		<div class="news_jianjie">
			<div class="news">
				<div class="title">
					<div class="left">新闻中心<span>NEWS</span></div>
				</div>
				<div class="news_hot">
					<a href="#" class="img"><img src="${news_top1.imgurl1 }"/></a>
					<div class="zaiyao">
						<a class="mtitle"   href="news.shtml?id=${news_top1.id}">${news_top1.title }</a>
						${news_top1.content}
					</div>
				</div>
				<ul class="list">
					<c:forEach items="${news_hotList }" var="news_hot">
					<li><a   href="news.shtml?id=${news_hot.id}">${news_hot.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="jianjie">
				<div class="title">重庆米润科技有限公司</div>
				<div class="biaoyu">${index_about_biaoyu.value }</div>
				<div class="jianjie_text">
					${index_about.value }
					
				</div>
			</div>
		</div>
		<%@ include file="sitefoot.jsp"%>