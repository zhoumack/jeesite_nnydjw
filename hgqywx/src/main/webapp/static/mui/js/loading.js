$(function(){
	//自定义加载框
	/*var spinner_css = '<style>.spinner_div {width: 80px;height: 80px;line-height: 80px;background-color: black;opacity: 0.5;border-radius: 7px;position: fixed;top: 0;left: 0;right: 0;bottom: 0;margin: auto;text-align: center;z-index: 1000;padding-top: 15px;} .spinner_text {font-size: 12px;position: relative;top: -15px;color: white;}</style>';
	var spinner_div = '<div id="spinner_div" class="spinner_div mui-hidden"><span class="mui-spinner"></span><div class="spinner_text">加载中...</div></div>';
	$("body").append(spinner_css + spinner_div);*/
	//jquery ajax全局设置
	$.ajaxSetup({
		type: 'post',
		dataType: 'json',
		cache: false,
		//		timeout: 10000,
		beforeSend: function() {
			//数据出来前显示等待加载框
			$.showLoading();
			/*$("#spinner_div").removeClass('mui-hidden');*/
		},
		error: function(xhr, type) {
			var str = '';
			if(type == 'timeout') {
				str = '网络超时' + xhr.status;
			} else if(type == 'error') {
				str = 'error错误' + xhr.status;
			} else {
				str = '未知错误' + xhr.status;
			}
			console.log("【" + xhr.status + "】: " + JSON.stringify(this));
			mui.toast(str);
		},
		complete: function(xhr, status) {
			//数据渲染完毕，关闭加载框
			setTimeout(function() {
				$.hideLoading();
				/*$("#spinner_div").addClass('mui-hidden');*/
			}, 150);
		}
	});
});