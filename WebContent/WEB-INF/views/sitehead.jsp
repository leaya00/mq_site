<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	setTitleMenu = function(index) {
		$(".main_menu li").removeClass().eq(index).addClass("on");
	};
	getInfo = function() {
		$.ajax({
			type : "POST",
			url : "otherinfo.shtml?p=Favorite",

			success : function(msg) {
				$("#favoriteLink").attr(
						"href",
						"javascript:window.external.AddFavorite('" + msg.value
								+ "','" + msg.remark1 + "')");
			}
		});
	};
	$(function($) {
		getInfo();
	});
</script>
<div class="topW">
	<div class="top">
		<div class="logo">
			<a href="#"> 米润科技 </a>
		</div>
		<div class="menu">
			<div class="topMenu">
				<ul>
					<li><a target="_blank" href="m_login.shtml"> 会员中心 </a></li>
					<li><a id="favoriteLink"
						href="javascript:window.external.AddFavorite('xxx','yyyy')">
							加入收藏 </a></li>
				</ul>
			</div>
			<div class="main_menu">
				<ul>
					<li><a href=""> 网站首页 </a></li>
					<li><a href="other.shtml?p=page_about"> 公司概况 </a></li>
					<li><a href="productsList.shtml?pageNo=1"> 品牌业务 </a></li>
					<li class="on"><a href="newsList.shtml?pageNo=1"> 新闻资讯 </a></li>
					<li><a href="mentsList.shtml?pageNo=1"> 加入米润 </a></li>
					<li class="endli"><a href="contact.shtml"> 联系我们 </a></li>
				</ul>
			</div>
		</div>
	</div>
</div>