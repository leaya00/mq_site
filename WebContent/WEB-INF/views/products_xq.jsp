<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/classes/mq/utils/Tag/page1.tld" prefix="w"%>
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
				setTitleMenu(2);
			});
		</script>
	</head>

	<body>
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
                	<div class="Products_bt">${products.title }</div>
                    <div class="products_zt">
                    	${productdetail.content}
                    </div>
<!--分页-->
        <div class="msearch_fenye">
          <table width="654" style="" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" height="32" valign="middle"><table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><w:page pageSize="${pageSize }"
						url="products.shtml?id=6?type=${type}" recordCount="${recordCount}" />
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
        </div>
	</div>
	

		<%@ include file="sitefoot.jsp"%>