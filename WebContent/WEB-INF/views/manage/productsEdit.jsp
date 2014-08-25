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
			action="m_productsSave.shtml">
			<input type="hidden" name="id" value="${id}">
			<div class="form-group">
				<label for="title" class="col-sm-2">分类</label>
				<div class="col-sm-10">
					<select class="form-control" id="type" name="type">
						<c:forEach items="${typeList}" var="types">
							<option value="${types.id}"
								<c:if test="${products.type==types.id}">selected</c:if>>${types.title}</option>
						</c:forEach>

					</select>

				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2">标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title"
						style="width: 500px;" value="${products.title}">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					排序<input type="text" class="form-control" id="xh" name="xh"
						style="width: 50px;" value="${products.xh}">
					&nbsp;&nbsp;&nbsp;&nbsp;顶置首页&nbsp;&nbsp;是<input type="radio"
						name="isindextop" value="1"
						<c:if test="${ products.isindextop==1}">checked="checked"</c:if>>
					否<input type="radio" name="isindextop" value="0"
						<c:if test="${ products.isindextop!=1}">checked="checked"</c:if>>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					缩略图78*78地址<input type="text" name="imgurl1" id="imgurl1"
						style="width: 350px;" class="form-control"
						value="${products.imgurl1}">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					缩略图194*142地址<input type="text" name="imgurl2" id="imgurl2"
						style="width: 350px;" class="form-control"
						value="${products.imgurl2}">
				</div>
			</div>
			<div class="form-group">
				<label for="remark" class="col-sm-2">产品简介</label>
				<div class="col-sm-10">
					<textarea rows="10" class="form-control" style="width: 500px;"
						name="remark" id="mycontent">${products.remark}</textarea>
					<script>
						/*CKEDITOR.replace('mycontent', {
							toolbar : "Define",
							language : 'zh-cn',
							image_previewText : ' ',
							filebrowserUploadUrl : 'ckUploadImage.shtml?type=2'
						});*/
					</script>
				</div>
			</div>
			<div class="form-group">
				<label for="remark" class="col-sm-2">产品正文</label>
				<div class="col-sm-10">
					<textarea rows="20" class="form-control" style="width: 500px;"
						name="detailcontent" id="detailcontent">${products.detailcontent}</textarea>
					<script>
						
						CKEDITOR.replace('detailcontent', {
							toolbar : "Definepb",
							language : 'zh-cn',
							image_previewText : ' ',
							filebrowserUploadUrl : 'ckUploadImage.shtml?type=2'
						});
					</script>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" onclick="saveNews();" class="btn btn-default">保存</button>
					<button type="button"
						onclick='window.location.href="m_products.shtml?pageNo=1&type=${products.type}";'
						class="btn btn-default">返回</button>
				</div>
			</div>
		</form>
		<form
			action="uploadThumbnail.shtml?w=78&h=78&fun=uploadImageCallFunction1"
			enctype="multipart/form-data" method="post" target="uploadTarget">
			<label>缩略图78*78</label> <img id="uploadThumbnail_img1"
				src="${products.imgurl1}"> <input type="file" name="upload"><input
				type="submit" value="上传">
		</form>
		<form
			action="uploadThumbnail.shtml?w=194&h=142&fun=uploadImageCallFunction2"
			enctype="multipart/form-data" method="post" target="uploadTarget">
			<label>缩略图194*142</label> <img id="uploadThumbnail_img2"
				src="${products.imgurl2}"> <input type="file" name="upload"><input
				type="submit" value="上传">
		</form>
		<script type="text/javascript">
			uploadImageCallFunction1 = function(url, message) {
				if (message == "") {
					$("#uploadThumbnail_img1").attr("src", url);
					$("#imgurl1").val(url);
				} else {
					alert(message);
				}
			};
			uploadImageCallFunction2 = function(url, message) {
				if (message == "") {
					$("#uploadThumbnail_img2").attr("src", url);
					$("#imgurl2").val(url);
				} else {
					alert(message);
				}
			};
		</script>
		<iframe style="display: none;" name='uploadTarget'></iframe>
		详细信息
		<table class="table table-bordered" style="display: none;">
			<thead>
				<tr>
					<td width="10%">ID</td>
					<td width="10%">页码</td>
					<td width="10%">顺序号</td>
					<td width="20%">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productdetailList }" var="productdetail"
					varStatus="xx">
					<tr>
						<td>${productdetail.id}</td>
						<td>第${xx.index+1}页</td>
						<td>${productdetail.xh }</td>
						<td><button type="button" class="btn btn-info"
								onclick="delInfo(${productdetail.id});">删除</button>
							<button type="button" class="btn btn-info"
								onclick="editInfo(${productdetail.id});">编辑</button></td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
		<c:choose>
			<c:when test="${id!=-1}">
				<button type="button" class="btn btn-info" onclick="editInfo(-1);" style="display: none;">新建页码</button>
			</c:when>
			<c:otherwise>
				<b style="display: none;">产品基本信息保存后才能新增详细信息</b>
			</c:otherwise>
		</c:choose>

	</div>
	<script type="text/javascript">
		editInfo=function(id){
			window.location.href="m_productdetailEdit.shtml?type=${products.type}&productid=${id}&id="+id;
		};
		delInfo=function(id){
			artDialog.confirm("是否删除id为"+id+"的数据",function(){
				window.location.href="m_productdetailSave.shtml?type=${products.type}&productid=${id}&del=1&id="+id;
			});
		};
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