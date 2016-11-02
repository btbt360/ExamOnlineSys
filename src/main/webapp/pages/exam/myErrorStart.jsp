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
			<div class="muted pull-left">错题练习</div>
		</div>
		<div class="block-content collapse in">
			<div class="span11">
							<div class="span4 text-center">
								<label class="control-label"><h4><span class="label label-info"><h4>用户名称：</h4></span>&nbsp;&nbsp;${examinee.examineename}</h4></label> 
							</div>
					</div>
					
		</div>
	</div>
	<div id="questions"></div>
	<div id="answers"></div>
	<div class="span12 text-center" style="margin-bottom:2%;"><button type='button' class='btn btn-warning btn-large' onclick='closewindows()'>关闭</button></div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	getQuestions();
	getAnswers();
});

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

function getQuestions(){
	$.ajax({
		type : 'post',
		url : '${basepath}/errorsubject/getQuestions?exampapersid='+exampapersid+'&examid='+examid+'&examineeid='+examineeid+'&sorts=0',
		cache : false,
		dataType : 'json',
		success : function(data) {
			$("#questions").append(data.questionstr);
		}
	});
}

function getAnswers(){
	$.ajax({
		type : 'post',
		url : '${basepath}/errorsubject/getAnswers?exampapersid='+exampapersid+'&examid='+examid+'&examineeid='+examineeid,
		cache : false,
		dataType : 'json',
		success : function(data) {
			$("#answers").append(data.eqstr);
		}
	});
}

function nextQuestion(sort,hqstr,questionid){
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
	$.ajax({
		type : 'post',
		url : '${basepath}/errorsubject/getUpdateQuestionAnswer?exampapersid='+exampapersid+'&examid='+examid
				+'&examineeid='+examineeid+'&sort='+sort+'&answer='+strss+'&questionid='+questionid,
		cache : false,
		dataType : 'json',
		success : function(data) {
			if(data.flag==1){
				alert("您已经下机，请联系监考员！");
				$.ajax({
					type : 'post',
					url : '${basepath}/errorsubject/getHandExam?examineeid='+examineeid,
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
			$("#questions").append(data.questionstr);
			$("#answers").append(data.eqstr);
		}
	});
}
function closewindows(){
	clockclosewindle(3);
}
</script>
</html>