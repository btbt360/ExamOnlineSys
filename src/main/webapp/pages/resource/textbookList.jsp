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
					<li class="active">教材管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/textbook/add">教材列表</a></li>
						<li><a href="${basepath}/textbook/addinfo">教材添加</a></li>
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
					<form action="${basepath}/textbook/exportCase" method="post"
						id="subform">
						<div class="span12">
							<div class="span4">
								<label class="control-label" for="name">教材名称：<input
									class="input-medium focused" id="name" name="name"
									type="text" /></label> 
							</div>
							<div class="span4">
								<label class="control-label" for="code">教材编码：<input
									class="input-medium focused" id="code" name="code"
									type="text" /></label> 
							</div>
							<div class="span4 text-right" >
						<button class="btn btn-medium btn-primary" type="button"
							id="query">查询</button>
<!-- 						<button class="btn btn-medium btn-primary" type="button" -->
<!-- 							id="export">导出</button> -->
					</div>
						</div>
						<input type="hidden" id="subpages" name="subpages" /><input
							type="hidden" id="subrp" name="subrp" />
					</form>
					
					<table id="userList" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>教材名称</th>
								<th>教材编码</th>
								<th>教材编纂人</th>
								<th>教材发布人</th>
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
</body>
<script type="text/javascript">
function edit(ids) {
	location.href = "${basepath}/textbook/addinfo?id=" + ids;
}

function del(ids) {
	if (confirm("确定要删除该教材？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/textbook/del?id=' + ids,
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
	$(document).ready(function() {
		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/textbook/find"
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
		var code = $('#code').val();
		var oSettings = [ {
			"name" : "name",
			"value" : name
		}, {
			"name" : "code",
			"value" : code
		} ];
		oTable.gridSearch(this, oSettings);
	}
	//使用input框打开ckfinder
	function BrowseServer(inputId) {
		var finder = new CKFinder();
		finder.basePath = '${basepath}/ckfinder/ckfinder.html'; //导入CKFinder的路径 
		finder.selectActionFunction = SetFileField; //设置文件被选中时的函数 
		finder.selectActionData = inputId; //接收地址的input ID 
		finder.popup();
	}
	//文件选中时执行 
	function SetFileField(fileUrl, data) {
		document.getElementById(data["selectActionData"]).value = fileUrl;
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />