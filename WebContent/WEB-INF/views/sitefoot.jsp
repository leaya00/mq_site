<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="footerW">
			<div class="footer">
				<div class="footerlogo"><a href=""></a></div>
				<div class="banquan">
					<p>Copyright © 2013-2014 www.mirun.com Rights Reserved</p>
					<p>重庆米润科技有限公司 保留一切权利 客服热线：400-8008810，023-9999292</p>
					<p>渝ICP备93420394号 技术支持：<a href="http://www.mfanweb.com" target="_blank">梦帆互动</a></p>
				</div>
				<div class="fenxiang">
					<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" charset="utf-8">
	window.onload=function(){
		var oyewuUl=document.getElementById("yewuUl");
		if(oyewuUl==null){
			return;
		}
		var oyewuLi=oyewuUl.getElementsByTagName('li');
		var num=0;
		
		for(var i=0;i<oyewuLi.length;i++){
				oyewuLi[i].index=i;
				oyewuLi[i].onmouseover=function(){
					num=this.index;
					var oDiv=oyewuLi[num].getElementsByTagName('div')[0];
					var oA=oDiv.getElementsByTagName('a')[0];
					oA.style.display='block';
					this.style.cursor='pointer';
				}
				oyewuLi[i].onmouseout=function(){
					num=this.index;
					var oDiv=oyewuLi[num].getElementsByTagName('div')[0];
					var oA=oDiv.getElementsByTagName('a')[0];
					oA.style.display='none';
				}
		}
	}	
	</script>
	<script type="text/javascript">
			jQuery(".fullSlide").slide({
				titCell : ".hd ul",
				mainCell : ".bd ul",
				effect : "fold",
				autoPlay : true,
				autoPage : true,
				trigger : "click",
				startFun : function(i) {
					var curLi = jQuery(".fullSlide .bd li").eq(i);
					/* 当前大图的li */
					if (!!curLi.attr("_src")) {
						curLi.css("background-image", curLi.attr("_src")).removeAttr("_src") /* 将_src地址赋予li背景，然后删除_src */
					}
				}
			});
			jQuery(".txtScroll-top").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true});
			jQuery(".manli").slide({ mainCell:".picList", effect:"left",vis:3, scroll:1, autoPage:true});
			
			
		</script>
</html>