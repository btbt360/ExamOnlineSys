<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/pages/include/pageNavigation.jsp" />
	<div class="block" >
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class='icon-chevron-left hide-sidebar'><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
					<i class='icon-chevron-right show-sidebar" style="display: none;'><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
					<li><a href="#">考试管理</a> <span class="divider">/</span></li>
					<li class="active">考试安排</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/exam/addExam">考试安排列表</a></li>
			<li class="active"><a href="${basepath}/exam/addExaminfo">考试安排添加</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${flagcg==1}">class="alert alert-success"</c:if>
					 <c:if test="${flagcg==0}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<c:if test="${flagcg==1}"><strong>保存成功！</strong></c:if>
						<c:if test="${flagcg==0}"><strong>保存失败！</strong></c:if>
				</div>
				<form id="subinfoform" class="form-horizontal" action="${basepath}/exam/saveExam" method="post">
					<fieldset>
						<legend>试卷管理</legend>
						<div class="control-group">
							<label class="control-label">试卷名称：</label>
							<div class="controls">
							<input name="exam.id" type="hidden" value="${exam.id}" >
								<input class="input-xlarge focused" id="name" name="exam.name"
									type="text" placeholder="请输入试卷名称!" value="${exam.name}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">开始时间：</label>
							<div class="controls">
								<input class="input-medium datepicker" id="starttimes" name="exam.starttime"
									type="text" placeholder="请输入开始时间!" value="${exam.starttime}" onchange="compare()" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">结束时间：</label>
							<div class="controls">
								<input class="input-medium datepicker" id="endtimes" name="exam.endtime"
									type="text" placeholder="请输入结束时间!" value="${exam.endtime}" onchange="compare()" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">考试时长：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="duration" name="exam.duration"
									type="text" value="${exam.duration}" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">考试地点：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="address" name="exam.address"
									type="text" placeholder="请输入考试地点!" value="${exam.address}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">考试人数：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="number" name="exam.number"
									type="text" placeholder="请输入考试人数!" value="${exam.number}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">监考员一姓名：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="endtime" name="exam.invigilatenameone"
									type="text" placeholder="请输入监控员一姓名!" value="${exam.invigilatenameone}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">监考员二姓名：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="invigilatenametwo" name="exam.invigilatenametwo"
									type="text" placeholder="请输入监考员二姓名!" value="${exam.invigilatenametwo}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">考试要求：</label>
							<div class="controls">
								<textarea id="demand" name="exam.demand" placeholder="请输入考试要求!" rows="10" style="width: 50%;	" >${exam.demand}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">考试制度：</label>
							<div class="controls">
								<textarea id="institution" name="exam.institution" placeholder="请输入考试制度!" rows="15" style="width: 50%;	" >${exam.institution}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp;
								<input type="radio" id="login_flag0" value="1" name="exam.isenable" checked
								<c:if test="${exam.isenable==1}">checked</c:if> />
								</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0" name="exam.isenable"
								<c:if test="${exam.isenable==0}">checked</c:if> />
								</label>
							</div>
						</div>
						
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">保存</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/exam/addExam'">
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
		
		$('.datepicker').datetimepicker({  
	        language:  'zh-CN',
	        format: 'yyyy-mm-dd hh:ii',
	        weekStart: 1,  
	        todayBtn:  1,  
	        autoclose: 1,  
	        todayHighlight: 1,  
	        startView: 2,  
	        forceParse: 0,  
	        showMeridian: 1  
	    }).on('changeDate', function (ev) {   
	        $(this).datetimepicker('hide');  
	    });
		
		var jqObj = new JQvalidate();
 	    var subform ="subinfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("exam.name", "required",  "请输入试卷名称!"); 
 	    jqObj.set("exam.starttime", "required",  "请输入开始时间!");
 	    jqObj.set("exam.endtime", "required",  "请输入结束时间!");
 	    jqObj.set("exam.address", "required",  "请输入考试地点!");
 	    jqObj.set("exam.number", "required",  "请输入考试人数!");
 	    jqObj.set("exam.invigilatenameone", "required",  "请输入监考员一姓名!");	
 	    jqObj.set("exam.invigilatenametwo", "required",  "请输入监考员二姓名!");	 
 	    jqObj.Run();
	})
	
	function compare(){
		var startTime=$('#starttimes').val();
		var endTime=$('#endtimes').val();
		if(startTime != "" && endTime != ""){
			var beginTimes = startTime.substring(0, 10).split('-');
			var endTimes = endTime.substring(0, 10).split('-');
			
			beginTime = beginTimes[1] + '-' + beginTimes[2] + '-' + beginTimes[0] + ' ' + startTime.substring(10, 19);
		    endTime = endTimes[1] + '-' + endTimes[2] + '-' + endTimes[0] + ' ' + endTime.substring(10, 19);
		    beginTime = beginTime.replace(/-/g, "/");
		    endTime = endTime.replace(/-/g, "/");
		   
		    var hour=(Date.parse(endTime)-Date.parse(beginTime))/3600/1000;
		    
			if (hour < 0) { 
				  alert("开始时间不能大于结束时间！");
				  endTime.focus();
			}else{
				var minutes = parseInt(Math.abs((Date.parse(endTime)-Date.parse(beginTime))/(1000*60)));
				$("#duration").val(minutes);
			}
		}
	}
	
</script>
<c:import url="/pages/include/pageFoot.jsp" />