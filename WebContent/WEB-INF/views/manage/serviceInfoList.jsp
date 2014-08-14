<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String basepath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%=basepath%>/js/jquery.js"></script>
<link href="<%=basepath%>/js/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=basepath%>/js/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="<%=basepath%>/js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basepath%>/js/utils.js"></script>	
</head>
<body>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td width="10%">ID</td>
				<td width="30%">客服名称</td>
				<td width="30%">电话</td>				
				<td width="10%">排序</td>
				<td width="20%">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${serviceInfoList}" var="serviceInfo">
			<tr>
				<td>${serviceInfo.id}</td>
				<td>${serviceInfo.name}</td>				
				<td>${serviceInfo.telphone}</td>
				<td>${serviceInfo.xh}</td>
				<td><button type="button" class="btn btn-info" onclick="delInfo(${serviceInfo.id});">删除</button>
					<button type="button" class="btn btn-info" onclick="editInfo(${serviceInfo.id});">编辑</button></td>
			</tr>
			</c:forEach>
			
		</tbody>
		
	</table>
	<button type="button" class="btn btn-info" onclick="editInfo(-1);">新建</button>
	<script type="text/javascript">
		editInfo=function(id){
			window.location.href="m_serviceInfoEdit.shtml?id="+id;
		};
		delInfo=function(id){
			artDialog.confirm("xxxx",function(){alert(1)});
		}
	</script>
</body>
</html>