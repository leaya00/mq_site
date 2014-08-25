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
	src="<%=basepath%>/js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript"
	src="<%=basepath%>/js/ckeditor/ckeditor.js"></script>
<script src="<%=basepath%>/js/ckeditor/config.js" type="text/javascript"></script>

<script type="text/javascript" src="<%=basepath%>/js/utils.js"></script>
</head>
<body>
	<div id='content' class='container'>
		<form role="form" id="newsForm" method="post"
			action="m_bannerSave.shtml">
			<input type="hidden" name="id" value="${id}">
			<div class="form-group">
				<label for="name" class="col-sm-2">链接</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="href" name="href"
						style="width: 500px;" value="${banner.href}">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2">图片地址</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="src" name="src"
						style="width: 500px;" value="${banner.src}">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2">序号</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="xh" name="xh"
						style="width: 500px;" value="${banner.xh}">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" onclick="saveNews();" class="btn btn-default">保存</button>
					<button type="button" onclick="history.go(-1);"
						class="btn btn-default">返回</button>
				</div>
			</div>
		</form>
	
	<form action="UploadImage.shtml?type=99"
		enctype="multipart/form-data" method="post" target="uploadTarget">
		<label>广告图</label>  <input type="file" name="upload"><input
			type="submit" value="上传">
			<br/>
			<img id="uploadThumbnail_img" style="width:300px;height: 100px;"
			src="${banner.src}">
	</form>
	</div>
	<script type="text/javascript">
		uploadImageCallFunction = function(url, message) {
			if (message == "") {
				$("#uploadThumbnail_img").attr("src", url);
				$("#src").val(url);
			} else {
				alert(message);
			}
		};
	</script>
	<iframe style="display: none;" name='uploadTarget'></iframe>

	<script type="text/javascript">
		saveNews = function() {
			if (CheckINT($("#xh").val()) == false) {
				art.dialog("序号必须是正整数", {});
				return;
			}
			$("#newsForm").submit();
		};
	</script>
</body>
</html>