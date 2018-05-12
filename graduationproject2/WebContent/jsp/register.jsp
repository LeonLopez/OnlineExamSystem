<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="../styles/register.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<style type="text/css" > 
input.error{
    border: 1px solid #E6594E;
}

input.highlight{
    border: 1px solid #7abd54;
}
label.error{
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
    background: url('../images/error.png') no-repeat left center;
}

label.tip{
    height: 30px;
    line-height: 30px;
    font-size: 14px;
    text-align: left;
    margin-left: 5px;
    padding-left: 35px;
    color: #aaa;
    background: url('../images/tip.png') no-repeat left center;
}

label.valid{
	height: 30px;
    line-height: 30px;
    vertical-align: middle;
    background: url('../images/valid.png') no-repeat left center;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.validate.extend.js"></script>
<script type="text/javascript">
    	$(function(){

    		//让当前表单调用validate方法，实现表单验证功能
    		$("#ff").validate({
    			rules:{		//配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
    				name:{
    					required:true,	//必填。如果验证方法不需要参数，则配置为true
    					rangelength:[6,16],
    					/*remote: {
    				          type: "post",
    				          url: "${pageContext.request.contextPath }/checkStudentExits.action",
    				          data: {
    				            name: function() {
    				              return $("#username").val();
    				            }
    				          },
    				          dataType: "json",
    				          dataFilter: function(data, type) {
    				            if (data == "true")
    				              return true;
    				            else
    				              return false;
    				          }
    				        }*/
    				},
    				password:{
    					required:true,
    					rangelength:[6,16]
    				},
    				sure_password:{
    					required:true,
    					equalTo:'#password' 
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
    				sure_password:{
    					required:"请再次输入密码",
    					equalTo:"两次密码必须一致" 
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
</head>

<body>
	<div class="header">
		<a href="index.php"><img
			src="${pageContext.request.contextPath }/images/logo.png" alt=""></a>
		<h2 class="title_1">课程考试系统</h2>
		<h2 class="title_2">Course examination System</h2>

		<div class="clear"></div>
	</div>

	<div class="content">
		<div id="form" style="width: 580px;">

			<form id="ff" action="${pageContext.request.contextPath }/register.action" method="post" accept-charset="utf-8">
				<div>
					<span>账号：</span><input style="border: 2px solid #307ac1"
						type="text" id="username" class="username" name="name" value='' />

					<div class="tips"></div>
				</div>

				<div>
					<span>密码：</span><input style="border: 2px solid #307ac1"
						type="password" id="password" class="password" name="password"
						value=''>

					<div class="tips"></div>
				</div>

				<div>
					&nbsp;确认密码：<input style="border: 2px solid #307ac1" type="password"
						id="sure_password" class="sure_password" name="sure_password"
						value=''>

					<div class="tips"></div>
				</div>
				<div class="sex">
					<span>性别：</span><label class="radio-inline"> <input
						type="radio" name="sex" id="sex" value="男" " checked> 男
					</label> <label class="radio-inline"> <input type="radio"
						name="sex" id="sex" value="女"> 女
					</label>
				</div>
				<div>
					<span>专业：</span><input style="border: 2px solid #307ac1"
						type="text" id="profession" class="profession" name="profession"
						value=''>

				</div>
				<div>
					<span>班级：</span><input style="border: 2px solid #307ac1"
						type="text" id="clazz" class="clazz" name="clazz" value=''>

				</div>
				<div>
					<span>邮箱：</span><input style="border: 2px solid #307ac1"
						type="text" id="email" class="email" name="email" value=''>

					<div class="tips"></div>
				</div>

				<div>
					<input type="submit" id="button" class="btn btn-default"
						name="submit" value="注册">
				</div>

			</form>

		</div>

	</div>

	<div class="foot">
		<div class="grey">
			<span class="copyright">Copyright@2016 14级计科3班 郭明周</span>
		</div>

		<div class="blue"></div>
	</div>
</body>

</html>