<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">

		<title>课程考试系统</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<link rel="shortcut icon" href="../images/new_logo.ico" />

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<meta name="renderer" content="webkit">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/styles.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/base.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/response.css">
		<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">

		function countExamtime(examtime){
			var time = examtime+1;
			var resttimes = 2 -time;
			if(time<3){
				alert("这是你第"+time+"次考试！你还剩"+resttimes+"次考试机会");

			}else{
				$("#startBtn").attr('disabled','disabled');
				alert("你的考试机会已经用完，不能再次进入考试");

			}
			
			


			}
			
			
		
			function startExam(id){
				window.location="${pageContext.request.contextPath }/startExam.action?id="+id;
				}

			
		</script>
	</head>

	<body onload = "countExamtime(${examtimes})">
		

		<div class="wrapper">
			<div class="header-wrapper hidden-xs">

				<div class="logo-wrapper">
					<a href="https://exam.kaoshixing.com/exam" title="logo">
						<img class="icon-logo logo-ksx" src="${pageContext.request.contextPath }/images/logo.png" />
					</a>
				</div>

				<div class="user ellipsis">
					<i class="icon icon-p_top_user"></i>${studentName }
				</div>

				<a type="button" class="btn btn-default logout" id="logoutBtn" href="${pageContext.request.contextPath }/logout.action">
					<i class="icon icon-a_btn_sign_out btn-icon-left"></i> 退出
				</a>

			</div>

			<div class="panel-block ">
				<div class="icon-logo visible-xs">
					<img src="${pageContext.request.contextPath }/images/logo.png" />
				</div>
				<div class="title ellipsis">
				${name }
				</div>
				<div class="content">

				</div>

				<div class="btn-row">
					<button type="button" onclick="startExam(${id})" class="btn btn-primary btn-fix btn-w-120 btn-h-40" id="startBtn" data-setIpRange="0" data-id="116508" >开始</button>
				</div>
			</div>
		</div>

		
		
	</body>

</html>