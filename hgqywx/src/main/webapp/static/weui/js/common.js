/**
 * 一些公共的js封装
 */
/*function getcslist(ctx,ctxStatic){
	 选择抄送人 
	$(document).on("click", "#rclick", function() {
		var nid = $(this).children("span").text();
		var name = $(this).children("p").text();
		var p =$('<span id="'+nid+'" name="username" style="padding: 10px">' + name + '<img id="deimg" src="'+ctxStatic+'"  onclick="del()" width="15px" height="15px" style="position: absolute;"/></span>');
		if(!$('#tid').children('span[id='+nid+']').text()){
			$("#tid").append(p);
			$.closePopup("#half"); 
		}
		else{
			$.alert("您已经添加了！");
		}
	});
	$("#half").popup();
	//选择人员json数据
	var vue = new Vue({
	        el: '#app',
	        data: {
	            list:[]
	        }
	   });
		var url=ctx+"/sys/office/treejson";
	   	$.ajax({
            type: "get", 
            url: url,
            async: false,
            success : function(data){ 
               vue.list = data;
//               console.log(data);
            }
    	});
	  //人员列表伸缩
		$(document).on("click", "#item1", function() { 
	    	$(this).parent().find(".nav-second").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
	    });
	    $(document).on("click", "#item2", function() { 
	    	$(this).parent().find(".nav-three").slideToggle(500);
		    $(this).children("i").toggleClass("unfold");
	    });
	    $(document).on("click", "#item3", function() { 
	    	$(this).parent().find(".nav-four").slideToggle(500);
		    $(this).children("i").toggleClass("unfold");
	    });
	        
 	$(document).on("click", "#aaa", function() {
        $.closePopup("#half");
//	        $.toast("绑定成功!",1000); 
    });		
}
function del (){
	  $("#tid span").eq($(this).index()).remove();
}*/
/*function getjson(ctx) {
	var demo = new Vue({
		el: '#demo',
		data: {
			treeData: [] 
		}
	});
	var url=ctx+"/sys/office/treejson"
	$.ajax({
		type: "get",
		url: url,
		async: false,
		success: function(data) {
			 
			demo.treeData = data[0];
			demo.cdata = data[0].children
			
		},
		error: function(){
			$.toptip('加载失败', 'error');
		}
	});
}*/
function getcslist(ctx,imgurl,flag){
		
	var demo = new Vue({
		el: '#demo',
		data: {
			treeData: [] 
		}
	});
	var url=ctx+"/sys/office/treejson"
	$.ajax({
		type: "get",
		url: url,
		async: false,
		success: function(data) {
			 
			demo.treeData = data[0];
			demo.cdata = data[0].children
			
		},
		error: function(){
			$.toptip('加载失败', 'error');
		}
	});
	
		//人员选择数据循环
    	Vue.component('item', {
				template: '#item-template',
				props: {
					model: Object
				},
				data: function() {
					return {
						open: false
					}
				},
				computed: {
					isFolder: function() {
						return this.model.children &&this.model.children.length
					}
				},
				methods: {
					toggle: function(flag) {
						if(this.isFolder) {
							this.open = !this.open;
						}
						else{
							var a =this.$options;
							var b =a.propsData;
							var c =b.model;
							var name =c.name;
							var nid = c.id;
							var p =$('<span id="'+nid+'" name="username" style="padding: 10px">' + name + '<img id="deimg" src="'+imgurl+'"  onclick="del()" width="15px" height="15px" style="position: absolute;"/></span>');
							if(!$('#tid').children('span[id='+nid+']').text()){
								$("#tid").append(p);
								$.closePopup("#half"); 
							}
							else{
								$.toast("不能重复添加", "text");
							}
						}
					},
					changeType: function() {
						if(!this.isFolder) {
							Vue.set(this.model, 'children', [])
							this.addChild()
							this.open = true
						}
					},
				}
			})
			
		//弹出界面
    	/*$(document).on("click", "#abc", function() { 
		       $("#half").popup();
	    });*/
	    
	    
};
//关闭弹出界面
$(document).on("click", "#aaa", function() {
    $.closePopup("#half");
});
//删除选择人员
function del (){
  $("#tid span").eq($(this).index()).remove();
}