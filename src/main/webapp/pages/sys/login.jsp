<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String baseURL=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<c:import url="/pages/include/pageHead.jsp" />
<style>
body{
	background:url(static/img/login_bg.jpg) no-repeat;
	 background-size:100%;
	 background-color:#037192}
.logo{
		text-align:center;
		padding-top:6%; 
		padding-bottom:4%;}
	
</style>
<script type="text/javascript">

$(document).ready(function() {
	$("#error").hide();
	$("#loginbutton").click(function(){
		if(verification()==false){
			return false;
		};
	});
	var msg ='${msg}';
	if(msg!=null&&msg!=''){
		$("#error").show();
		$("#msg").html(msg);
	}
	$("#closealerterror").click(function(){
		$("#error").hide();
		return false;
	});

});
function verification(){
	var userloginName =$("#userloginName").val();
	var userpassword =$("#userpassword").val();
	var captcha =$("#captcha").val();
	if(userloginName==null||userloginName==''){
		$("#error").show();
		$("#msg").html("请输入用户名");
		return false;
	}
	if(userpassword==null||userpassword==''){
		$("#error").show();
		$("#msg").html("请输入密码");
		return false;
	}
	if(captcha==null||captcha==''){
		$("#error").show();
		$("#msg").html("请输入验证码");
		return false;
	}
}
</script>
</head>
<body id="login" >
<div class="logo"><div style="font-size: 40px;">JfinalYBaseV1.0</div></div>


<div class="container">
<form class="form-signin" id="loginform" method="post" action="${basepath}/doLogin">
 <input type="text" class="input-block-level" placeholder="用户名" name="username" id="userloginName" /><br>
  
       <input type="password" class="input-block-level" placeholder="密码" name="password" id="userpassword" /><br>
       <img src="${basepath}/img"/><br/>
      <input type="text" class="input-block-level" placeholder="验证码" name="captcha" id="captcha" /><br>
	  	<div class="alert alert-error" id="error">
				<button id="closealerterror" class="close" >&times;</button>
				<strong><span id="msg" ></span></strong>
		</div>
        <button class="btn btn-large btn-block btn-info" type="submit"  id="loginbutton" >登录</button>
</form>
</div>



</body>
<script >
$(function(){
	//回车登录
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	if(verification()==false){
				return false;
			};
	    	$('#loginform').submit();
	     }
	 }
});  
</script>
</html>