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
					<li class="active">案例管理</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/case/add">案例列表</a></li>
			<li class="active"><a href="${basepath}/case/addinfo">案例添加</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${returninfo.result==0}">class="alert alert-success"</c:if>
					 <c:if test="${returninfo.result==1}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<strong>${returninfo.resultInfo}</strong>
				</div>
				<form id="caseinfoform" class="form-horizontal" action="${basepath}/case/save" method="post">
					<fieldset>
						<legend>案例管理</legend>
						<div class="control-group">
							<label class="control-label">案例名称：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="name" name="cases.name"
									type="text" placeholder="请输入案例名称!" value="${cases.name}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="phone">案例问题：</label>
							<div class="controls">
							<input name="cases.id" type="hidden" value="${cases.id}" >
								<input class="input-xlarge focused" id="code" name="cases.casetitle"
									type="text" placeholder="请输入案例问题!" value="${cases.casetitle}" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="mobile">案例答案：</label>
							<div class="controls">
								<textarea id="caseanswer" name="cases.caseanswer" placeholder="请输入案例答案!" rows="10" style="width: 50%;	" >${cases.caseanswer}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" >属于科目：</label>												    
						  <div class="controls">  <select class="span3 m-wrap" id="subject" name="cases.subjectId"  placeholder="请选择科目！" >
								<option value=''>请选择</option>
								<c:forEach var="subject" items="${subjectlist}">
								<option
									<c:if test="${subject.id==cases.subjectId}">selected</c:if>
									value='${subject.id}'>${subject.name}</option>
							</c:forEach>
							</select> 
							      <input type="hidden" id="hidTypeInfo" name="dict.typeinfo"
						value="${dict.typeinfo}">	
						   <input type="hidden" id="hidType" name="dict.type"
						value="${dict.type}"> <div style="color: red; margin-top: 5px;"> ${dicttypeMsg}</div>	  
							</div>						
						</div>	
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp;
								<input type="radio" id="login_flag0" value="1" name="cases.isenable" checked
								<c:if test="${cases.isenable==1}">checked</c:if> />
								</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0" name="cases.isenable"
								<c:if test="${cases.isenable==0}">checked</c:if> />
								</label>
							</div>
						</div>
						
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">保存</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/case/add'">
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
 	    var subform ="caseinfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("cases.name", "required",  "请输入案例名称!");  
 	    jqObj.set("cases.casetitle", "required",  "请输入案例问题!");	 
 	    jqObj.set("cases.caseanswer", "required",  "请输入案例答案!");
 	    jqObj.set("cases.subjectId", "required",  "请选择科目!");
 	    jqObj.Run();
	})
</script>
<c:import url="/pages/include/pageFoot.jsp" />