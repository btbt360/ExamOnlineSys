<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统</title>
</head>
<c:import url="/pages/include/pageHead.jsp" />
<body style="padding-top: 0px;">
	<div class="block" id="info" style="width:95%;margin-left: 2.5%;">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">信息</div>
		</div>
		<div class="block-content collapse in">
			<div class="span11">
							<div class="span3 text-center">
								<label class="control-label" ><h4><span class="label label-info"><h4>考试名称：</h4></span>&nbsp;&nbsp;${exam.name}</h4></label> 
							</div>
							<div class="span3 text-center">
								<label class="control-label" ><h4><span class="label label-info"><h4>考试编号：</h4></span>&nbsp;&nbsp;${exam.code}</h4></label> 
							</div>
							<div class="span4 text-center">
								<label class="control-label"><h4><span class="label label-info"><h4>考生名称：</h4></span>&nbsp;&nbsp;${examinee.examineename}</h4></label> 
							</div>
					</div>
					<div class="span11 text-center" style="margin-top:2%">
							<label class="control-label" for="daotime"><span class="label label-info"><h1>倒计时：</h1></span>
								<span class="time-item">
										<strong id="hour_show"><span class="badge badge-important"><h1>0时</h1></span></strong>
										<strong id="minute_show"><span class="badge badge-important"><h1>0分</h1></span></strong>
										<strong id="second_show"><span class="badge badge-important"><h1>0秒</h1></span></strong>
									</span>
								</label> 
	                        <input class="input-medium focused" id="examId" name="examId" type="hidden" value="${exam.id}" />
					</div>
					
		</div>
	</div>
	<div id="questions"></div>
	<div id="answers"></div>
	<div class="span12 text-center" style="margin-bottom:2%;"><button type='button' class='btn btn-warning btn-large' onclick='jiaojuan()'>交卷</button></div>
