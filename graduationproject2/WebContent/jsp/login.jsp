<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>课程考试系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/new_logo.ico" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no;">
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${pageContext.request.contextPath }/styles/loading.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/styles.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/styles/login-reg-style.css">
<style>
/*input:-webkit-autofill {*/
/*-webkit-box-shadow: 0 0 0px 1000px white inset;*/
/*border: none;*/
/*}*/
</style>
</head>

<body id="login" class="login">
	<div class="login-wrap">
		<div class="bg-pic">
			<img class="img-bg" src="${pageContext.request.contextPath }/images/login-bg-small.jpg">
		</div>
		<div class="login-content-wrap">
			<div class="login-content">
				<form action="${pageContext.request.contextPath }/login.action"  class="login-form" method="post" >
					<img src="${pageContext.request.contextPath }/images/logo.png" alt="logo" class="logo">
					<div class="main-error-tips" id="errormsg">${message }</div>

					
					<div class="username">
						<span><img src="${pageContext.request.contextPath }/images/name.png"></span> <span>|</span> <input
							type="text" name="name" id="name" placeholder="账号"
							class="userNameInput">
					</div>
					<div class="password">
						 <span><img src="${pageContext.request.contextPath }/images/password.png"></span><span>|</span> <input
							type="password" name="password" id="password" placeholder="密码"
							class="passwordInput">
					</div>
					<div class="remember">
					</div><button type="submit" class="btn btn-login btn-primary">登录</button>
					 <a href="${pageContext.request.contextPath }/jsp/register.jsp" class="btn-regist">注册考生账号</a>

					<div class="login-content-footer"></div>
				</form>

			</div>
		</div>
	</div>

</body>
</html>