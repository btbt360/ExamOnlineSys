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
					<li><a href="#">资源管理</a> <span class="divider">/</span></li>
					<li class="active">科目管理</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/subject/addsub">科目列表</a></li>
			<li class="active"><a href="${basepath}/subject/addsubinfo">科目添加</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${returninfo.result==0}">class="alert alert-success"</c:if>
					 <c:if test="${returninfo.result==1}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<strong>${returninfo.resultInfo}</strong>
				</div>
				<form id="subinfoform" class="form-horizontal" action="${basepath}/subject/savesub" method="post">
					<fieldset>
						<legend>科目管理</legend>
						<div class="control-group">
							<label class="control-label">科目名称：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="name" name="subject.name"
									type="text" placeholder="请输入科目名称!" value="${subject.name}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="phone">科目编码：</label>
							<div class="controls">
							<input name="subject.id" type="hidden" value="${subject.id}" >
								<input class="input-xlarge focused" id="code" name="subject.code"
									type="text" placeholder="请输入科目编码!" value="${subject.code}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="mobile">科目描述：</label>
							<div class="controls">
								<textarea id="info" name="subject.info" placeholder="请输入描述信息!" rows="10" style="width: 50%;	" >${subject.info}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp;
								<input type="radio" id="login_flag0" value="1" name="subject.isenable" checked
								<c:if test="${subject.isenable==1}">checked</c:if> />
								</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0" name="subject.isenable"
								<c:if test="${subject.isenable==0}">checked</c:if> />
								</label>
							</div>
						</div>
						
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">保存</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/subject/addsub'">
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
		$("#messagealert").hide();
		var returninfo = '${returninfo}';
		if(returninfo!=null&&returninfo!=''){
			$("#messagealert").show();
		}
		$("#closebut").click(function(){
			$("#messagealert").hide();
		});
		var jqObj = new JQvalidate();
 	    var subform ="subinfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("subject.name", "required",  "请输入科目名称!");  
 	    jqObj.set("subject.code", "required",  "请输入科目编码!");	 
 	    jqObj.Run();
	})
</script>
<c:import url="/pages/include/pageFoot.jsp" />