<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/pages/include/pageNavigation.jsp" />
<!-- block -->
	<div class="block">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class="icon-chevron-left hide-sidebar"> <a href='#'
						title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
					<i class="icon-chevron-right show-sidebar" style="display: none;">
						<a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a>
					</i>
					<li><a href="#">资源管理</a> <span class="divider">/</span></li>
					<li class="active">题库管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/item/add">题库列表</a></li>
						<li><a href="${basepath}/item/addinfo">题库添加</a></li>
						<li><a href="${basepath}/item/importExcel">试题导入</a></li>
					</ul>
					
					<!-- 删除用户提示 -->
					<div class="span12">
						<div class="alert alert-success"
							style="margin-right: 8%;display: none; text-align: center;" id="successmessage">
							<button class="close" onclick="$('#successmessage').hide();">&times;</button>
							<strong><span id="messagess"></span></strong>
						</div>
						<div class="alert alert-error"
							style="margin-right: 8%;display: none; text-align: center;" id="errormessage">
							<button class="close" onclick="$('#errormessage').hide();">&times;</button>
							<strong><span id="messageee"></span></strong>
						</div>
					</div>
					<form action="${basepath}/case/exportCase" method="post"
						id="subform">
						<div class="span12 text-center">
							<div class="span3">
								<label class="control-label" for="name">题库名称：<input
									class="input-medium focused" id="name" name="name"
									type="text" /></label> 
							</div>
							<div class="span4">
								<label class="control-label" for="subjectid">科目名称：
									<input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu(); return false;"/>
									<input name="subjectid" id ="subjectid" type="hidden" value="" >
								</label> 
							</div>
							<div class="span4">
								<label class="control-label" for="questiontype">试题类型：
								<select class="m-wrap" id="questiontype" name="questiontype" placeholder="请选择试题类型！">
										<option value='0'>请选择试题类型</option>
										<c:forEach var="dict" items="${dictlist}">
											<option value='${dict.dictkey}'>${dict.dictvalue}</option>
										</c:forEach>
								</select>
								</label> 
							</div>
							<div class="span1 text-right" >
							<button class="btn btn-medium btn-primary" type="button"
							id="query">查询</button>
<!-- 							<button class="btn btn-medium btn-primary" type="button" -->
<!-- 								id="export">导出</button> -->
						</div>
						</div>
						
						<input type="hidden" id="subpages" name="subpages" /><input
							type="hidden" id="subrp" name="subrp" />
					</form>
					
					<table id="userList" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>题库名称</th>
								<th>科目名称</th>
								<th>总题数</th>
								<th>试题类型</th>
								<th>选择次数</th>
								<th>是否启用</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<!-- tbody是必须的 -->
					</table>
				</div>
			</div>
		</div>
	</div>
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;background-color: #f5f5f5;border: 1px solid #ccc;">
		<ul id="otree" class="ztree"></ul>
	</div>
</body>
<script type="text/javascript">
function edit(ids) {
	location.href = "${basepath}/item/addinfo?id=" + ids;
}

function del(ids) {
	if (confirm("确定要删除该题库？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/item/del?id=' + ids,
			cache : false,
			dataType : 'json',
			success : function(data) {
				if (data.result == 1) {
					$("#successmessage").hide();
					$("#errormessage").show();
					$("#messageee").text("删除失败，请联系管理员！");
				} else {
					$("#errormessage").hide();
					$("#successmessage").show();
					$("#messagess").text("删除成功！");
				}
				reshcg();
			}
		});
	}
}
var subjectid = '${subject.parentid}';
var setting = {
	view : {
		dblClickExpand : false
	},
	async : {
		enable : true, //设置 zTree 是否开启异步加载模式
		url : "${basepath}/subject/getSubjectTree", //Ajax 获取数据的 URL 地址。
		autoParam : [ "id", "name" ], //异步加载时需要自动提交父节点属性的参数。
		otherParam : { //Ajax 请求提交的静态参数键值对。
			"otherParam" : "zTreeAsyncTest",
			"subjectid" : subjectid
		},
		dataFilter : filter
	//用于对 Ajax 返回数据进行预处理的函数。
	},
	callback : {
		onClick : onClick, //用于捕获节点被点击的事件回调函数
		onAsyncSuccess : onAsyncSuccesso
	}
};
var treeNodez;

function filter(treeId, parentNode, childNodes) {
	if (!childNodes)
		return null;
	for (var i = 0, l = childNodes.length; i < l; i++) {
		childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
	}
	return childNodes;
}

function onAsyncSuccesso(event, treeId, treeNode, msg) {
	var treeObj = $.fn.zTree.getZTreeObj("otree");
	var nodes = treeObj.getNodesByParam("parentId", 0, null);
	if (nodes.length > 0) {
		treeObj.expandNode(nodes[0], true, false, false);
	}
}

function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("otree"), nodes = zTree
			.getSelectedNodes(), v = "";
	var ids = '';
	nodes.sort(function compare(a, b) {
		return a.id - b.id;
	});
	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
		ids += nodes[i].id + ",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);
	if (ids.length > 0)
		ids = ids.substring(0, ids.length - 1);
	$("#citySel").val(v);
	$("#subjectid").val(ids);
}

function showMenu() {
	var cityObj = $("#citySel");
	var cityOffset = $("#citySel").offset();
	$("#menuContent").css({
		left : cityOffset.left + "px",
		top : cityOffset.top + cityObj.outerHeight() + "px"
	}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(
			event.target).parents("#menuContent").length > 0)) {
		hideMenu();
	}
}
function checkinfo(itembid){
	location.href = "${basepath}/questions/add?itembid=" + itembid;
}
$(document).ready(
		function() {
			$.fn.zTree.init($("#otree"), setting);
		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/item/find"
		});

		$("#query").click(function() {
			reshcg();
		});
		$("#export").click(function() {
			$("#subpages").val(oTable.getCurrentPage());
			$("#subrp").val(oTable.getPageSize());
			$("#subform").submit();
		});

	});
	function reshcg() {
		var name = $('#name').val();
		var subjectid = $('#subjectid').val();
		var questiontype = $('#questiontype').val();
		var oSettings = [ {
			"name" : "name",
			"value" : name
		}, {
			"name" : "subjectid",
			"value" : subjectid
		}, {
			"name" : "questiontype",
			"value" : questiontype
		} ];
		oTable.gridSearch(this, oSettings);
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />