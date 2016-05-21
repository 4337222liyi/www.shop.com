<!DOCTYPE html>
<html>
<head>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jsp/framework/common/taglibs.jsp"%>
<%@ taglib uri="/tld/base.tld" prefix="app"%>

<title><fmt:message key="ui.title" /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jkjc-btnStyle.css" type="text/css"></link>
</head>
<body >
	<div class="main-container" id="main-container">
			<div class="page-content" id="inside">
		    <!-- form 开始 位置 -->
					<form class="form-inline"  id="queryForm03" width="100%"
					   role="form" style="border:solid 1px #ddd;height:50px;line-height:50px;vertical-align:middle;">
						 <input id="PROJECT_UID" type="hidden" name="t.PROJECT_UID" fieldname="t.PROJECT_UID" operation="="/> 
						 <input id="CONTACT_TYPE" type="hidden" name="t.CONTACT_TYPE" fieldname="t.CONTACT_TYPE" operation="=" value="JS"/> 
						 <!-- 是否为抢修单位  Y 是 -->
						  <input id="REPAIR_Y" type="hidden" name="REPAIR_Y" fieldname="REPAIR_Y" operation="=" value="Y"/> 
						<div class="form-group">
						  <span id="getSelect" style="font-size:15px;line-height: 50px;">&nbsp;抢修单位联系方式</span>
						  <input id="ClickType" type="hidden" value=""/>
						</div>
						<div style="float: right;">
							 <div   class="form-group" >
								<a data-target="" id="new03Add" data-toggle="modal">
									<button id="btnAdd03" class="btn btn-link btn-sm" type="button"><i class="ace-icon glyphicon glyphicon-plus"></i><span style="font-family:'Microsoft YaHei';font-size:15px;color:#4e4c4c;">添加</span></button>
								</a>
							 </div>
							 &nbsp; 
							<!--  <button class="btn btn-white btn-default btn-round"><i class="ace-icon fa fa-times red2"></i>删除</button> -->
							 <div class="form-group" >
								<a data-target="" id="new03Del" data-toggle="modal">
									<button id="btnDel03" class="btn btn-link btn-sm" type="button"><i class="ace-icon glyphicon glyphicon-remove red bigger-110"></i><span style="font-family:'Microsoft YaHei';font-size:15px;color:#4e4c4c;">删除</span></button>
								</a>
							 </div> 
							 &nbsp;
							<div class="form-group">
							  <input class="searchContent form-control" style="width: 150px;" name="" fieldname="PERSON_NAME" id="" operation="like" logic="and">
							  <button id="searchBox03" class="btn btn-link btn-sm" onKeyDown="reSearch()" type="button">
									<i class="#ace-icon glyphicon   bigger-110"></i><span style="font-family:'Microsoft YaHei';font-size:15px;color:#4e4c4c;">查询</span>
							  </button>
							</div>
						</div>
					</form>
				   <form id="dataCheckBox03">
				      <!-- 当前 选择的 checkbox -->
				       <input class="hidden" id="strUid03" type="hidden" fieldname="PERSON_INFO_UID"/>
				    </form>
					    <table   sortname="PERSON_INFO_UID" multiselect=false  rownum="1000000" sortorder="asc"  class=""  id="grid_table03" 
									action="${ctx}/JcPerson/jcPersonInfoController?queryCondition" >
							<tr>
							     <th name="PERSON_INFO_UID" formatter="formatEdit" width="1" align="center">选择</th>
							    <!--  <th name="CONTACT_TYPE"  width="2" align="center" formatter="formatter">分类标签</th> -->
								<th name="PERSON_NAME"  width="2" align="center">联系人</th>
								<th name="PERSON_POST"  width="2" align="center">职务</th>
								<th name="COMPANY_NAME" width="2" align="center" >公司</th>
								<th name="PERSON_MOBILE" width="2" align="center" >联系电话</th>
								<th name="PERSON_INFO_UID" width="1" align="center" formatter="doUpdate" >编辑</th>
							</tr> 
						</table> 
						<script type="text/javascript">
							var $path_base = "/";//this will be used in gritter alerts containing images
						</script>
				</div>
			</div>
		 <div id="jsjc-qxdwlxfs-input" class="modal"></div>

<%@ include file="/jsp/framework/common/basic_scripts.jsp"%>
    <script
		src="${pageContext.request.contextPath }/assets/js/jquery-ui.custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/sys_resources/js/common/Form2Json.js"> </script>
