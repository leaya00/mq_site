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
			action="m_typeSave.shtml">
			<input type="hidden" name="id" value="${id}"> <input
				type="hidden" name="type" value="${type}">
			<div class="form-group">
				<label for="title" class="col-sm-2">标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title"
						style="width: 500px;" value="${types.title}">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					排序<input type="text" class="form-control" id="xh" name="xh"
						style="width: 50px;" value="${types.xh}"> 缩略图地址<input
						type="text" name="imgurl1" id="imgurl1" style="width: 350px;"
						class="form-control" value="${types.imgurl1}">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2">分类描述</label>
				<div class="col-sm-10">
					<textarea rows="20" class="form-control" style="width: 500px;"
						name="remark" id="mycontent">${types.remark}</textarea>
					<script>
						CKEDITOR.replace('mycontent', {
							toolbar : "Define",
							language : 'zh-cn',
							image_previewText : ' ',
							filebrowserUploadUrl : 'ckUploadImage.shtml?type=99'
						});
					</script>
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
		<form action="uploadThumbnail.shtml?w=233&h=137" enctype="multipart/form-data"
			method="post" target="uploadTarget">
			<label>缩略图</label> <img id="uploadThumbnail_img"
				src="${types.imgurl1}"> <input type="file" name="upload"><input
				type="submit" value="上传">
		</form>
		<script type="text/javascript">
			uploadImageCallFunction = function(url, message) {
				if (message == "") {
					$("#uploadThumbnail_img").attr("src", url);
					$("#imgurl1").val(url);
				} else {
					alert(message);
				}
			};
		</script>
		<iframe style="display: none;" name='uploadTarget'></iframe>
	</div>
	<script type="text/javascript">
		saveNews = function() {

			if ($("#title").val() == "") {
				art.dialog("标题必须填写", {});
				return;
			}
			if (CheckINT($("#xh").val()) == false) {
				art.dialog("序号必须是正整数", {});
				return;
			}

			$("#newsForm").submit();
		};
	</script>
</body>
</html>