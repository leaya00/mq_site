<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/classes/mq/utils/Tag/page1.tld" prefix="w"%>
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
                                <li><a href="other.shtml?p=page_about">了解米润</a></li>
                            	<li><a href="contact.shtml">联系我们</a></li>
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
            	<div class="title">加入米润<span>/Recruitment</span></div>
                <div class="right_nr">
                	<div class="news_ny">
                    	<ul>
                    		<c:forEach items="${tmentsList}" var="tments">
                    			<li><a  href="tments.shtml?id=${tments.id}">${tments.title}</a></li>
                    		</c:forEach>
                        	
                            
                        </ul>
                    </div>
                </div>
<!--分页-->
        <div class="msearch_fenye">
          <table width="654" style="" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" height="32" valign="middle"><table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
						<w:page pageSize="${pageSize}"
						url="newsList.shtml?type=${type}" recordCount="${recordCount}" />
					</td>
                  </tr>
                </table></td>
            </tr>
          </table>
        </div>
<!--分页 end-->
                
            </div>
        </div>
	</div>
		<%@ include file="sitefoot.jsp"%>