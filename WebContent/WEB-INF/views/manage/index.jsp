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
<title>后台管理</title>
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
				<h2 class="text-center">后台管理</h2>

			</div>
			<div class='span1' style="margin-top: 10px;">
				<button type="button" class="btn btn-danger" onclick="window.location.href='m_logout.shtml'">注销</button>
			</div>
		</div>
		<div class="row-fluid">
			<div class='span2'>

				<ul id="myTab" class="nav nav-pills nav-stacked" role="tablist">
					<li role="presentation" class="active"><a href="#"
						link="m_type.shtml?type=1">新闻分类</a></li>
					<li role="presentation" ><a href="#"
						link="m_news.shtml?pageNo=1&type=-1">新闻</a></li>
					<li role="presentation" ><a href="#"
						link="m_type.shtml?type=2">产品分类</a></li>
                    <li role="presentation" ><a href="#"
						link="m_products.shtml?pageNo=1&type=-1">产品</a></li>
					<li role="presentation" ><a href="#"
						link="m_tments.shtml?pageNo=1">招聘信息</a></li>								
					<li role="presentation" ><a href="#"
						link="m_serviceInfo.shtml">客服信息</a></li>
					<li role="presentation" ><a href="#"
						link="m_baseInfo.shtml">其他</a></li>	
						<li role="presentation" ><a href="#"
						link="m_changepwd.shtml">修改密码</a></li>							
				</ul>

			</div>
			<div class='span10'>
				<iframe id="bodyIframe" width="100%" frameborder="0"></iframe>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function($) {
			$("#bodyIframe").attr("height", window.screen.height - 200);
			$("#bodyIframe").attr("src", $("#myTab .active a").attr("link"));
			$('#myTab a').click(function(e) {
				e.preventDefault();
				$(this).tab('show');

				$("#bodyIframe").attr("src", $(this).attr("link"));
			});

		});
	</script>
</body>
</html>