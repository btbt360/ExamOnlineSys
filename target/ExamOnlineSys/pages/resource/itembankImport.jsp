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
			<li><a href="${basepath}/item/addinfo">题库添加</a></li>
			<li class="active"><a href="${basepath}/item/importExcel">试题导入</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${flagcg==1}">class="alert alert-success"</c:if>
					 <c:if test="${flagcg==0}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<c:if test="${flagcg==1}"><strong>上传成功！</strong></c:if>
						<c:if test="${flagcg==0}"><strong>上传出现错误，请稍后再上传</strong></c:if>
						<c:if test="${flagcg==-1}"><strong>文件写入服务器出现错误，请稍后再上传</strong></c:if>
				</div>
				<form id="itemform" class="form-horizontal" action="${basepath}/item/uploadExcel" method="post" enctype="multipart/form-data">
					<fieldset>
						<legend>题库导入</legend>
						<div class="control-group">
							<label class="control-label" >属于科目：</label>												    
						  <div class="controls">  <select class="span3 m-wrap" id="subjectid" name="subjectId"  placeholder="请选择科目！" >
								<option value=''>请选择科目</option>
								<c:forEach var="subject" items="${subjectlist}">
								<option
									<c:if test="${subject.id==questions.subjectId}">selected</c:if>
									value='${subject.id}'>${subject.name}</option>
							</c:forEach>
							</select> 
						</div>	
						</div>
						<div class="control-group">
							<label class="control-label" >属于题库：</label>												    
						  <div class="controls"> 
						  	<select class="span3 m-wrap" id="itembank" name="itembankId"  placeholder="请选择题库！" >
								<option value=''>请选择题库</option>
								<c:if test="${itembank!=null}">
									<option value='${itembank.id}' selected>${itembank.name}</option>
								</c:if>
							</select> 
						</div>	
						</div>
						<div class="control-group">
							<label class="control-label" >试题类型：</label>												    
						  <div class="controls">
						  <input class="input-xlarge uneditable-input" id="questiontypename" name="questiontypename"
									type="text" value="${questiontypename}" readonly>
						  	<input class="input-xlarge uneditable-input"id="questiontype" name="questiontype"
									type="hidden" value="${questions.questiontype}" >
						</div>	
						</div>
						<div class="control-group">
						<label class="control-label" >模板下载：</label>	
							<button type="button" id="editoff" class="btn btn-primary" style="margin-left:20px;" onclick="downFile();">下载模版</button>
						</div>
						<div class="control-group">
						<label class="control-label" >导入试题：</label>	
							<input class="input-xlarge uneditable-input" id="file" name="file"
									type="file"  style="margin-left:20px;">
						</div>
						<div class="form-actions">
							<button type="submit" id="savebutton" class="btn btn-primary" >上传</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/item/add'">
						</div>
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
var num =0;
$(document).ready(function() {
		
		$("#messagealert").hide();
		var flagcg = '${flagcg}';
		if(flagcg!=null&&flagcg!=''){
			$("#messagealert").show();
		}
		$("#closebut").click(function(){
			$("#messagealert").hide();
		});
		
		$("#subjectid").change(function(){
			$("#itembank").empty();
			$("#itembank").append("<option value=''>请选择题库</option>");
			var ids = $("#subjectid").val();
			$.ajax({
				type : 'post',
				url : '${basepath}/item/getSelectSubject?id=' + ids,
				cache : false,
				dataType : 'json',
				success : function(data) {
					jQuery.each(data, function(i,item){
		                $("#itembank").append("<option value='"+item.ID+"'>"+item.NAME+"</option>");
		            });
				}
			});
		});
		
		$("#itembank").change(function(){
			$("#questiontypename").val('');
			$("#questiontype").val('');
			var itembankid = $("#itembank").val();
			$.ajax({
				type : 'post',
				url : '${basepath}/item/getQuestionTypeByItemBankId?id=' + itembankid,
				cache : false,
				dataType : 'json',
				success : function(data) {
					$("#questiontypename").val(data.questiontype.DICTVALUE);
					$("#questiontype").val(data.questiontype.DICTKEY);
				}
			});
		});
		
		$('#savebutton').click(function() {
			var file = document.getElementById('file'); 
			if (file.value == "") { 
	            alert("请选择您需要上传的文件！"); 
	            return false;
	         }else{
	        	var jqObj = new JQvalidate();
	       	    var itemform ="itemform"; 
	           	jqObj.setform(subform);
	       	    jqObj.set("subjectId", "required",  "请选择科目!");  
	       	    jqObj.set("itembankId", "required",  "请选择题库!");
	       	    jqObj.Run();
	         }
		});
		
		
 	    
	})
	
	
	function downFile(){
	    window.location.href="${basepath}/item/downloadExcel";
    }

function deloption(numcgg){
	$("#options"+numcgg).remove();
}
</script>
<c:import url="/pages/include/pageFoot.jsp" />