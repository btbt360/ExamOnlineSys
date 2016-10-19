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
					<li class="active">试题管理</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/questions/add">试题列表</a></li>
			<li class="active"><a href="${basepath}/questions/addinfo">试题添加</a></li>
		</ul>
			<div class="span12">
				<div <c:if test="${returninfo.result==0}">class="alert alert-success"</c:if>
					 <c:if test="${returninfo.result==1}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<strong>${returninfo.resultInfo}</strong>
				</div>
				<form id="questioninfoform" class="form-horizontal" action="${basepath}/question/save" method="post">
					<fieldset>
						<legend>试题管理</legend>
						<div class="control-group">
							<label class="control-label" >属于科目：</label>												    
						  <div class="controls">  <select class="span3 m-wrap" id="subjectid" name="question.subjectId"  placeholder="请选择科目！" >
								<option value=''>请选择科目</option>
								<c:forEach var="subject" items="${subjectlist}">
								<option
									<c:if test="${subject.id==question.subjectId}">selected</c:if>
									value='${subject.id}'>${subject.name}</option>
							</c:forEach>
							</select> 
							<input name="question.id" type="hidden" value="${question.id}" >
						</div>	
						</div>
						<div class="control-group">
							<label class="control-label" >属于题库：</label>												    
						  <div class="controls">  
						  	<select class="span3 m-wrap" id="itembank" name="question.itembankId"  placeholder="请选择题库！" >
								<option value=''>请选择题库</option>
								<c:if test="${itembank!=null}">
									<option value='${itembank.id}'>${itembank.name}</option>
								</c:if>
							</select> 
						</div>	
						</div>
						<div class="control-group">
							<label class="control-label" >试题类型：</label>												    
						  <div class="controls">
						  <input class="input-xlarge uneditable-input" id="questiontypename" name="questiontypename"
									type="text" value="${questiontypename}" >
						  	<input class="input-xlarge uneditable-input"id="questiontype" name="question.questiontype"
									type="hidden" value="${question.questiontype}" >
						</div>	
						</div>
						<div class="control-group">
							<label class="control-label">试题编码：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="code" name="question.code"
									type="text" placeholder="请输入试题编码!" value="${question.code}" >
							</div>
						</div>
						<div class="control-group" >
							<label class="control-label">试题内容：</label>
							<div class="controls">
								<textarea id="cgtitle" name="question.title"></textarea>
							</div>
						</div>
						<div id="content"></div>
						<c:choose>
						<c:when test="${question.questiontype<3}">
							<div class="control-group" id="operationadd">
								<label class="control-label">选项添加：</label>
								<div class="controls">
									<button class="btn btn-success" id="addbutton"><i class="icon-plus-sign icon-white"></i> 添加</button>
								</div>
							</div>
							<div class="control-group"  id="operationanswer">
								<label class="control-label">试题答案：</label>
								<div class="controls">
									<input class="input-xlarge focused" id="questionanswer" name="question.questionanswer"
									type="text" value="${question.questionanswer}" placeholder="请输入试题答案!">
								</div>
							</div>
						</c:when>
						<c:when test="${question.questiontype==3}">
							<div class="control-group" id="panduananswer">
								<label class="control-label">试题答案：</label>
								<div class="controls">
									<label for="questionanswer">&nbsp;&nbsp;对&nbsp;&nbsp;
									<input type="radio" id="questionanswer0" value="1" name="question.questionanswer" checked
									<c:if test="${question.questionanswer=='1'}">checked</c:if> />
									</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="questionanswer1">&nbsp;&nbsp;错&nbsp;&nbsp;
									<input type="radio" id="questionanswer1" value="0" name="question.questionanswer"
									<c:if test="${question.questionanswer=='0'}">checked</c:if> />
									</label>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="control-group" id="wendaanswer">
								<label class="control-label">试题答案：</label>
								<div class="controls">
									<textarea id="questionanswer" name="question.questionanswer" placeholder="请输入试题答案!" rows="10" style="width: 50%;" >${question.questionanswer}</textarea>
								</div>
							</div>
						</c:otherwise>
						</c:choose>
						<div class="control-group">
								<label class="control-label">试题描述：</label>
								<div class="controls">
									<textarea id="info" name="question.info" placeholder="请输入试题描述!" rows="10" style="width: 50%;" >${question.info}</textarea>
								</div>
						</div>
						<div class="control-group">
								<label class="control-label">试题解答：</label>
								<div class="controls">
									<textarea id="questionanswerinfo" name="question.questionanswerinfo" placeholder="请输入试题解答!" rows="10" style="width: 50%;" >${question.questionanswerinfo}</textarea>
								</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp;
								<input type="radio" id="login_flag0" value="1" name="question.isenable" checked
								<c:if test="${question.isenable==1}">checked</c:if> />
								</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0" name="question.isenable"
								<c:if test="${question.isenable==0}">checked</c:if> />
								</label>
							</div>
						</div> 
							
						<div class="form-actions">
							<button type="submit" id="savebutton" class="btn btn-primary" >保存</button>							
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/case/add'">
						</div>
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
var num =0;
$(document).ready(function() {
	
		var editor = null;
		editor = CKEDITOR.replace('question.title'); //参数‘content’是textarea元素的name属性值，而非id属性值
		
		$("#messagealert").hide();
		var returninfo = '${returninfo}';
		if(returninfo!=null&&returninfo!=''){
			$("#messagealert").show();
		}
		$("#closebut").click(function(){
			$("#messagealert").hide();
		});
		var questiontitle = '${question.title}';
		if(questiontitle!=null&&questiontitle!=''){
			editor.setData(questiontitle);
		}
		var questionoptionslist ='${questionoptionslist}';
		if(questionoptionslist!=null){
			var listsize=0;
			$.each(questionoptionslist, function(i,item){
				var addhtml='<div class="span12" id="options'+i+'">'+
				'<div class="span3">'+
				'<input class="input-mini focused" id="intitle_'+i+'" name="questionoptionslist['+i+'].questionoptions.code" type="text" value="${questionoptionslist['+i+'].questionoptions.code}"></div>'+
				'<div class="span6">'+
				'<input class="input-xlarge focused" id="incontant_'+i+'" name="questionoptionslist['+i+'].questionoptions.contant" type="text" value="${questionoptionslist['+i+'].questionoptions.contant}"></div>'+
				'<div class="span3">'+
				'<button class="btn btn-danger" onclick="deloption('+i+')" type="button"><i class="icon-remove icon-white"></i> 删除</button>'+
				'</div></div>';
				$("#addbutton").append(addhtml);
				listsize = i;
            });
			num= num+listsize;
		}
		
		
			
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
					if(data.questiontype.DICTKEY<3){
						$("#panduananswer").remove();
						$("#wendaanswer").remove();
						var cghtml='<div class="control-group" id="operationadd">'+
						'<label class="control-label">选项添加：</label>'+
						'<div class="controls">'+
						'<button class="btn btn-success" onclick="addbutton()" type="button"><i class="icon-plus-sign icon-white"></i> 添加</button></div></div>'+
						'<div class="control-group"  id="operationanswer">'+
						'<label class="control-label">试题答案：</label>'+
						'<div class="controls">'+
						'<input class="input-xlarge focused" id="questionanswer" name="question.questionanswer" type="text" value="${question.questionanswer}" placeholder="请输入试题答案!">'+
						'</div></div>';
						$("#content").append(cghtml);
					}else if(data.questiontype.DICTKEY==3){
						$("#operationadd").remove();
						$("#operationanswer").remove();
						$("#wendaanswer").remove();
						var cghtml='<div class="control-group" id="panduananswer">'+
						'<label class="control-label">试题答案：</label>'+
						'<div class="controls">'+
						'<label for="questionanswer">&nbsp;&nbsp;对&nbsp;&nbsp;<input type="radio" id="questionanswer0" value="1" name="question.questionanswer" checked'+
						'<c:if test="${question.questionanswer==1}">checked</c:if> />'+
						'</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="questionanswer1">&nbsp;&nbsp;错&nbsp;&nbsp;'+
						'<input type="radio" id="questionanswer1" value="0" name="question.questionanswer"'+
						'<c:if test="${question.questionanswer==0}">checked</c:if> />'+
						'</label></div></div>';
						$("#content").append(cghtml);
					}else{
						$("#operationadd").remove();
						$("#operationanswer").remove();
						$("#panduananswer").remove();
						var cghtml='<div class="control-group" id="wendaanswer">'+
						'<label class="control-label">试题答案：</label>'+
						'<div class="controls">'+
						'<textarea id="questionanswer" name="question.questionanswer" placeholder="请输入试题答案!" rows="10" style="width: 50%;" >${question.questionanswer}</textarea>'+
						'</div></div>';
						$("#content").append(cghtml);
					}
				}
			});
		});
		
		var jqObj = new JQvalidate();
 	    var subform ="questioninfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("question.subjectId", "required",  "请选择科目!");  
 	    jqObj.set("question.itembankId", "required",  "请选择题库!");	 
 	    jqObj.set("question.code", "required",  "请输入试题编码!");
 	    jqObj.set("question.questionanswer", "required",  "请输入试题答案!");
 	    jqObj.Run();
 	   $("#savebutton").click(function(){
 		  if(editor.getData()==null||editor.getData()==''){
 			  alert("请填写试题内容！");
 			  return false;
 		  }
 		  editor.updateElement();
 	   });
 	    
	})
