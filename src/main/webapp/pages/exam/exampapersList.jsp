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
					<li><a href="#">考试管理</a> <span class="divider">/</span></li>
					<li class="active">试卷管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/exampapers/add">试卷列表</a></li>
						<li><a href="${basepath}/exampapers/addinfo">试卷添加</a></li>
						<li><a href="${basepath}/exampapers/addExampapersChoose">试卷选题</a></li>
						<li><a href="${basepath}/exampapers/showinfo">试卷预览</a></li>
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
					<form action="${basepath}/exampapers/exportCase" method="post"
						id="subform">
						<div class="span12">
							<div class="span3">
								<label class="control-label" for="name">试卷名称：<input
									class="input-medium focused" id="name" name="name"
									type="text" /></label> 
							</div>
							<div class="span3">
								<label class="control-label" for="code">试卷编码：<input
									class="input-medium focused" id="code" name="code"
									type="text" /></label> 
							</div>
							<div class="span3">
								<label class="control-label" for="starttimes"><a href='#'
									id="cretetimes" style="color: black; text-decoration: none;">创建时间：</a><input type="text" class="input-medium datetimepicker"
									id="createtimes" value="" name="createtimes"></label>
							</div>
							<div class="span3">
								<label class="control-label" for="endtimes"><a href='#'
									id="ceatetimee" style="color: black; text-decoration: none;">至：</a><input type="text" class="input-medium datetimepicker" id="createtimee"
									value="" name="createtimee"></label>
							</div>
							</div>
						<div class="span11 text-right" >
							<button class="btn btn-medium btn-primary" type="button"id="query">查询</button>
<!-- 						<button class="btn btn-medium btn-primary" type="button" id="export">导出</button> -->
						</div>
						<input type="hidden" id="subpages" name="subpages" />
						<input type="hidden" id="subrp" name="subrp" />
					</form>
					
					<table id="userList" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>试卷编码</th>
								<th>试卷名称</th>
								<th>试卷总分</th>
								<th>试卷使用次数</th>
								<th>试卷总题数</th>
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
	location.href = "${basepath}/exampapers/addinfo?id=" + ids;
}

function del(ids) {
	if (confirm("确定要删除该试卷？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/exampapers/del?id=' + ids,
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
function chouqu(ids){
	location.href = "${basepath}/exampapers/addExampapersChoose?id=" + ids;
}
function queren(ids){
	if (confirm("确定抽题和选题完成？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/exampapers/toFinishChoose?id=' + ids,
			cache : false,
			dataType : 'json',
			success : function(data) {
				alert(data.message);
				reshcg();
			}
		});
	}
}
	$(document).ready(function() {
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
		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/exampapers/find"
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
		var name = $('#name').val();
		var code = $('#code').val();
		var createtimes = $('#createtimes').val();
		var createtimee = $('#createtimee').val();
		var oSettings = [ {
			"name" : "name",
			"value" : name
		}, {
			"name" : "code",
			"value" : code
		}, {
			"name" : "createtimes",
			"value" : createtimes
		}, {
			"name" : "createtimee",
			"value" : createtimee
		} ];
		oTable.gridSearch(this, oSettings);
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />