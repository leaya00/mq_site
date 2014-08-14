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
<title>新闻管理</title>
<script type="text/javascript" src="<%=basepath%>/js/jquery.js"></script>
<link href="<%=basepath%>/js/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=basepath%>/js/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basepath%>/js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript"
	src="<%=basepath%>/js/ckeditor/ckeditor.js"></script>
<script src="<%=basepath%>/js/ckeditor/config.js" type="text/javascript"></script>

<script type="text/javascript"
	src="<%=basepath%>/js/utils.js"></script>	
</head>
<body>
	<div id='content' class='container'>
		<form role="form" id="newsForm" method="post" action="m_newsSave.shtml">
			<input type="hidden" name="id" value="${id}">
			<div class="form-group">
				<label for="title" class="col-sm-2">分类</label>
				<div class="col-sm-10">
					<select class="form-control" id="type" name="type">
						<c:forEach items="${typeList}" var="types">
							<option value="${types.id}" <c:if test="${news.type==types.id}">selected</c:if>>${types.title}</option>
						</c:forEach>
						
					</select>
					
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2">标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title"
						style="width: 500px;" value="${news.title}">
				</div>
			</div>
			<div class="form-group">
				<label for="author" class="col-sm-2">新闻来源</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="author" name="author"
						style="width: 400px;" value="${news.author}">
				</div>
			</div>
			<div class="form-group">
				<label for="newsorder" class="col-sm-2">排序</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="newsorder"
						name="newsorder" style="width: 400px;" value="${news.newsorder}">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2">内容</label>
				<div class="col-sm-10">
					<textarea rows="20" class="form-control" style="width: 500px;"
						name="content" id="mycontent">${news.content}</textarea>
					<script>
					
						CKEDITOR
								.replace(
										'mycontent',
										{
											toolbar:"Define",
											language : 'zh-cn',
											image_previewText : ' ',
											filebrowserUploadUrl : 'ckUploadImage.shtml?type=1'
										});
					</script>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" onclick="saveNews();" class="btn btn-default">保存</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		saveNews = function() {
			
			if($("#title").val()==""){
				art.dialog("标题必须填写", {});
				return;
			}
			if(CheckINT($("#newsorder").val())==false){
				art.dialog("序号必须是正整数", {});
				return;
			}
			if(CKEDITOR.instances.mycontent.getData()==""){
				art.dialog("内容必须填写", {});
				return;
			}
			$("#newsForm").submit();
		};
		
	</script>
</body>
</html>