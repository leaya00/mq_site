﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>重庆米润科技有限公司</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery1.42.min.js"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
		<script type="text/javascript">
			$(function($) {
				setTitleMenu(3);
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
            		<div class="title">新闻资讯<span>/ News</span></div>
                    	<div class="left_nav">
                			<ul>
                				<c:forEach items="${typeList}" var="navType">
                            		<li <c:if test="${navType.id==types.id}">class="to"</c:if> >
                            		<a href="newsList.shtml?type=${navType.id}&pageNo=1">${navType.title}</a></li>
                            	</c:forEach>
                    		</ul>
                    	</div>
                </div>
                <div class="news_xq">
                	<div class="title">${types.title}</div>
                    <div class="left_news">
                    	<ul>
                    		<c:forEach items="${top5List}" var="top5">
                    			<li><a href="news.shtml?id=${top5.id}">${top5.title }</a></li>
                    		</c:forEach>
                        	
                            
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
            	<div class="title">${types.title}<span>/ news</span></div>
                <div class="right_nr">
                	<div class="news_details">
                    	<h2>${news.title}</h2>
                        <div class="news_message">
                        	<span class="skim"><em>${news.author}</em></span>
							<span class="date"><em><fmt:formatDate value="${news.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></em></span>
                        </div>
                        ${news.content}
                    </div>
                    <div class="tment_fanye">
                   		<ul>
                   			<c:if test="${!empty preNews}">
                   				<li class="tment_shang"><a href="news.shtml?id=${preNews.id }">上一篇：${preNews.title}</a></li>
                   			</c:if>
                        	<c:if test="${!empty nextNews}">
                   				<li class="tment_xia"><a href="news.shtml?id=${nextNews.id }">下一篇：${nextNews.title}</a></li>
                   			</c:if>
                        </ul>
                   </div>
                </div>
            </div>
        </div>
	</div>
	<%@ include file="sitefoot.jsp"%>
