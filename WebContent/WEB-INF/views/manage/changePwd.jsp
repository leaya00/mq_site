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
<script type="text/javascript"
	src="<%=basepath%>/js/ckeditor/ckeditor.js"></script>
<script src="<%=basepath%>/js/ckeditor/config.js" type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basepath%>/js/artDialog/artDialog.js?skin=default"></script>


<script type="text/javascript" src="<%=basepath%>/js/utils.js"></script>
</head>
<body>
	<div id='content' class='container'>
		<form role="form" id="newsForm" method="post"
			action="m_changepwd_v.shtml">
			<input type="hidden"  value="admin" name="username">
			<div class="form-group">
				<label for="title" class="col-sm-2">旧密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd1" name="pwd1"
						style="width: 500px;">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2">新密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd2" name="pwd2"
						style="width: 500px;">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2">重复新密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd3" name="pwd3"
						style="width: 500px;">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" onclick="saveNews();" class="btn btn-default">保存</button>
					${msg }
				</div>
			</div>
		</form>

	</div>
	<script type="text/javascript">
		saveNews = function() {

			if ($("#pwd1").val() == "") {
				art.dialog("旧密码必须填写", {});
				return;
			}
			if ($("#pwd2").val() == "") {
				art.dialog("新密码必须填写", {});
				return;
			}
			if ($("#pwd2").val() != $("#pwd2").val() ) {
				art.dialog("新密码填写不一致", {});
				return;
			}

			$("#newsForm").submit();
		};
	</script>
</body>
</html>