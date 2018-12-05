<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap Form Builder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/lib/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
    <!-- constom -->
    <script type="text/javascript" src="constom/js/public.js"></script>
    
    <!-- end constom -->
    <script src="assets/js/lib/bootstrap.js" ></script>
  </head>

  <body>
    <a href="https://github.com/minikomi/Bootstrap-Form-Builder/"><img style="z-index: 100000; position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png" alt="Fork me on GitHub"></a>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">Bootstrap Form Builder</a>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row clearfix">
        <!-- Building Form. -->
        <div class="span6">
          <div class="clearfix">
            <h2>Your Form</h2>
            <hr>
            <div id="build">
              <form id="target" class="form-horizontal">
              </form>
            </div>
          </div>
        </div>
        <!-- / Building Form. -->

        <!-- Components -->
        <div class="span6">
          <h2>Drag & Drop components</h2>
          <hr>
          <div class="tabbable">
            <ul class="nav nav-tabs" id="formtabs">
              <!-- Tab nav -->
            </ul>
            <form class="form-horizontal" id="components">
              <fieldset>
                <div class="tab-content">
                  <!-- Tabs of snippets go here -->
                </div>
              </fieldset>
            </form>
          </div>
        </div>
        <!-- / Components -->
                
        <!-- 保存表单的表单 -->
        <div class="span12">
	        <form action="${ctx}/form/sysForm/save" id="saveform">
	            <div class="control-group">
					<label class="control-label">表单标识：</label>
					<div class="controls">
						<input id="formDef" name="formDef"  maxlength="30" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">表单自定义JS脚本：</label>
					<div class="controls">
						<textarea id="formScript" name="formScript"  rows="4" maxlength="255" class="input-xxlarge " ></textarea>
					</div>
				</div>
	            <div class="control-group">
					<label class="control-label">备注信息：</label>
					<div class="controls">
						<textarea id="remarks" name="remarks"  rows="4" maxlength="255" class="input-xxlarge " ></textarea>
					</div>
				</div>
				<input type="hidden" id="formid" name="id" value="${param.id}" />
				<input type="hidden" id="formname" name="name" /><!-- id name 不一样是避免冲突 -->
				<input type="hidden" id="formJsonObject" name="formJsonObject" />
				<input type="hidden" id="formRendered" name="formRendered" />
				<div class="control-group">
					<shiro:hasPermission name="form:sysForm:edit">
						<div class="controls">
						    <input id="btnSubmit" class="btn btn-primary" type="button" value="保 存"/>&nbsp;
						</div>
					</shiro:hasPermission>
				</div>
				
	        </form>
        </div>
        <!-- 保存表单的表单 完 -->
      </div>
      <input type="hidden" id="getDataUrl" value="${ctx}/form/sysForm/getData" /><!-- 查询表单地址 -->
    </div> <!-- /container -->
    <script type="text/javascript">
        //提交保存按钮
        $("body").on("click","#btnSubmit",function(){
        	$("#formRendered").val($("#render").val()); //画好的表单
        	$("#formname").val($("legend:first").text()); //表单名
        	var form_action = $("#saveform").attr("action");
        	$.post(form_action,$("#saveform").serialize(),function(data){
        		
        		alert("保存成功!");
        		console.log(data);
        	});
        });
        //修改获取修改前数据
        var formid = $("#formid").val();
        if (formid) {
          $.get($("#getDataUrl").val(),{id:formid},function(data){
    		console.log(data);
    		if (data.code == 200) {
    			$("#formJsonObject").val(data.data.formJsonObject);
    			
    			$("#formDef").val(data.data.formDef);
    			$("#formScript").val(data.data.formScript);
    			$("#remarks").val(data.data.remarks);
			}
    	  });
		}

    </script>
    <script data-main="assets/js/main.js" src="assets/js/lib/require.js" ></script>
  </body>
</html>
