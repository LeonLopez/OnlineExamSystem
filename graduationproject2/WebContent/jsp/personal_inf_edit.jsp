
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人中心</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/register.css">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<style>
#editBtn {
	margin-bottom: 30px;
	background-color: #307ac1;
	color: white;
}

#submitBtn {
	background-color: #ff730e;
	color: white;
	margin-top: 20px;
	margin-left: 180px;
}

input.error {
	border: 1px solid #E6594E;
}

input.highlight {
	border: 1px solid #7abd54;
}

label.error {
	height: 30px;
	line-height: 30px;
	font-size: 14px;
	text-align: left;
	margin-left: 5px;
	padding-left: 35px;
	font-size: 14px;
	margin-left: 5px;
	padding-left: 35px;
	color: red;
	background: url('${pageContext.request.contextPath }/images/error.png') no-repeat left center;
}

label.tip {
	height: 30px;
	line-height: 30px;
	font-size: 14px;
	text-align: left;
	margin-left: 5px;
	padding-left: 35px;
	color: #aaa;
	background: url('${pageContext.request.contextPath }/images/tip.png') no-repeat left center;
}

label.valid {
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	background: url('${pageContext.request.contextPath }/images/valid.png') no-repeat left center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form role="form" action="${pageContext.request.contextPath }/updatePersonalInfo.action" method="post" id="ff">
					<input type="button" class="btn btn-default" id="editBtn"
						value="编辑" />
					<fieldset id="fieldset" disabled="disabled">
						<div>
							<span>账号：</span><input style="border: 2px solid #307ac1"
								type="text" id="username" class="username" name="name"
								value='${student.name }' readonly />

							<div class="tips"></div>
						</div>

						<div>
							<span>密码：</span><input style="border: 2px solid #307ac1"
								type="password" id="password" class="password" name="password"
								value='${student.password }'>

							<div class="tips"></div>
						</div>


						<div class="sex">
							<span>性别：</span><label class="radio-inline"> <input
								type="radio" name="sex" id="sex" value="男"
								" <c:if test="${student.sex== '男'}">checked="checked"</c:if>>男
							</label> <label class="radio-inline"> <input type="radio"
								name="sex" id="sex" value="女"
								<c:if test="${student.sex== '女'}">checked="checked"</c:if>>女
							</label>
						</div>
						<div>
							<span>专业：</span><input style="border: 2px solid #307ac1"
								type="text" id="profession" class="profession" name="profession"
								value='${student.profession }'>

						</div>
						<div>
							<span>班级：</span><input style="border: 2px solid #307ac1"
								type="text" id="clazz" class="clazz" name="clazz"
								value='${student.clazz }'>

						</div>
						<div>
							<span>邮箱：</span><input style="border: 2px solid #307ac1"
								type="text" id="email" class="email" name="email"
								value='${student.email }'>

							<div class="tips"></div>
						</div>



						<input type="submit" class="btn btn-default" id="submitBtn"
							name="submit" value="确认修改">
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/scripts/jquery-1.11.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.validate.extend.js"></script>
	<script type="text/javascript">
    	$(function(){
    		$("#editBtn").click(function() {
				$("#fieldset").removeAttr("disabled");
			});
    		//让当前表单调用validate方法，实现表单验证功能
    		$("#ff").validate({
    			rules:{		//配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
    				name:{
    					required:true,	//必填。如果验证方法不需要参数，则配置为true
    					rangelength:[6,16],
    					
    				},
    				password:{
    					required:true,
    					rangelength:[6,16]
    				},
    				profession:{
						required:true
        				},
    				clazz:{
    					digits:true,
        			},
    				email:{
    					required:true,
    					email:true
    				},
    				
    			},
    			messages:{
    				name:{
    					required:"请输入用户名",
    					rangelength:$.validator.format("用户名长度为{0}-{1}个字符"),
    					//remote:"该用户名已存在！"
    				},
    				password:{
    					required:"请输入密码",
    					rangelength:$.validator.format("密码长度为{0}-{1}个字符")
    				},
    				profession:{
    					required:"请输入专业",
    				},
    				clazz:{
    					digits:"请输入纯数字"
    					
    				},
    				email:{
    					required:"请填写邮件",
    					email:"邮箱格式不正确"
    				},
    				
    			}
    		});
    	});
    </script>
	
	
</body>
</html>
