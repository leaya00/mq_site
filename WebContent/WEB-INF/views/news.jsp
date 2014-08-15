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
            	<div class="title">${types.title}<span>/News</span></div>
                <div class="right_nr">
                	<div class="news_ny">
                    	<ul>
                    		<c:forEach items="${newsList}" var="news">
                    			<li><a target="_blank" href="news.shtml?id=${news.id}">${news.title}</a></li>
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