<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<script type="text/javascript"
	src="<%=basepath%>/js/utils.js"></script>	
</head>
<body>
	<div id='content' class='container'>
		<form role="form" id="newsForm" method="post" action="m_baseInfoSave.shtml">
			<input type="hidden" name="id" value="${id}">
			<div class="form-group">
				<label for="name" class="col-sm-2">代码</label>
				<div class="col-sm-10">
					<b>${baseInfo.code}</b>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2">含义</label>
				<div class="col-sm-10">
					<b>${baseInfo.remark}</b>
				</div>
			</div>
			<div class="form-group">
				<label for="value" class="col-sm-2">内容</label>
				<div class="col-sm-10">
					<textarea rows="20" class="form-control" style="width: 500px;"
						name="value" id="value">${baseInfo.value}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="xh" class="col-sm-2">排序</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="xh"
						name="xh" style="width: 400px;" value="${baseInfo.xh}">
				</div>
			</div>
			
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" onclick="saveNews();" class="btn btn-default">保存</button>
					<button type="button" onclick="history.go(-1);" class="btn btn-default" >返回</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		saveNews = function() {
			
			if(CheckINT($("#xh").val())==false){
				artDialog.tips("序号必须是正整数");
				return;
			}
			
			$("#newsForm").submit();
		};
		
	</script>
</body>
</html>