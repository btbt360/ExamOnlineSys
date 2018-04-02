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
					<li class="active">培训管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/train/addTrain">培训列表</a></li>
						<li><a href="${basepath}/train/addTrainInfo">培训添加</a></li>
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
					<form action="${basepath}/train/exportCase" method="post"
						id="subform">
						<div class="span12">
							<div class="span3">
								<label class="control-label" for="dicttype">课程名称：</label> <select
									class="span6 m-wrap" id="curriculumid" name="curriculumid">
									<option value=''>请选择</option>
									<c:forEach var="curriculum" items="${curriculumlist}">
										<option value='${curriculum.id}'>${curriculum.coursename}</option>
									</c:forEach>
								</select>
							</div>
							<div class="span3">
								<label class="control-label" for="starttimes"><a href='#'
									id="ceatetimes" style="color: black; text-decoration: none;">培训开始时间：</a></label>
								<input type="text" class="input-medium datetimepicker" id="starttimes"
									value="" name="starttimes">
							</div>
							<div class="span3">
								<label class="control-label" for="endtimes"><a href='#'
									id="ceatetimee" style="color: black; text-decoration: none;">至：</a></label>
								<input type="text" class="input-medium datetimepicker" id="endtimes"
									value="" name="endtimes">
							</div>
							<div class="span3 text-right" >
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
								<th>培训名称</th>
								<th>培训开始时间</th>
								<th>培训结束时间</th>
								<th>培训描述</th>
								<th>课程名称</th>
								<th>人员姓名</th>
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
	location.href = "${basepath}/train/addTrainInfo?id=" + ids;
}

function del(ids) {
	if (confirm("确定要删除该科目？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/train/delTrain?id=' + ids,
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
			"sAjaxSource" : "${basepath}/train/findTrain"
		});
		$('.datetimepicker').datetimepicker({  
            language:  'zh-CN',
            format: 'yyyy-mm-dd',
            weekStart: 1,  
            todayBtn:  1,  
            autoclose: true,  
            todayHighlight: 1,  
            startView: 2,  
            forceParse: true,  
            minView:2,//只到天
            showMeridian: 1  
        }).on('changeDate', function (ev) {  
            $(this).datetimepicker('hide');  
        });
		$('#ceatetimes').click(function() {
			$('#starttimes').val('');
		});
		$('#ceatetimee').click(function() {
			$('#endtimes').val('');
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
		var curriculumid = $('#curriculumid').val();
		var starttimes = $('#starttimes').val();
		var endtimes = $('#endtimes').val();
		var oSettings = [ {
			"name" : "curriculumid",
			"value" : curriculumid
		}, {
			"name" : "starttime",
			"value" : starttimes
		}, {
			"name" : "endtime",
			"value" : endtimes
		} ];
		oTable.gridSearch(this, oSettings);
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />