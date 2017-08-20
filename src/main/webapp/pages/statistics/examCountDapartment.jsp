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
					<li><a href="#">统计分析</a> <span class="divider">/</span></li>
					<li class="active">考试统计</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/statistics/examCountDapartment">人员考试成绩统计</a></li>
						<li ><a href="${basepath}/statistics/examCountPost">岗位考试统计</a></li>
						<li ><a href="${basepath}/statistics/examCount">人员考试统计</a></li>
					</ul>
					<div class="span12">
						<div class="span4 text-center">
								<label class="control-label" for="name">考试名称：
								<select class="m-wrap" id="examid" name="examid" placeholder="请选择考试！">
									<option value=''>请选择考试</option>
								<c:forEach var="exam" items="${examlist}">
									<option value='${exam.id}'>${exam.code} | ${exam.name}</option>
								</c:forEach>
								</select>
								</label> 
						</div>
						<div class="span3 text-center">
						<label class="control-label" for="starttimes"><a href='#'
							id="ceatetimes" style="color: black; text-decoration: none;">考试时间：</a></label>
						<input type="text" class="input-medium datetimepicker" id="starttimes"
							value="" name="starttimes">
						</div>
						<div class="span3 text-center">
							<label class="control-label" for="endtimes"><a href='#'
								id="ceatetimee" style="color: black; text-decoration: none;">至：</a></label>
							<input type="text" class="input-medium datetimepicker" id="endtimes"
								value="" name="endtimes">
						</div>
						<div class="span2 text-center">
						    <button class="btn btn-medium btn-primary" type="button" id="query">查询</button>
 							<input type="hidden" id="subpages" name="subpages" /><input type="hidden" id="subrp" name="subrp" />
						</div>
						<!-- 弹出层 start -->
								<div class="modal hide fade" id="oModal" tabindex="-1" role="dialog">
									<div class="modal-header">
										<button class="close" type="button" data-dismiss="modal">×</button>
										<h3 id="myModalLabel">添加评价</h3>
									</div>
									<div class="modal-body">
										<div class="control-group">
										<label class="control-label">评价内容：</label>
										<div class="controls">
											<input class="input-xlarge focused" id="remarks" name="remarks" type="text"
												placeholder="请输入评价内容！" value="${remarks}">
										</div>
									</div>
									<div class="modal-footer">
										<a href="#" class="btn" id="oclosed">关闭</a>
										<a href="#" class="btn btn-primary" id="savearea">保存</a>
									</div>
								</div>
								<!-- 弹出层 end -->
					</div>
						<table id="userList" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th >单位名称</th>
									<th >人员姓名</th>
									<th >考试次数</th>
									<th >考试名称/成绩/评价</th>
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
var ids ='';
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
		
		$("#oclosed").click(function() {
			$('#oModal').modal('hide');
		});
		$("#savearea").click(function() {
			$.ajax({
				type : 'post',
				url : '${basepath}/statistics/updateremark?remark=' + $("#remarks").val() +'&id='+ids,
				cache : false,
				dataType : 'json',
				success : function(data) {
					if (data == 1) {
						alert("更新失败，请联系管理员！");
					} else {
						alert("更新成功！");
					}
					reshcg();
				}
			});
			$("#remarks").val("");
			$('#oModal').modal('hide');
		});
		$('#ceatetimes').click(function() {
			$('#starttimes').val('');
		});
		$('#ceatetimee').click(function() {
			$('#endtimes').val('');
		});
		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/statistics/examCountDapartmentfind"
		});
		$("#query").click(function() {
			reshcg();
		});
	});
	function reshcg() {
		var examid = $('#examid').val();
		var starttime=$('#starttimes').val();
		var endtime=$('#endtimes').val();
		var oSettings = [{
			"name" : "examid",
			"value" : examid
		},{
			"name" : "starttime",
			"value" : starttime
		},{
			"name" : "endtime",
			"value" : endtime
		}];
		oTable.gridSearch(this, oSettings);
	}
	function pingjia(id){
		$('#oModal').modal('show');
		ids = id;
	}
	function xiangxi(id){
		var tempwindow = window.open ('_blank', 'newwindow','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+ ',top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		tempwindow.location="${basepath}/statistics/checkinfo?id="+id;
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />