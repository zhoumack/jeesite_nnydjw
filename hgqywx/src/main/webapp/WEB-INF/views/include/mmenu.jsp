<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<!-- mmenu -->
<link type="text/css" rel="stylesheet" href="${ctxStatic}/mmenu/css/jquery.mmenu.all.css" />
<%-- <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script> --%>
<script type="text/javascript" src="${ctxStatic}/mmenu/js/jquery.mmenu.all.js"></script>
<style>
.mm-navbar__breadcrumbs{
	text-overflow: clip;
}
/* .mm-wrapper_opening .mm-menu_offcanvas.mm-menu_opened ~.mm-slideout {
	-webkit-transform: translate3d(-100vw, 0, 0);
	transform: translate3d(-100vw, 0, 0);
} */
.mm-menu_position-bottom{
	height: 100vh;
}

nav#menu {
	width: 100%;
}

#mmenu_page{
	display: none;
}

.popup_icon {
	width: 30px;
	height: 30px;
	position: relative;
	left: 18px;
	top: 7px;
}

.mm-listitem__text{
	padding-left: 30px !important;
}
</style>
<script type="text/javascript">
	var html_gen = "";
	var api = null;
	$(document).ready(function() {
		$.getJSON("${ctx}/sys/office/treejson", {}, function(data) {
			console.log(data);
			getTree(data);
			$("#panel-menu").html(html_gen);

			$('nav#menu').mmenu({
				extensions: ["position-bottom"],
				counters: true,
				searchfield: {
					placeholder: '搜索'
				},

				navbars: [{
					content: ['searchfield']
				}, {
					content: ['prev', 'breadcrumbs', 'close']
				}]
			},{
				navbars: {
					breadcrumbs: {
						removeFirst	: true
					}
				}
			});
			api = $("nav#menu").data( "mmenu" );
		});
	});
	
	function resetData(url){
		$.getJSON(url, {}, function(data) {
		 	html_gen = "";
			getTree(data);
			$("#panel-menu").html(html_gen);
			api.initPanels( $("#panel-menu") );

		     
		});
	}
	//
	//获取当前部门下的所有人员
	function resData(){
		$.getJSON('${ctx}/sys/office/officetreejson', {}, function(data) {
		 	html_gen = "";
			getTree(data);
			$("#panel-menu").html(html_gen);
			api.initPanels( $("#panel-menu") );
		});
	}
	
	function getTree(treeData) {
		html_gen += "<ul>";
		getHtml(treeData);
		html_gen += "</ul>";
	}

	function getHtml(treeData) {
		for(var j in treeData) {
			if(treeData[j].children) {
				//console.log("0:"+j);
				html_gen += '<li><img class="popup_icon" src="${ctxStatic}/images/zu@2x.png"><span>' + treeData[j].name + '</span><ul>';
				getHtml(treeData[j].children);
				html_gen += '</ul></li>';
			}else {
				//console.log("1:"+j);
				var dataImg = "${ctxStatic}/images/tx@2x.png";
				if(treeData[j].photo){
					dataImg = treeData[j].photo;
			}
				html_gen += '<li><img class="popup_icon" src="'+dataImg+'">';
				html_gen += '<a href="#" onclick="sel_pop(this)" dataType="'+treeData[j].type+'" dataId="'+treeData[j].id+'" dataImg="'+dataImg+'" dataName="'+treeData[j].name+'">' + treeData[j].name + '</a></li>';
			}
		}
	}

	
	//人员点击
	function sel_pop(ele) {
		var dataId = $(ele).attr('dataId');
		var dataType = $(ele).attr('dataType');
		var dataImg = $(ele).attr('dataImg');
		var dataName = $(ele).attr('dataName');
		
		if(typeof(add_spr)=="function"){
			if(!add_spr(dataId,dataType,dataImg,dataName)){
				return;
			}
		}
		
		$(".mm-btn_close").click();
		/* api.closeAllPanels($("menu")) */
	}
</script>
<body>
	<div id="mmenu_page">
		<nav id="menu" style="z-index: 99999">
			<div id="panel-menu">
				<ul>
					<li><a href="#/">Home</a></li>
					<li><span>拉纳许多</span>
						<ul>
							<li><a href="#/">History</a></li>
							<li><span>The team</span>
								<ul>
									<li><a href="#/">Management</a></li>
									<li><a href="#/">Sales</a></li>
									<li><a href="#/">Development</a></li>
								</ul></li>
							<li><a href="#/">Our address</a></li>
						</ul></li>
					<li><a href="#/">Contact</a></li>
				</ul>
			</div>
		</nav>
	</div>

</body>
</html>