</body>
<script type="text/javascript">
var exampapersid ='';
var examid ='';
var examineeid ='';
var answerinfo = '';
var sumqunesions = '';
var awc = [];
$(document).ready(function() {
	var intDiff = '${exam.enddistancetime}';
	timer(intDiff);
	exampapersid = '${exam.exampapersId}';
	examid = '${exam.id}';
	examineeid = '${examinee.id}';
	sumqunesions = '${sumqunesions}';
	awc = randomsw(sumqunesions);
	getQuestions(awc);
	getAnswers(awc);
	$('input').iCheck({
		checkboxClass: 'icheckbox_minimal-red',
		radioClass: 'iradio_minimal-red',
		increaseArea: '20%' // optional
	});
});
var timerss;
function randomsw(num){
	var arr=new Array();
	for(var i=0;i<num;i++){
		while(true){
			var flag = true;
			var ppp = Math.floor(Math.random()*(num)+1);
			for(var i = 0;i<arr.length; i++){
				if(arr[i] == ppp){
					flag = false;
					break;
				}
			}
			if(flag){
				arr[i] = ppp;
				break;
			}
		}
	}
	return arr;
}
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
	}else{
		$.ajax({
			type : 'post',
			url : '${basepath}/examinee/getHandExam?examineeid='+examineeid,
			cache : false,
			dataType : 'json',
			success : function(data) {
				alert(data.message);
				clockclosewindle(3);
				clearInterval(timerss);
				return;
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
function clockclosewindle(i)
{
	i=i-1
	document.title="本窗口将在" + i + "秒后自动关闭!";
	if(i>0)setTimeout("clockclosewindle();",1000);
	else closewin();
}
function closewin()
{
	self.opener=null;
	self.close();
}

function getQuestions(numarr){
	if(numarr==null||numarr==''){
		numarr = awc;
	}
	var numarrstr = '';
	for(var i = 0 ;i<numarr.length;i++){
		numarrstr = numarr[i]+"|"+numarrstr;
	}
	$.ajax({
		type : 'post',
		url : '${basepath}/examinee/getQuestions?exampapersid='+exampapersid+'&examid='+examid+'&examineeid='+examineeid+'&sorts=1&numarrstr='+numarrstr,
		cache : false,
		dataType : 'json',
		success : function(data) {
			$("#questions").append("<h4>"+data.questionstr.replace("<p>","").replace("</p>","")+"</h4>");
		}
	});
}

function getAnswers(numarr){
	if(numarr==null||numarr==''){
		numarr = awc;
	}
	var numarrstr = '';
	for(var i = 0 ;i<numarr.length;i++){
		numarrstr = numarr[i]+"|"+numarrstr;
	}
	$.ajax({
		type : 'post',
		url : '${basepath}/examinee/getAnswers?exampapersid='+exampapersid+'&examid='+examid+'&examineeid='+examineeid+'&numarrstr='+numarrstr,
		cache : false,
		dataType : 'json',
		success : function(data) {
			$("#answers").append(data.eqstr);
		}
	});
}
function updateanswer(questionid,sort,answerTypestr){
	var strss='';
	if(answerTypestr=='answeroption_'){
		$("input[id^='"+answerTypestr+"']").each(function(i){
			if($(this).is(':checked')){
				strss = strss+$(this).val();
			}
	    });
	}else if(answerTypestr='answerwd'){
		strss=$("#answerwd").val();
	}

	var numarrstr = '';
	for(var i = 0 ;i<awc.length;i++){
		numarrstr = awc[i]+"|"+numarrstr;
	}
	$.ajax({
		type : 'post',
		url : '${basepath}/examinee/getQuestions?exampapersid='+exampapersid+'&examid='+examid+'&examineeid='+examineeid+'&sorts='+sort+'&numarrstr='+numarrstr,
		cache : false,
		dataType : 'json',
		success : function(data) {
			$("#questions").empty();
			$("#questions").append("<h4>"+data.questionstr.replace("<p>","").replace("</p>","")+"</h4>");
		}
	});
}
function nextQuestion(sort,hqstr,questionid,answers){
	$("#checknext").hide();
	answerinfo = answers;
	var strss='';
	if(hqstr=='answeroption_'){
		$("input[id^='"+hqstr+"']").each(function(i){
			if($(this).is(':checked')){
				strss = strss+$(this).val();
			}
	    });
	}else if(hqstr='answerwd'){
		strss=$("#answerwd").val();
	}
	if(strss==''||strss==null){
		if (confirm("当前题目未做回答，是否要进行下一题？")) {
			
		}else{
			return false;
		}
	}
	var numarrstr = '';
	for(var i = 0 ;i<awc.length;i++){
		numarrstr = awc[i]+"|"+numarrstr;
	}
	$.ajax({
		type : 'post',
		url : '${basepath}/examinee/getUpdateQuestionAnswer?exampapersid='+exampapersid+'&examid='+examid
				+'&examineeid='+examineeid+'&sort='+sort+'&answer='+strss+'&questionid='+questionid+'&numarrstr='+numarrstr,
		cache : false,
		dataType : 'json',
		success : function(data) {
			if(data.flag==1){
				alert("您已经下机，请联系监考员！");
				$.ajax({
					type : 'post',
					url : '${basepath}/examinee/getHandExam?examineeid='+examineeid,
					cache : false,
					dataType : 'json',
					success : function(data) {
						alert(data.message);
						clockclosewindle(3);
						clearInterval(timerss);
					}
				});
				return false;
			}
			$("#questions").empty();
			$("#answers").empty();
			$("#questions").append("<h4>"+data.questionstr.replace("<p>","").replace("</p>","")+"</h4>");
			$("#answers").append(data.eqstr);
		}
	});
}
function jiaojuan(){
	if (confirm("确定交卷？")) {
		$.ajax({
			type : 'post',
			url : '${basepath}/examinee/getHandExam?examineeid='+examineeid+'&examid='+examid+'&exampapersid='+exampapersid,
			cache : false,
			dataType : 'json',
			success : function(data) {
				alert(data.message);
				clockclosewindle(3);
				clearInterval(timerss);
			}
		});
	}
}
</script>
</html>