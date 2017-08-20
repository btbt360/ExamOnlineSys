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
					<li class="active">课程设计管理</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li ><a href="${basepath}/curriculum/addCurriculum">课程设计列表</a></li>
			<li class="active"><a href="${basepath}/curriculum/addCurriculumInfo">课程设计添加</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${flagcg==1}">class="alert alert-success"</c:if>
					 <c:if test="${flagcg==0}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<c:if test="${flagcg==1}"><strong>保存成功！</strong></c:if>
						<c:if test="${flagcg==0}"><strong>保存失败！</strong></c:if>
				</div>
				<form id="caseinfoform" class="form-horizontal" action="${basepath}/curriculum/saveCurriculum" method="post">
					<fieldset>
						<legend>课程设计管理</legend>
						<div class="control-group">
							<label class="control-label">课程名称：</label>
							<div class="controls">
								<input  name="curriculum.id" type="hidden" value="${curriculum.id}" >
								<input class="input-xlarge focused" id="coursename" name="curriculum.coursename"
									type="text" placeholder="请输入课程名称!" value="${curriculum.coursename}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">课程标题：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="coursetitle" name="curriculum.coursetitle"
									type="text" placeholder="请输入课程标题!" value="${curriculum.coursetitle}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">课程标签：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="courselabel" name="curriculum.courselabel"
									type="text" placeholder="请输入课程标签!" value="${curriculum.courselabel}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">课程讲师：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="courseleaturer" name="curriculum.courseleaturer"
									type="text" placeholder="请输入课程讲师!" value="${curriculum.courseleaturer}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">课程教材名称：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="coursematerial" name="curriculum.coursematerial"
									type="text" placeholder="请输入课程教材名称!" value="${curriculum.coursematerial}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">课程描述：</label>
							<div class="controls">
								<textarea id="courseinfo" name="curriculum.courseinfo" rows="10" style="width: 50%;	" >${curriculum.courseinfo}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp;
								<input type="radio" id="login_flag0" value="1" name="curriculum.isenable" checked
								<c:if test="${curriculum.isenable==1}">checked</c:if> />
								</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0" name="curriculum.isenable"
								<c:if test="${curriculum.isenable==0}">checked</c:if> />
								</label>
							</div>
						</div> 
							
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">保存</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/curriculum/addCurriculum'">
						</div>
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
<div id="menuContent" class="menuContent" style="display:none; position: absolute;background-color: #f5f5f5;border: 1px solid #ccc;">
	<ul id="otree" class="ztree"></ul>
</div>
<script type="text/javascript">
$(document).ready(function() {
		$.fn.zTree.init($("#otree"), setting);
		$("#messagealert").hide();
		var flagcg = '${flagcg}';
		if(flagcg!=null&&flagcg!=''){
			$("#messagealert").show();
		}
		$("#closebut").click(function(){
			$("#messagealert").hide();
		});
		var jqObj = new JQvalidate();
 	    var subform ="caseinfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("curriculum.coursename", "required",  "请输入课程名称!");  
 	    jqObj.set("curriculum.coursetitle", "required",  "请输入课程标题!");	 
 	    jqObj.set("curriculum.courseleaturer", "required",  "请输入课程讲师!");
 	    jqObj.set("curriculum.coursematerial", "required",  "请输入课程教材名称!");
 	    jqObj.Run();
	})
</script>
<c:import url="/pages/include/pageFoot.jsp" />