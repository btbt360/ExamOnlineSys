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
					<li class="active">题库管理</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/item/add">题库列表</a></li>
			<li class="active"><a href="${basepath}/item/addinfo">题库添加</a></li>
			<li><a href="${basepath}/item/importExcel">试题导入</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${returninfo.result==0}">class="alert alert-success"</c:if>
					 <c:if test="${returninfo.result==1}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<strong>${returninfo.resultInfo}</strong>
				</div>
				<form id="iteminfoform" class="form-horizontal" action="${basepath}/item/save" method="post">
					<fieldset>
						<legend>题库管理</legend>
						<div class="control-group">
							<label class="control-label" for="name">题库名称：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="name" name="itembank.name"
									type="text" placeholder="请输入题库名称!" value="${itembank.name}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="subject">科目名称：</label>
							<div class="controls"><select class="span3 m-wrap" id="subject" name="itembank.subjectId"  placeholder="请选择科目！" >
								<option value=''>请选择科目</option>
								<c:forEach var="subject" items="${subjectlist}">
								<option
									<c:if test="${subject.id==itembank.subjectId}">selected</c:if>
									value='${subject.id}'>${subject.name}</option>
							</c:forEach>
							</select> 
						 </div>	
						</div>
						<div class="control-group">
						  <label class="control-label" for="questiontype">试题类型：</label>												    
						  <div class="controls"><select class="span3 m-wrap" id="questiontype" name="itembank.questiontype"  placeholder="请选择试题类型！" >
								<option value=''>请选择试题类型</option>
								<c:forEach var="dict" items="${dictlist}">
								<option
									<c:if test="${dict.dictkey==itembank.questiontype}">selected</c:if>
									value='${dict.dictkey}'>${dict.dictvalue}</option>
							</c:forEach>
							</select> 
						 </div>	  
						</div>
						<div class="control-group">
							<label class="control-label" for="remark">备注信息：</label>
							<div class="controls">
								<textarea id="remark" name="itembank.remark" rows="10" style="width: 50%;	" >${itembank.remark}</textarea>
							</div>
						</div>	
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp;
								<input type="radio" id="login_flag0" value="1" name="itembank.isenable" checked
								<c:if test="${itembank.isenable==1}">checked</c:if> />
								</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0" name="itembank.isenable"
								<c:if test="${itembank.isenable==0}">checked</c:if> />
								</label>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">保存</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/item/add'">
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
 	    var subform ="iteminfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("itembank.name", "required",  "请输入题库名称!"); 
 	    jqObj.set("itembank.questiontype", "required",  "请选择试题类型！");
 	    jqObj.set("itembank.subjectId", "required",  "请选择科目!");
 	    jqObj.Run();
	})
</script>
<c:import url="/pages/include/pageFoot.jsp" />