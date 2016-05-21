<!DOCTYPE html>
<html>
<head>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jsp/framework/common/taglibs.jsp"%>
<%@ taglib uri="/tld/base.tld" prefix="app"%>

<title><fmt:message key="ui.title" /></title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jkjc-btnStyle.css" type="text/css"></link>
<style>
</style>
</head>
<body >
	<div class="main-container" id="main-container">
			<div class="page-content" id="inside">
		    <!-- form 开始 位置 -->
					<form class="form-inline"  id="queryForm02" width="100%"
					   role="form" style="border:solid 1px #ddd;height:50px;line-height:50px;vertical-align:middle;">
						 <input id="PROJECT_UID" type="hidden" name="t.PROJECT_UID" fieldname="t.PROJECT_UID" operation="="/> 
						
						<div class="form-group">
						  <span id="getSelect" style="font-size:15px;line-height: 50px;">&nbsp;仓库备品</span>
						  <input id="ClickType" type="hidden" value=""/>
						</div>
						<div style="float: right;">
							 <div id="btnAddDiv"  class="form-group" >
								<a data-target="" id="newAdd" data-toggle="modal">
									<button id="btnAdd" class="btn btn-link btn-sm" type="button"><i class="ace-icon glyphicon glyphicon-plus"></i><span style="font-family:'Microsoft YaHei';font-size:15px;color:#4e4c4c;">添加</span></button>
								</a>
							 </div>
							 &nbsp;
							<!--  <button class="btn btn-white btn-default btn-round"><i class="ace-icon fa fa-times red2"></i>删除</button> -->
							 <div id="btnDelDiv"class="form-group" >
								<a data-target="" id="newDel" data-toggle="modal">
									<button id="btnDel" class="btn btn-link btn-sm" type="button"><i class="ace-icon glyphicon glyphicon-remove red bigger-110"></i><span style="font-family:'Microsoft YaHei';font-size:15px;color:#4e4c4c;">删除</span></button>
								</a>
							 </div> 
							 &nbsp; 
							<div class="form-group">
							  <input class="searchContent form-control" style="width: 150px;" name="" fieldname="t.TOOLS_NAME" id="" operation="like" logic="and">
							  <button id="searchBox" class="btn btn-link btn-sm" type="button">
									<i class="#ace-icon glyphicon  bigger-110"></i><span style="font-family:'Microsoft YaHei';font-size:15px;color:#4e4c4c;">查询</span>
							  </button>
							</div>
						</div>	
					</form>
				   <form id="dataCheckBox02">
				      <!-- 当前 选择的 checkbox -->
				       <input class="hidden" id="strUidCkbp" type="hidden" fieldname="TOOLS_UID"/>
				    </form>
					    <table   sortname="TOOLS_UID" multiselect=false  rownum="1000000" sortorder="asc"  class=""  id="grid_table02" 
									action="${ctx}/JcTools/jcckController?query" >
							<tr>
							    <th name="TOOLS_UID" formatter="formatEdit" width="1" align="center">选择</th>
								<th name="TOOLS_UID"  width="2" align="center">物品ID</th>
								<th name="TOOLS_NAME"  width="3" align="center">物品名称</th>
								<th name="TOOLS_MODEL" width="3" align="center" >物品型号</th>
								<th name="TOOLS_UNIT" width="1" align="center" >单位</th>
								<th name="TOOLS_NUMS" width="2" align="center" >总数量</th>
								<th name="IN_USE_NUMS" width="2" align="center" >正常使用</th>
								<th name="SLIGHT_DAMAGE_NUMS" width="2" align="center" >轻微损耗</th>
								<th name="DAMAGE_NUMS" width="2" align="center" >损坏</th>
								<th name="TOOLS_UID" width="2" align="center" formatter="doUpdate" >编辑</th>
							</tr> 
						</table> 
						<script type="text/javascript">
							var $path_base = "/";//this will be used in gritter alerts containing images
						</script>
				</div>
			</div>
		<div id="jkjcck-input" class="modal"></div>

<%@ include file="/jsp/framework/common/basic_scripts.jsp"%>
    <script
		src="${pageContext.request.contextPath }/assets/js/jquery-ui.custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/sys_resources/js/common/Form2Json.js"> </script>
