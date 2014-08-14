<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/classes/mq/utils/Tag/page1.tld" prefix="w"%>
<%
	String basepath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻管理</title>
<script type="text/javascript" src="<%=basepath%>/js/jquery.js"></script>
<link href="<%=basepath%>/js/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=basepath%>/js/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<select class="form-control" id="type" name="type" onchange="filterType($(this).val())">
		<option value="-1" <c:if test="${type==types.id}">selected</c:if>>--全部显示--</option>
		<c:forEach items="${typeList}" var="types">
			<option value="${types.id}"
				<c:if test="${type==types.id}">selected</c:if>>${types.title}</option>
		</c:forEach>

	</select>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td width="10%">ID</td>
				<td width="40%">标题</td>
				<td width="20%">创建时间</td>
				<td width="10%">排序</td>
				<td width="20%">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${newsList}" var="news">
				<tr>
					<td>${news.id}</td>
					<td><a target="_blank" href="news.shtml?id=${news.id}">${news.title}</a></td>
					<td><fmt:formatDate value="${news.createtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${news.newsorder}</td>
					<td><button type="button" class="btn btn-info">删除</button>
						<button type="button" class="btn btn-info"
							onclick="editNews(${news.id});">编辑</button></td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><w:page pageSize="${pageSize}"
						url="m_news.shtml?type=${type}" recordCount="${recordCount}" /></td>
			</tr>
		</tfoot>
	</table>
	<button type="button" class="btn btn-info" onclick="editNews(-1);">新建</button>
	<script type="text/javascript">
		editNews=function(id){
			window.location.href="m_newsEdit.shtml?type=${type}&id="+id;
		};
		filterType=function(type){
			window.location.href="m_news.shtml?pageNo=1&type="+type;
		};
	</script>
</body>
</html>