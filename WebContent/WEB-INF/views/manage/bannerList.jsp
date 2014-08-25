<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script type="text/javascript"
	src="<%=basepath%>/js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basepath%>/js/utils.js"></script>
</head>
<body>
	<table class="table table-bordered" style="table-layout:fixed">
		<thead>
			<tr>
				<td width="30%">ID</td>
				<td width="30%">图片</td>
				<td width="30%">序号</td>
				
				<td width="20%">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bannerList}" var="banner">
				<tr>
					<td>${banner.id}</td>
					<td><img alt="" src=" ${banner.src}"></td>
					<td>${banner.xh}</td>
					<td><button type="button" class="btn btn-info" 
							onclick="delInfo(${banner.id});">删除</button>
						<button type="button" class="btn btn-info"
							onclick="editInfo(${banner.id});">编辑</button></td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
	<button type="button" class="btn btn-info" onclick="editInfo(-1);" >新建</button>
	<script type="text/javascript">
		editInfo=function(id){
			window.location.href="m_bannerEdit.shtml?id="+id;
		};
		delInfo=function(id){
			artDialog.confirm("是否删除id为"+id+"的数据",function(){
				window.location.href="m_bannerSave.shtml?del=1&id="+id;
			});
		};
	</script>
</body>
</html>