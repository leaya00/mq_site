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
<script type="text/javascript"
	src="<%=basepath%>/js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basepath%>/js/utils.js"></script>	
</head>
<body>
	
	<table class="table table-bordered">
		<thead>
			<tr>
				<td width="10%">ID</td>
				<td width="40%">标题</td>
				<td width="10%">排序</td>
				<td width="20%">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${tmentsList}" var="tments">
				<tr>
					<td>${tments.id}</td>
					<td><a target="_blank" href="tments.shtml?id=${tments.id}">${tments.title}</a></td>
					
					<td>${tments.xh}</td>
					<td><button type="button" class="btn btn-info"
						onclick="delInfo(${tments.id});">删除</button>
						<button type="button" class="btn btn-info"
							onclick="editInfo(${tments.id});">编辑</button></td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="4"><w:page pageSize="${pageSize}"
						url="m_news.shtml" recordCount="${recordCount}" /></td>
			</tr>
		</tfoot>
	</table>
	<button type="button" class="btn btn-info" onclick="editInfo(-1);">新建</button>
	<script type="text/javascript">
		editInfo=function(id){
			window.location.href="m_tmentsEdit.shtml?type=${type}&id="+id;
		};
		delInfo=function(id){
			artDialog.confirm("是否删除id为"+id+"的数据",function(){
				window.location.href="m_tmentsSave.shtml?del=1&id="+id;
			});
		};
		
	</script>
</body>
</html>