<script type="text/javascript">
var controlletname="${pageContext.request.contextPath }/JcPerson/jcPersonInfoController";
var scripts =[null];
var gridwidth;
var setHeight;
ace.load_ajax_scripts(scripts, function() {
	init();
	//默认点击 首行 模拟点击应急预案
    $("#firstTR").addClass("new03Class");
	var xmUid = $("#project_uid").val();
	$("#PROJECT_UID").val(xmUid);
	
	gridwidth=$("#inside").width();
	//gridwidth -=250;
	//设置 放置 表格的 div的宽度
	//$("#tbDiv").css("width",gridwidth);
	JqgridManage.initJqgrid(grid_table03,queryForm03,gridwidth); 
	setHeight = $(window).height();
	
	if(navigator.userAgent.indexOf("Firefox") > -1){
	   setHeight = setHeight+50;
	}
	
	 $("#grid_table03").setGridHeight(setHeight - 320); 
});

//enter键
function reSearch(){
$("#searchBox03").click(function(){
	  jQuery("#grid_table03").jqGrid().trigger("reloadGrid");
	}); 
	
}
function init(){	
    //查询按钮 (报表)
	$("#searchBox03").click(function(){
	  jQuery("#grid_table03").jqGrid().trigger("reloadGrid");
	}); 
	
	
	$('#btnAdd03').click(function() {
	$('#new03Add').attr("data-target","jsjc-qxdwlxfs-input");
		$('#jsjc-qxdwlxfs-input').removeData("bs.modal");
		$("#jsjc-qxdwlxfs-input").empty();
		$('#jsjc-qxdwlxfs-input').modal({
			backdrop: 'static'
		});
       
		$.get("${ctx}/jsp/business/jsjc/jsjc-fzrllfs-add.jsp?PROJECT_UID="+$("#project_uid").val(),function(data) {
			$("#jsjc-qxdwlxfs-input").empty();
			$("#jsjc-qxdwlxfs-input").html("");
			$("#jsjc-qxdwlxfs-input").html(data);
		});
	
	});
	
	//删除 
	$('#btnDel03').click(function (){
		//获取 选择的列
		   var v="";
		   $("#grid_table03 input:checkbox[name='PERSON_INFO_UID']:checked").each(function() {
				v += $(this).val() + "," ;
			});
			if (v.length != 0) {
			v = v.substring(0, v.length - 1);
			}
		  $("#strUid03").val(v);
		  if($("#strUid03").val() !="" ){
			bootbox.confirm("确认删除吗？", function(result) {
				if(result){
				    var data = Form2Json.formToJSON(dataCheckBox03);
					//组成保存json串格式
					var data1 = defaultJson.packSaveJson(data);
					$.ajax({
						url : controlletname+"?delete",
						cache : false,
						async :	false,
						data : data1,
						dataType : "json",  
						type : 'post',
						success : function(response) {
							if(response!="" && response !=null){
								xAlert("信息提示","删除成功！");
							   $("#searchBox03").click();
							}else{
								xAlert("信息提示","删除失败，请联系管理员！");
							}
						}
					});
					
				}else{
					return;
				}
			});	
			
			}else{ //说明 没有 选择 任何数据（复选框没有选择）
				xAlert("信息提示","请选择要删除的行！");
			  return;
			}
		});

	

}

//选择 按钮 
function formatEdit(cellvalue, opts, rowObject){
	var jceid = rowObject.PERSON_INFO_UID;
	var showHtml ="<div class='hidden-sm hidden-xs action-buttons' id='getValue'>";			        	
		showHtml +="<input id=\"jcEuid"+jceid+"\" type=\"checkbox\" name=\"PERSON_INFO_UID\" value =\""+jceid+"\" ";
		showHtml +="</div>";
	return 	showHtml;	
	
}

//操作
function doUpdate(cellvalue, opts, rowObject){
	var pid = rowObject.PERSON_INFO_UID;
	var showHtml ="<div class='hidden-sm hidden-xs action-buttons'>";			        	
		showHtml +="<a class=\"blue\" title=\"查看\" data-target=\"content_view\"  href=\"javascript:void(0);\"" ;
		showHtml +=	" onclick=\"eidtPerson('"+pid+"');\">";
		showHtml +="<span class=\"glyphicon glyphicon-edit bigger-110\"></i>";
		showHtml +="</a> &nbsp;";
	        	
	return 	showHtml;
}

function eidtPerson(pid){

	$('#new03Add').attr("data-target","jsjc-qxdwlxfs-input");
		$('#jsjc-qxdwlxfs-input').removeData("bs.modal");
		$("#jsjc-qxdwlxfs-input").empty();
		$('#jsjc-qxdwlxfs-input').modal({
			backdrop: 'static'
		});
       
		$.get("${ctx}/jsp/business/jsjc/jsjc-fzrllfs-edit.jsp?PROJECT_UID="+$("#project_uid").val()+"&JCUID="+pid,function(data) {
			$("#jsjc-qxdwlxfs-input").empty();
			$("#jsjc-qxdwlxfs-input").html("");
			$("#jsjc-qxdwlxfs-input").html(data);
		});
	

}





</script>
	<form id="gdzxtformid" method="post" >
		<input type="hidden" name="gdzxt_gcid" id="gdzxt_gcid" >
	</form>
</body>
</html>