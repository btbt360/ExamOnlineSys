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
					<li class="active">试卷管理</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/exampapers/add">试卷列表</a></li>
			<li><a href="${basepath}/exampapers/addinfo">试卷添加</a></li>
			<li class="active"><a href="${basepath}/exampapers/addExampapersChoose">试卷选题</a></li>
		</ul>
			<div class="span11 text-center" style="margin-left:4%;">
				<div <c:if test="${flagcg==1}">class="alert alert-success"</c:if>
					 <c:if test="${flagcg==0}">class="alert alert-error"</c:if>
					 style="margin-right: 8%;text-align: center;" id ="messagealert">
						<button class="close" id="closebut">&times;</button>
						<c:if test="${flagcg==1}"><strong>保存成功！</strong></c:if>
						<c:if test="${flagcg==0}"><strong>保存失败！</strong></c:if>
				</div>
				<form id="subinfoform" class="form-horizontal" action="${basepath}/subject/savesub" method="post">
					<fieldset>
						<legend class="text-right"><button type="submit" class="btn btn-primary">自动抽取</button></legend>
						<div class="control-group">
							<label class="control-label" for="exampapersid">试卷选择：</label>
							<div class="controls">
								<select class="m-wrap" id="exampapersid" name="exampapersid" placeholder="请选择试卷！">
										<option value=''>请选择试卷</option>
										<c:forEach var="exampapers" items="${exampaperslist}">
											<option value='${exampapers.id}'>${exampapers.name} | ${exampapers.code}</option>
										</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="subjectid">科目选择：</label>
							<div class="controls">
								<select class="m-wrap" id="subjectid" name="subjectid" placeholder="请选择科目！">
										<option value=''>请选择科目</option>
										<c:forEach var="subject" items="${subjectlist}">
											<option value='${subject.id}'>${subject.name}</option>
										</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="questiontypeid">试题类型：</label>
							<div class="controls">
								<select class="m-wrap" id="questiontypeid" name="questiontypeid" placeholder="请选择试题类型！">
										<option value=''>请选择试题类型</option>
										<c:forEach var="dict" items="${dictlist}">
											<option value='${dict.dictkey}'>${dict.dictvalue}</option>
										</c:forEach>
								</select>
							</div>
						</div>
						<label class="control-label" for="itembankid">试题题库：</label>
						<div  class="text-left" id="cress">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="itembankid"  name="itembankid" placeholder="请选择试题题库！" multiple="multiple" class="chzn-select m-wrap">
						</select></div><div  class="text-left" id="cresscg"></div>
					</fieldset>
				</form>
				<table id="userList" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th width="10%">序号</th>
								<th width="20%">试题编码</th>
								<th width="50%">试题标题</th>
								<th width="20%">操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<!-- tbody是必须的 -->
				</table>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
		$(".chzn-select").chosen();
		$("#messagealert").hide();
		var flagcg = '${flagcg}';
		if(flagcg!=null&&flagcg!=''){
			$("#messagealert").show();
		}
		$("#closebut").click(function(){
			$("#messagealert").hide();
		});
		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/exampapers/finaQuestionsChoose"
		});
		$("#query").click(function() {
			reshcg();
		});
		
		$("#questiontypeid").change(function(){
			var questiontypeid = $(this).val();
			var subjectid = $("#subjectid").val();
			$.ajax({
				type : 'post',
				url : '${basepath}/exampapers/getItembankBySubQtid?questiontypeid='+questiontypeid+'&subjectid='+subjectid,
				cache : false,
				dataType : 'json',
				success : function(data) {
					$("#cress").empty();
					var html="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id='itembankid'  name='itembankid' placeholder='请选择试题题库！' multiple='multiple' class='chzn-select m-wrap'>";
					jQuery.each(data, function(i,item){
						 html=html+"<option value='"+item.ID+"'>"+item.NAME+"</option>";
		            });
					html=html+"</select>";
					$("#cress").append(html);
					$(".chzn-select").chosen();
					reshcg();
				}
			});
			
		});
		var jqObj = new JQvalidate();
 	    var subform ="subinfoform"; 
     	jqObj.setform(subform);
 	    jqObj.set("exampapersid", "required",  "请输入科目名称!");  
 	    jqObj.set("subjectid", "required",  "请输入科目编码!");
 	    jqObj.set("questiontypeid", "required",  "请输入科目编码!");
 	    jqObj.set("itembankid", "required",  "请输入科目编码!");
 	    jqObj.Run();
	});
function reshcg() {
	var exampapersid = $('#exampapersid').val();
	var subjectid = $('#subjectid').val();
	var questiontypeid = $('#questiontypeid').val();
	var itembankid = $('#itembankid').val();
	var oSettings = [ {
		"name" : "exampapersid",
		"value" : exampapersid
	}, {
		"name" : "subjectid",
		"value" : subjectid
	}, {
		"name" : "questiontypeid",
		"value" : questiontypeid
	}, {
		"name" : "itembankid",
		"value" : itembankid
	}  ];
	oTable.gridSearch(this, oSettings);
}
function removebut(id){
	alert(id);
}
function addbut(id){
	alert(id);
}
</script>
<c:import url="/pages/include/pageFoot.jsp" />