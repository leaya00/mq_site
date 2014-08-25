<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/classes/mq/utils/Tag/page1.tld" prefix="w"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${about.remark }</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery1.42.min.js"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	$(function($) {
		setTitleMenu(1);
	});
</script>
	</head>

	<body>
		<!--top-->
		<%@ include file="sitehead.jsp"%>
		<div class="about_banner"><img src="img/about_banenr.jpg"/></div>
		<div class="noticeB">
		</div>
        <div class="about">
        	<div class="about_left">
            	<div class="left_top">
            		<div class="title">${about.remark }<span>/ ${about.remark1 }</span></div>
                    	<div class="left_nav">
                			<ul>
                				
                    			<li <c:if test="${about.code==\"page_about\" }">class="to"</c:if>><a href="other.shtml?p=page_about">公司概况</a></li>
                                <li <c:if test="${about.code==\"page_dszzc\" }">class="to"</c:if>><a href="other.shtml?p=page_dszzc">董事长致辞</a></li>
                            	<li <c:if test="${about.code==\"page_organ\" }">class="to"</c:if>><a href="other.shtml?p=page_organ">组织结构</a></li>
                            	<li <c:if test="${about.code==\"page_gyzz\" }">class="to"</c:if>><a href="other.shtml?p=page_gyzz">荣誉与资质</a></li>
                            	<li <c:if test="${about.code==\"page_wwln\" }">class="to"</c:if>><a href="other.shtml?p=page_wwln">文化理念</a></li>
                            	<li <c:if test="${about.code==\"page_hxjzg\" }">class="to"</c:if>><a href="other.shtml?p=page_hxjzg">核心价值观</a></li>
                            	<li <c:if test="${about.code==\"page_gsxcp\" }">class="to"</c:if>><a href="other.shtml?p=page_gsxcp">公司宣传片</a></li>
                            	<!-- li <c:if test="${about.code==\"page_qyzzry\" }">class="to"</c:if>><a href="other.shtml?p=page_qyzzry">企业资质荣誉</a></li> -->
                            	<li <c:if test="${about.code==\"page_tzmr\" }">class="to"</c:if>><a href="other.shtml?p=page_tzmr">投资米润</a></li>
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
                    <div class="service_kf">
                    	<p>热线：${hot_telphone.value}</p>
                        <p>邮箱：${hot_email.value }</p>
                        <p>联系人：${ hot_linkman.value}</p>
                    </div>
                </div>
            </div>
            <div class="about_right">
            	<div class="title">${about.remark }<span>/ ${about.remark1 }</span></div>
                <div class="right_nr">
                	<div class="about_js">
                		${about.value }
                    </div>
                    <div class="aoubt_right_img"><img src="img/about_right_img.jpg" width="732" height="113" /></div>
                </div>
            </div>
        </div>
	</div>


		<%@ include file="sitefoot.jsp"%>