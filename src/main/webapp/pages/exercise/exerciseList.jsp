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
					<li><a href="#">我的练习</a> <span class="divider">/</span></li>
					<li class="active">练习管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/exercise/addExercise">练习列表</a></li>
						<li><a href="${basepath}/exercise/addExerciseInfo">练习添加</a></li>
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
					<form action="${basepath}/exercise/exportSubject" method="post" id="subform">
						<div class="span12 text-center">
							<div class="span3">
								<label class="control-label" for="name">练习名称：<input
									class="input-medium focused" id="name" name="name"
									type="text" /></label> 
							</div>
							<div class="span4">
								<label class="control-label" for="subjectid">科目名称：
									<select class="m-wrap" id="subjectid" name="subjectid" placeholder="请选择科目！">
										<option value=''>请选择科目</option>
										<c:forEach var="subject" items="${subjectlist}">
											<option value='${subject.id}'>${subject.name}</option>
										</c:forEach>
									</select>
								</label> 
							</div>
							<div class="span4">
								<label class="control-label" for="itembankid">题库名称：
									<select class="m-wrap" id="itembankid" name="itembankid" placeholder="请选择题库！">
										<option value=''>请选择科目</option>
									</select>
								</label> 
							</div>
							<div class="span1 text-center" >
								<button class="btn btn-medium btn-primary" type="button"
								id="query">查询</button>
							</div>
						</div>
						<input type="hidden" id="subpages" name="subpages" /><input
							type="hidden" id="subrp" name="subrp" />
					</form>
					<table id="userList" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>练习名称</th>
								<th>科目</th>
								<th>题库</th>
								<th>试题总数</th>
								<th>已完成总数</th>
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
	location.href = "${basepath}/exercise/addExerciseInfo?id=" + ids;
}

function del(ids) {
	if (confirm("确定要删除该科目？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/exercise/delExercise?id=' + ids,
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
			"sAjaxSource" : "${basepath}/exercise/getExerciselist"
		});

		$("#query").click(function() {
			reshcg();
		});
		$("#export").click(function() {
			$("#subpages").val(oTable.getCurrentPage());
			$("#subrp").val(oTable.getPageSize());
			$("#subform").submit();
		});
		$("#subjectid").change(function(){
			$("#itembankid").empty();
			$("#itembankid").append("<option value=''>请选择题库</option>");
			var ids = $("#subjectid").val();
			$.ajax({
				type : 'post',
				url : '${basepath}/item/getSelectSubject?id=' + ids,
				cache : false,
				dataType : 'json',
				success : function(data) {
					jQuery.each(data, function(i,item){
		                $("#itembankid").append("<option value='"+item.ID+"'>"+item.NAME+"</option>");
		            });
				}
			});
		});
	});
	function reshcg() {
		var name = $('#name').val();
		var subjectid = $('#subjectid').val();
		var itembankid = $('#itembankid').val();
		var oSettings = [ {
			"name" : "name",
			"value" : name
		}, {
			"name" : "subjectid",
			"value" : subjectid
		}, {
			"name" : "itembankid",
			"value" : itembankid
		}  ];
		oTable.gridSearch(this, oSettings);
	}
	function startExercise(exerciseid){
		var tempwindow = window.open ('_blank', 'newwindow','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+ ',top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		tempwindow.location="${basepath}/exercise/startExercise?exerciseid=" + exerciseid;
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />