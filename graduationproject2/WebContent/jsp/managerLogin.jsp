<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统登录</title>

<link href="../styles/main.css" rel="stylesheet" type="text/css" />

</head>
<body>


	<div class="login">
		<div class="box png">
			<div class="logo png"></div>
			<div class="input">
				
					<div class="log">
					<form
					action="${pageContext.request.contextPath }/managerLogin.action"
					method="post">
						<div class="name">
							<label>账号</label><input type="text" class="text" id="value_1"
								 name="name" tabindex="1" />
						</div>
						<div class="pwd">
							<label>密码</label><input type="password" class="text" id="value_2"
								 name="password" tabindex="2"><input
								type="submit" class="submit" tabindex="3" value="登录" />
							<div class="check"></div>
						</div>
						</form>
						<div class="tip">${message}</div>
					</div>
				
			</div>
		</div>
		<div class="air-balloon ab-1 png"></div>
		<div class="air-balloon ab-2 png"></div>
		<div class="footer"></div>
	</div>

	<script type="text/javascript" src="../scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../scripts/fun.base.js"></script>
	<script type="text/javascript" src="../scripts/script.js"></script>


	<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->

</body>
</html>