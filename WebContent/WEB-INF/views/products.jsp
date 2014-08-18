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
                				<c:forEach items="${typeList}" var="navType">
                            		<li <c:if test="${navType.id==types.id}">class="to"</c:if> >
                            		<a href="productsList.shtml?type=${navType.id}&pageNo=1">${navType.title}</a></li>
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
            	<div class="title">${types.title}<span>/ Products</span></div>
                <div class="right_nr">
                	<div class="Products_by">
                    	${types.remark }
                    </div>
                    <div class="products_lb">
                    	<ul>
                    		<c:forEach items="${productsList }" var="products">
                    			<li>
                            	<p class="products_pic"><a href="#"><img src="${products.imgurl2}" /></a></p>
                                <p class="products_mz"><a href="#">${products.title }</a></p>
                           	 </li>
                    		</c:forEach>
                        	
                           
                        </ul>
                    </div>
                 </div>
                </div>
            </div>
        </div>
	</div>
		<%@ include file="sitefoot.jsp"%>