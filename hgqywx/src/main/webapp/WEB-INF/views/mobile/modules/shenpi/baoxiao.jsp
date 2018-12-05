<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>报销</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/style.css">
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>报销</p>
	</div>
	<!--内容区-->
	<div class="weui-cells weui-cells_form">
  		<div class="weui-cell">
		    <div class="weui-cell__hd"><label class="weui-label">申请人</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" type="text"  placeholder="请输入">
		  	</div>
	    </div>
	    <div class="weui-cell">
		    <div class="weui-cell__hd"><label class="weui-label">报销类型</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" type="text" name="type" value="${baoxiao.type }"  id='baoxiao' placeholder="请输入">
		  	</div>
	    </div>
    </div>
    <div class="weui-cells__title">报销明细</div>
	<div class="weui-cells weui-cells_form">
	  	<div class="weui-cell">
		  	<div class="weui-cell__hd"><label class="weui-label">费用类型</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" type="text"  id='feiyong' placeholder="请输入">
		  	</div>
	  	</div>
	  	<div class="weui-cell">
		    <div class="weui-cell__hd"><label for="" class="weui-label">发生时间</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" id="fasheng" type="text" placeholder="请选择">
		    </div>
	    </div>
	    <div class="weui-cell">
		    <div class="weui-cell__hd"><label class="weui-label">费用金额</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" type="number"  placeholder="请输入">
		  	</div>
	    </div>
	    <div class="weui-cell">
		    <div class="weui-cell__hd"><label class="weui-label">大写</label></div>
		    <div class="weui-cell__bd">
		     <input class="weui-input" type="text"  placeholder="请输入">
		  	</div>
	    </div>
	    <div class="weui-cells__title">费用说明</div>
		<div class="weui-cells weui-cells_form">
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      <textarea class="weui-textarea" id="weui-textarea"  placeholder="请输入内容"></textarea>
		      <div class="weui-textarea-counter"></div>
		    </div>
		  </div>
		</div>
		<div class="weui-cell">
            <div class="weui-cell__bd">
                <div class="weui-uploader">
                    <div class="weui-uploader__hd">
                        <p class="weui-uploader__title">附件</p>
                    </div>
                    <div class="weui-uploader__bd">
                        <ul class="weui-uploader__files" id="uploaderFiles">
                        </ul>
                        <div class="weui-uploader__input-box">
                            <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<a href="xuanzetuisongren.html" class="weui-media-box weui-media-box_appmsg weui-cells">
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title">审批人</h4>
        <p class="weui-media-box__desc">
        	<span>
        		<img src="${ctxStatic}/weui/img/touxiang.jpg" width="50px" height="50px"/>
        	</span>
        	<img src="${ctxStatic}/weui/img/tianjia.png" width="70px" height="70px"/>
        </p>
      </div>
    </a>
    <a href="xuanzetuisongren.html" class="weui-media-box weui-media-box_appmsg weui-cells">
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title">抄送人</h4>
        <p class="weui-media-box__desc">
        	<span>
        		<img src="${ctxStatic}/weui/img/touxiang.jpg" width="50px" height="50px"/>
        	</span>
        	<img src="${ctxStatic}/weui/img/tianjia.png" width="70px" height="70px"/>
        </p>
      </div>
    </a>
    <a href="tongzhi.html" id="btn_div" >
     	<button id="btn" type="submit">提交</button>
    </a>
    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
    <script type="text/javascript">
		    window.onload = function(){
				var fasheng =document.getElementById("fasheng");
				set(fasheng);
			};
			function set(obj){
					$(obj).datetimePicker({
		    times: function () {},
		    onChange: function (picker, values, displayValues) {
		      console.log(values);
		    },
		  });
			};
			$(function(){
			$("#baoxiao").picker({
		        title: "选择报销类型",
		        toolbarCloseText:'确定',
		        cols: [
		          {
		            textAlign: 'center',
		            values: ['差旅费','交通费','招待费','其他'],
		          }
		        ]
		    });
		    $("#feiyong").picker({
		        title: "选择费用类型",
		        toolbarCloseText:'确定',
		        cols: [
		          {
		            textAlign: 'center',
		            values: ['飞机票','火车票','的士费','住宿费','餐饮费','礼品费','通讯费','其他'],
		          }
		        ]
		    });
		});
    </script>
</body>
</html>