<script type="text/javascript">
var controlletname="${pageContext.request.contextPath }/JcTools/jcckController";
var scripts =[null];
var gridwidth;
var setHeight;
ace.load_ajax_scripts(scripts, function() {
	init();
	var xmUid = $("#project_uid").val();
	$("#PROJECT_UID").val(xmUid);
	
	gridwidth=$("#inside").width();
	//gridwidth -=250;
	//设置 放置 表格的 div的宽度
	//$("#tbDiv").css("width",gridwidth);
	JqgridManage.initJqgrid(grid_table02,queryForm02,gridwidth); 
	setHeight = $(window).height();
	
	if(navigator.userAgent.indexOf("Firefox") > -1){
	   setHeight = setHeight+50;
	}
	
	 $("#grid_table02").setGridHeight(setHeight - 320); 
});

function init(){	
    //查询按钮 (报表)
	$("#searchBox").click(function(){
	  jQuery("#grid_table02").jqGrid().trigger("reloadGrid");
	}); 
	
	
	$('#newAdd').click(function() {
	$('#newAdd').attr("data-target","jkjcck-input");
		$('#jkjcck-input').removeData("bs.modal");
		$("#jkjcck-input").empty();
		$('#jkjcck-input').modal({
			backdrop: 'static'
		});
         
       /*  var xuanze = $("#ClickType").val();
        alert(xuanze); */
       
		$.get("${ctx}/jsp/business/jkjc/jkjcJcck-add.jsp?PROJECT_UID="+$("#project_uid").val(),function(data) {
			$("#jkjcck-inputt").empty();
			$("#jkjcck-input").html("");
			$("#jkjcck-input").html(data);
		});
	
	});
	
	//删除 
	$("#btnDel").click(function (){
		//获取 选择的列
		   var v="";
		   $("#grid_table02 input:checkbox[name='TOOLS_UID']:checked").each(function() {
				v += $(this).val() + "," ;
			});
			if (v.length != 0) {
			v = v.substring(0, v.length - 1);
			}
		  $("#strUidCkbp").val(v);
		  if($("#strUidCkbp").val() !="" ){
			bootbox.confirm("确认删除吗？", function(result) {
				if(result){
				    var data = Form2Json.formToJSON(dataCheckBox02);
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
							if(response !="" && response !=null){
								xAlert("信息提示","删除成功！");
							     $("#searchBox").click();
							}else{
								xAlert("信息提示","输出失败，请联系管理员！");
							}
						}
					});
					
				}else{
				xAlert("信息提示","请选择要删除的行！");
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
	var toolUid = rowObject.TOOLS_UID;
	var showHtml ="<div class='hidden-sm hidden-xs action-buttons' id='getValue'>";			        	
		showHtml +="<input id=\"jcEuid"+toolUid+"\" type=\"checkbox\" name=\"TOOLS_UID\" value =\""+toolUid+"\" ";
		showHtml +="</div>";
	return 	showHtml;	
	
}

function doUpdate(cellvalue, opts, rowObject){
	var tid = rowObject.TOOLS_UID;

	var showHtml ="<div class='hidden-sm hidden-xs action-buttons'>";			        	
		showHtml +="<a class=\"blue\" title=\"查看\" data-target=\"content_view\"  href=\"javascript:void(0);\"" ;
		showHtml +=	" onclick=\"eidtTid('"+tid+"');\">";
		showHtml +="<span class=\"glyphicon glyphicon-edit bigger-110\"></i>";
		showHtml +="</a> &nbsp;";
	        	
	return 	showHtml;
}
function eidtTid(yjid){
$('#newAdd').attr("data-target","jkjcck-input");
	$('#jkjcck-input').removeData("bs.modal");
	$("#jkjcck-input").empty();
	$('#jkjcck-input').modal({
		backdrop: 'static'
	});

	$.get("${ctx}/jsp/business/jkjc/jkjcJcck-edity.jsp?PROJECT_UID="+$("#project_uid").val()+"&TOOLS_UID="+yjid,function(data) {
		$("#jkjcck-input").empty();
		$("#jkjcck-input").html("");
		$("#jkjcck-input").html(data);
	});

}



</script>
	<form id="gdzxtformid" method="post" >
		<input type="hidden" name="gdzxt_gcid" id="gdzxt_gcid" >
	</form>
</body>
</html>