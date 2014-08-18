<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>加入米润</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery1.42.min.js"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
		<script type="text/javascript">
			$(function($) {
				setTitleMenu(4);
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
            		<div class="title">加入米润<span>/ Recruitment</span></div>
                    	<div class="left_nav">
                			<ul>
                            	<li class="to"><a href="mentsList.shtml?pageNo=1">米润招聘</a></li>
                            	<!-- <li><a href="#">投资米润</a></li> -->
                                <li><a href="#">了解米润</a></li>
                            	<li><a href="#">联系我们</a></li>
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
            	<div class="title">加入米润<span>/ Recruitment</span></div>
                <div class="right_nr">
                	<div class="tment_title">${tments.title }</div>
                    ${tments.content }
                   <div class="tment_fanye">
                   		<ul>
                   				<c:if test="${!empty pretments}">
                   				<li class="tment_shang"><a href="tments.shtml?id=${pretments.id }">上一职位：${pretments.title}</a></li>
                   			</c:if>
                        	<c:if test="${!empty nextments}">
                   				<li class="tment_xia"><a href="tments.shtml?id=${nextments.id }">下一职位：${nextments.title}</a></li>
                   			</c:if>
                        </ul>
                   </div>
                 </div>
                </div>
            </div>
        </div>
	</div>


	<%@ include file="sitefoot.jsp"%>
