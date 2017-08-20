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
					<li class="active">课程设计管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/curriculum/addCurriculum">课程设计列表</a></li>
						<li><a href="${basepath}/curriculum/addCurriculumInfo">课程设计添加</a></li>
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
					<form action="${basepath}/curriculum/exportCurriculumInfo" method="post"
						id="subform">
						<div class="span12">
							<div class="span4">
								<label class="control-label" for="name">课程名称：<input
									class="input-medium focused" id="coursename" name="coursename"
									type="text" /></label> 
							</div>
							<div class="span4">
								<label class="control-label" for="code">课程标题：<input
									class="input-medium focused" id="coursetitle" name="coursetitle"
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
								<th>课程名称</th>
								<th>课程标题</th>
								<th>课程标签</th>
								<th>课程讲师</th>
								<th>课程教材名称</th>
								<th>课程描述</th>
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
	location.href = "${basepath}/curriculum/addCurriculumInfo?id=" + ids;
}

function del(ids) {
	if (confirm("确定要删除该课程设计？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/curriculum/delCurriculum?id=' + ids,
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
			"sAjaxSource" : "${basepath}/curriculum/findCurriculum"
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
		var coursename = $('#coursename').val();
		var coursetitle = $('#coursetitle').val();
		var oSettings = [ {
			"name" : "coursename",
			"value" : coursename
		}, {
			"name" : "coursetitle",
			"value" : coursetitle
		} ];
		oTable.gridSearch(this, oSettings);
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />