<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">

		<title>课程考试系统</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/new_logo.ico" />

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<meta name="renderer" content="webkit">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/styles.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/base.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/exam_style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/exam_score.css" />

	</head>

	<body>

		<div class="main">
			<div class="header-wrapper">

				<div class="logo-wrapper">
					<a href="https://exam.kaoshixing.com/exam" title="logo">
						<img class="icon-logo logo-ksx" src="${pageContext.request.contextPath}/images/logo.png" />
					</a>
				</div>

				<div class="exam-name ellipsis">${examname }</div>
				<div class="user ellipsis">
					<i class="icon icon-a_nav_my"></i> ${studentName }
				</div>

				<a type="button" class="btn btn-default logout" href="#">
					<i class="icon icon-a_btn_return btn-icon-left"></i> 返回
				</a>

			</div>

			<div class="body-wrapper">

				<div class="content-wrapper content-top" style="padding-left: 131px;padding-right: 131px;">

					
						
						<table class="table" > 

							<tr>
								<td>单选题成绩</td>
								<td>${singleScore }分</td>
							</tr>
							<tr>
								<td>多选题成绩</td>
								<td>${multiScore }分</td>
							</tr>
							<tr>
								<td>总成绩</td>
								<td>${totalScore }分</td>
							</tr>
						</table>

					

					<div class="release-wrapper">

						<span class="release-str">感谢您的作答！</span>

					</div>

					<div class="decoration">
						<img src="${pageContext.request.contextPath}/images/decoration.png" />
					</div>

				</div>

				<div class="content-wrapper content-bottom content-tab-1 clearfix">

					<div class="info-tab tab-orange">
						<div class="tab-data">${accuracy }%</div>
						<div class="tab-label">正确率</div>
					</div>

				</div>

				<div class="footer-wrapper clearfix footer-tab-1">

					<div class="tab-btn">
						<a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/startExam.action?id=${examid}">再考一次</a>
					</div>

				</div>

			</div>

		</div>

	</body>

</html>