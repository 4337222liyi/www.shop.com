<!DOCTYPE html>
<html>
<head>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jsp/framework/common/taglibs.jsp"%>
<%@ taglib uri="/tld/base.tld" prefix="app"%>

<title><fmt:message key="ui.title" /></title>
<style>
/**设置页面 布局 */
.page-content {
    background-color: #fff;
    position: relative;
    margin: 0;
    padding:3px 0px 0px 3px;
}
.tab-content{
padding:0px 12px;
margin:0px;
}
</style>
</head>
<body class="no-skin">

	<div class="main-container" id="main-container">
				<div class="page-content">
						<div class="col-xs-12">
					    	<div class="tabbable">
								 <ul id="myTab" class="nav nav-tabs">
								 	<!-- 
								   <li >
								      <a href="#home"  onclick="getHref(this)" data-toggle="tab">项目基本信息</a>
								   </li>
								    -->
								   <li class="active">
								      <a href="#profile" onclick="getHref(this)" data-toggle="tab">基坑信息</a>
								   </li>
								   <!--  
								    <li>
								      <a href="#messages" onclick="getHref(this)" data-toggle="tab">用户共享设置</a>
								   </li>
								   -->
								    <li>
								      <a href="#dixiashuiqk" onclick="getHref(this)" data-toggle="tab">地下水情况</a>
								   </li>
								    <li>
								      <a href="#dizhiqk" onclick="getHref(this)" data-toggle="tab">地质情况</a>
								   </li>
								   <li >
								      <a id="fjsc" href="#dropdown1" onclick="getHref(this)" data-toggle="tab">项目附件</a>
								   </li>
								   </ul>
								<!-- class padding-24 -->
								 <div class="tab-content ">
								   <div class="tab-pane " id="home">
								    
								   </div>
								   <div class="tab-pane in active" id="profile">
								      
								   </div>
								   <div class="tab-pane" id="messages">
								    
								   </div>
								   <div class="tab-pane" id="dixiashuiqk">
								    
								   </div>
								   <div class="tab-pane" id="dizhiqk">
								    
								  </div>
								  
								  <div id="dropdown1" class="tab-pane ">
								    
								  </div>
							    </div>
								  
							 </div>
							</div>
						</div>
					</div>
			</div>
	
		<div id="jldwUser-input" class="modal"></div>

<%@ include file="/jsp/framework/common/basic_scripts.jsp"%>
		
<script type="text/javascript">
var contentpath = "${pageContext.request.contextPath }";
var scripts =[null];
ace.load_ajax_scripts(scripts, function() {
	$("#profile").load("jsp/business/setup/project-jkxinxi-edity.jsp");

	$('.ajax-loading-overlay').remove();
});

function getHref(obj){
	if (obj.href.indexOf("#home") != -1) {
		$("#profile").html("");
		$("#messages").html("");
		$("#dixiashuiqk").html("");
		$("#dizhiqk").html("");
		$("#dropdown1").html("");
		$("#home").load("jsp/business/setup/project-xinxi-update.jsp");
	} else if (obj.href.indexOf("#profile") != -1) {
		$("#home").html("");
		$("#messages").html("");
		$("#dixiashuiqk").html("");
		$("#dizhiqk").html("");
		$("#dropdown1").html("");
		$("#profile").load("jsp/business/setup/project-jkxinxi-edity.jsp");
	} else if (obj.href.indexOf("#messages") != -1) {
		$("#profile").html("");
		$("#home").html("");
		$("#dixiashuiqk").html("");
		$("#dizhiqk").html("");
		$("#dropdown1").html("");
		$("#messages").load("jsp/business/setup/projectUser.jsp");
	} else if(obj.href.indexOf("#dixiashuiqk") != -1){
	    $("#profile").html("");
		$("#home").html("");
		$("#messages").html("");
		$("#dizhiqk").html("");
		$("#dropdown1").html("");
		$("#dixiashuiqk").load("jsp/business/setup/dxsqkwh-index.jsp");
	} else if(obj.href.indexOf("#dizhiqk") != -1){
	    $("#profile").html("");
		$("#home").html("");
		$("#messages").html("");
		$("#dixiashuiqk").html("");
		$("#dropdown1").html("");
		$("#dizhiqk").load("jsp/business/setup/dizhiqkwh-index.jsp");
	} else if(obj.href.indexOf("#dropdown1") != -1){
	    $("#profile").html("");
		$("#home").html("");
		$("#messages").html("");
		$("#dixiashuiqk").html("");
		$("#dizhiqk").html("");
		$("#dropdown1").load("jsp/business/setup/xmwj/project-fileupload-index.jsp");
	   
	}
	
} 
</script>
	<form id="gdzxtformid" method="post" >
		<input type="hidden" name="gdzxt_gcid" id="gdzxt_gcid" >
	</form>
</body>
</html>