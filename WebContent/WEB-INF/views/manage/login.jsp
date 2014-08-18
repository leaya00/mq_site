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
<title>后台登录</title>
<script type="text/javascript" src="<%=basepath%>/js/jquery.js"></script>
<link href="<%=basepath%>/js/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=basepath%>/js/bootstrap/js/bootstrap.js"></script>

<style type='text/css'>
</style>

</head>
<body>
	<div id='content' class='container-fluid'>
		<div class="row-fluid">
			<div class='span11'>
				<h2 class="text-center">后台登录</h2>

			</div>

		</div>
		<div class="row">
			<form action="">
				<table style="margin: auto">
					<tr>
						<td>用户名</td>
						<td><input name="username"></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input name="password"></td>
					</tr>
					<tr>
						<td>验证码</td>
						<td><input name="vaildateCode"><a href="#"><img
							onclick="clickImg(this);" alt="" src="test4.shtml"></a></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;"><input
							type="button" value="登录"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		clickImg = function(me) {
			$(me).attr("src", "test4.shtml?t=" + new Date().getTime());
		};
		$(function($) {

		});
	</script>
</body>
</html>