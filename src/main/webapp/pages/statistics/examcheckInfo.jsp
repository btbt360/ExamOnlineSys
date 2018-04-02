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
		<div class="block-content collapse in" >
				<div class="span11 text-center">
						<label class="control-label" ><span class="label label-info"><h2>${examinee.examineename}考试成绩单</h2></span>&nbsp;&nbsp;</label>
					</div>
					<div class="span11 text-center" style="margin-top:2%">
						<div class="span5 text-center">
							<label class="control-label"><span class="label label-info"><h4>${examinee.examId}考试</h4></span></label> 
						</div>
						<div class="span1 text-center"></div>
						<div class="span5 text-center">
							<label class="control-label"><span class="label label-info"><h4>成绩${examinee.totalscore}分</h4></span></label> 
						</div>
					</div>
					<div class="span11 text-center" style="margin-top:2%">
						<label class="control-label" ><span class="label label-info"><B>评价：</B></span>&nbsp;&nbsp;${examinee.remark}</label>
					</div>
					
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>