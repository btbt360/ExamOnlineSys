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
					<li><a href="#">监控管理</a> <span class="divider">/</span></li>
					<li class="active">在线考试监控</li>
				</ul>
			
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
						<div class="span12">
							<div class="span3 text-center">
								<label class="control-label" ><h4><span class="label label-info"><h4>考试名称：</h4></span>&nbsp;&nbsp;${exam.name}</h4></label> 
							</div>
							<div class="span2 text-center">
								<label class="control-label" ><h4><span class="label label-info"><h4>考试编号：</h4></span>&nbsp;&nbsp;${exam.code}</h4></label> 
							</div>
							<div class="span2 text-center">
								<label class="control-label"><h4><span class="label label-info"><h4>监考员：</h4></span>&nbsp;&nbsp;${userToken.vuser.user.name}</h4></label> 
							</div>
							<div class="span5 text-center">
								<label class="control-label" for="name"><h4><span class="label label-info"><h4>考生名称：</h4></span>
		                                <select  id="name" name="name" class="chzn-select">
		                                <option value=''></option>
		                                	<c:forEach var="examinee" items="${elist}">
												<option value='${examinee.id}'>${examinee.examineename}</option>
											</c:forEach>
		                                </select></h4>
		                        </label>
							</div>
					</div>
					<div class="span12 " style="margin-top:2%">
							<div class="span8 text-center">
							<label class="control-label" for="daotime"><span class="label label-info"><h1>倒计时：</h1></span>
								<span class="time-item">
										<strong id="hour_show"><span class="badge badge-important"><h1>0时</h1></span></strong>
										<strong id="minute_show"><span class="badge badge-important"><h1>0分</h1></span></strong>
										<strong id="second_show"><span class="badge badge-important"><h1>0秒</h1></span></strong>
									</span>
								</label> 
	                        <input class="input-medium focused" id="examId" name="examId" type="hidden" value="${exam.id}" />
	                        </div>
	                        <div class="span4 text-center">
	                        <button class="btn btn-large btn-primary" type="button" id="startexam">开始考试</button>
	                        <button class="btn btn-danger btn-large" type="button" id="endexam">结束考试</button>
	                        </div>
					</div>
						<input type="hidden" id="subpages" name="subpages" />
						<input type="hidden" id="subrp" name="subrp" />
						<input type="hidden" id="fingerpath" name="fingerpath" />
					<table id="userList" class="table table-striped table-bordered">
					
						<thead>
							<tr>
								<th width="10%">机器编号</th>
								<th width="10%">姓名</th>
								<th width="20%">身份证号</th>
								<th width="15%">指纹对比</th>
								<th width="30%">头像</th>
								<th width="15%">操作</th>
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
	var intDiffs = parseInt(3600);//倒计时总秒数量
	var timerss;
	var examineeitemid='';
	function timer(intDiff){
		timerss=window.setInterval(function(){
		var day=0,
			hour=0,
			minute=0,
			second=0;//时间默认值		
		if(intDiff > 0){
			day = Math.floor(intDiff / (60 * 60 * 24));
			hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
			minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
			second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
			$.ajax({
				type : 'post',
				url : '${basepath}/invigilate/getRemainingTime?id='+$("#examId").val()+'&enddistancetime='+intDiff,
				cache : false,
				dataType : 'json',
				success : function(data) {
					//更新剩余时间
				}
			});
		}else{
			$.ajax({
				type : 'post',
				url : '${basepath}/invigilate/gettofinish?id=' + $("#examId").val(),
				cache : false,
				dataType : 'json',
				success : function(data) {
					alert(data);
					reshcg();
				}
			});
		}
		if (minute <= 9) minute = '0' + minute;
		if (second <= 9) second = '0' + second;
		$('#hour_show').html('<span class="badge badge-important"><h1>'+hour+'时</h1></span>');
		$('#minute_show').html('<span class="badge badge-important"><h1>'+minute+'分</h1></span>');
		$('#second_show').html('<span class="badge badge-important"><h1>'+second+'秒</h1></span>');
		intDiff--;
		}, 1000);
	} 
	//考生下机
	function goDown(ids) {
		if (confirm("是否将该考生执行下机？")) {
			$.ajax({
				type : 'post',
				url : '${basepath}/invigilate/getgoDown?id=' + ids,
				cache : false,
				dataType : 'json',
				success : function(data) {
					alert(data.message);
					reshcg();
				}
			});
		}
	}
	//上传指纹
	function fingerprint(ids) {
		var fingerpath=$("#fingerpath").val();
		$.ajax({
			type : 'post',
			url : '${basepath}/invigilate/getfingerprint?id=' + ids+'&fingerpath='+fingerpath,
			cache : false,
			dataType : 'json',
			success : function(data) {
				alert(data.message);
				reshcg();
			}
		});
	}
	//考生缺考
	function toAbsent(ids) {
		if (confirm("是否将该考生设为缺考？")) {
			$.ajax({
				type : 'post',
				url : '${basepath}/invigilate/gettoAbsent?id='+ids,
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
		$(document).bind("contextmenu",function(e) { 
			alert("不能进行右键操作！"); 
			return false; 
		});
		$(document).bind("keydown",function(e){ 
			e=window.event||e; 
			if(e.keyCode==116){ 
				e.keyCode = 0; 
				alert("正在考试不要进行刷新操作！"); 
				return false; 
			} 
		}); 
		$(".chzn-select").chosen();
		var examId = $("#examId").val();
		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/invigilate/getEETable"
		});
		$(".uniform_on").uniform();
		//开始考试
		$("#startexam").click(function() {
			$.ajax({
				type : 'post',
				url : '${basepath}/invigilate/gettoStart?id=' + examId,
				cache : false,
				dataType : 'json',
				success : function(data) {
					alert("开始考试！");
					alert(data.message);
					timer(Number(data.message)*3600);
					reshcg();
				}
			});
			
			$("#startexam").hide();
			$("#endexam").show();
		});
		//结束考试
		$("#endexam").click(function(){
			if (confirm("确定停止该考试？")) {
				$.ajax({
					type : 'post',
					url : '${basepath}/invigilate/gettofinish?id=' + examId,
					cache : false,
					dataType : 'json',
					success : function(data) {
						alert(data.message);
						reshcg();
					}
				});
				clearInterval(timerss);
				$('#hour_show').html('<span class="badge badge-important"><h1>0时</h1></span>');
				$('#minute_show').html('<span class="badge badge-important"><h1>0分</h1></span>');
				$('#second_show').html('<span class="badge badge-important"><h1>0秒</h1></span>');
			}
			$("#endexam").hide();
		});
		$("#name").change(function(){
			reshcg();
		});
		$("#endexam").hide();
	});
	function reshcg() {
		var examineeId = $('#name').val();
		var oSettings = [ {
			"name" : "examineeId",
			"value" : examineeId
		}];
		oTable.gridSearch(this, oSettings);
	}
	//使用input框打开ckfinder
	function BrowseServer(inputId,id) {
		var finder = new CKFinder();
		finder.basePath = '${basepath}/ckfinder'; //导入CKFinder的路径 
		finder.selectActionFunction = SetFileField; //设置文件被选中时的函数 
		finder.selectActionData = inputId; //接收地址的input ID 
		finder.popup();
		examineeitemid = id;
	}
	//文件选中时执行 
	function SetFileField(fileUrl, data) {
		document.getElementById(data["selectActionData"]).value = fileUrl;
		var ids=examineeitemid!=null&&examineeitemid!=''?examineeitemid:"";
		$.ajax({
			type : 'post',
			url : '${basepath}/invigilate/getSculpturepath?id='+ids+'&sculpturepath='+fileUrl,
			cache : false,
			dataType : 'json',
			success : function(data) {
				alert(data.message);
				reshcg();
			}
		});
	}
</script>
<c:import url="/pages/include/pageFoot.jsp" />