function addbutton(){
			var tines= 0;
			$("input[id^='intitle_']").each(function(i){
				if($(this).val()==null||$(this).val()==''){
					alert("请输入选项编码");
					$(this).focus();
					tines = -1;
					return false;
				}
		    }); 
			if(tines<0){
				return false;
			}
			$("input[id^='incontant_']").each(function(i){
				if($(this).val()==null||$(this).val()==''){
					alert("请输入选项内容");
					$(this).focus();
					tines = -1;
					return false;
				}
		    });
			if(tines<0){
				return false;
			}
			var addhtml='<div class="span12 text-center" id="options'+num+'" style="margin-top:1%;">'+
			'<div class="span1"></div>'+
			'<div class="span7">'+
			'选项编码：<input class="input-mini focused"  id="intitle_'+num+'" name="questionoptionslist['+num+'].questionoptions.code" type="text" >&nbsp;&nbsp;'+
			'选项内容：<input class="input-xlarge focused" id="incontant_'+num+'" name="questionoptionslist['+num+'].questionoptions.contant" type="text" ></div>'+
			'<div class="span4 text-left">'+
			'<button class="btn btn-danger" onclick="deloption('+num+')" type="button"><i class="icon-remove icon-white"></i> 删除</button>'+
			'</div></div>';
			$("#operationadd").append(addhtml);
			num=num+1;
		};
function deloption(numcgg){
	$("#options"+numcgg).remove();
}
</script>
<c:import url="/pages/include/pageFoot.jsp" />