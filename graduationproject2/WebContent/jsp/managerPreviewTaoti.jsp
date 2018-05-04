<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">

<title>考试云平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<link rel="shortcut icon"
	href="https://exam.kaoshixing.com/static/base/images/new_logo.ico" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/styles.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/base.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/exam_style.css">
<style type="text/css">
.btn-default {
	color: #666666;
	background-color: #F8F8F8;
	border-color: #F8F8F8;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>


	<div class="main exam-mode">
		<div class="header-wrapper">

			<div class="logo-wrapper">
				<img class="icon-logo logo-ksx"
					src="${pageContext.request.contextPath }/images/logo.png" />

			</div>

			<div class="exam-name ellipsis">${taotiName }</div>




		</div>

		<div class="body-wrapper">
			<div class="body paper">


				<c:if test="${singleList!=null and singleQuestions!=0}">
					<div class="questions">

						<div class="questions-title">单选题</div>

						<div class="questions-content">
							<c:forEach items="${singleList }" var="single" varStatus="status">
								<div class="question-content" id="">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>
									<div style="float: right;">
										<button class="btn btn-default">删除</button>
									</div>
									<div class="exam-question">${single.subject }(${single.score }分)
									</div>

									<div class="answers" style="margin-left: 20px;">

										<div class="select single-select a">

											<span class="words">A. ${single.optiona } </span>

										</div>

										<div class="select single-select b">

											<span class="words">B. ${single.optionb } </span>

										</div>

										<div class="select single-select c">

											<span class="words">C. ${single.optionc } </span>

										</div>
										<div class="select single-select d">

											<span class="words">D. ${single.optiond } </span>

										</div>
										<div
											style="background-color: #F8F8F8; border: 1px solid #ddd; color: #666; margin-top: 20px;">

											<div class="select single-select d">

												<span class="words" style="color: #666666;">正确答案：
													${single.answer } </span>

											</div>

											<div class="select single-select d">

												<span class="words" style="color: #666666;">答案解析：</span> <span
													class="words" style="color: #666666;"> <c:if
														test="${single.note==null or single.note=='' }">无</c:if> <c:if
														test="${not empty single.note}">${single.note }</c:if>
												</span>

											</div>
											<div class="select single-select d">

												<span class="words" style="color: #666666;">题目难度：
													${single.difficulty } </span>

											</div>
										</div>

									</div>

								</div>

							</c:forEach>
						</div>
					</div>
				</c:if>


				<c:if test="${multiList!=null and multiQuestions!=0}">
					<div class="questions">

						<div class="questions-title">多选题</div>

						<div class="questions-content">
							<c:forEach items="${multiList }" var="multi" varStatus="status">
								<div class="question-content" id="">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>
<div style="float: right;">
										<button class="btn btn-default">删除</button>
									</div>
									<div class="exam-question">${multi.subject }(${multi.score }分)
									</div>

									<div class="answers" style="margin-left: 20px;">

										<div class="select single-select a">

											<span class="words">A. ${multi.optiona } </span>

										</div>

										<div class="select single-select b">

											<span class="words">B. ${multi.optionb } </span>

										</div>
										<div class="select single-select c">

											<span class="words">C. ${multi.optionc } </span>

										</div>
										<div class="select single-select d">

											<span class="words">D. ${multi.optiond } </span>

										</div>
										<div
											style="background-color: #F8F8F8; border: 1px solid #ddd; color: #666; margin-top: 20px;">
											<div class="select single-select d">

												<span class="words" style="color: #666666;">正确答案：
													${multi.answer } </span>

											</div>
											<div class="select single-select d">

												<span class="words" style="color: #666666;">答案解析：</span> <span
													class="words" style="color: #666666;"> <c:if
														test="${multi.note==null or multi.note=='' }">无</c:if> <c:if
														test="${not empty multi.note}">${multi.note }</c:if>
												</span>

											</div>
											<div class="select single-select d">

												<span class="words" style="color: #666666;">题目难度：
													${multi.difficulty } </span>

											</div>
										</div>



									</div>


								</div>
							</c:forEach>

						</div>
					</div>
				</c:if>

				<c:if test="${judgeList!=null and judgeQuestions!=0}">
					<div class="questions">

						<div class="questions-title">判断题</div>

						<div class="questions-content">
							<c:forEach items="${judgeList }" var="judge" varStatus="status">
								<div class="question-content" id="">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>
<div style="float: right;">
										<button class="btn btn-default">删除</button>
									</div>
									<div class="exam-question">${judge.subject }(${judge.score }分)
									</div>

									<div class="answers" style="margin-left: 20px;">




										<div
											style="background-color: #F8F8F8; border: 1px solid #ddd; color: #666; margin-top: 20px;">

											<div class="select single-select d">

												<span class="words" style="color: #666666;">正确答案：
													${judge.judgeanswer } </span>

											</div>

											<div class="select single-select d">

												<span class="words" style="color: #666666;">答案解析：</span> <span
													class="words" style="color: #666666;"> <c:if
														test="${judge.note==null or judge.note=='' }">无</c:if> <c:if
														test="${not empty judge.note}">${judge.note }</c:if>
												</span>

											</div>
											<div class="select single-select d">

												<span class="words" style="color: #666666;">题目难度：
													${judge.difficulty } </span>

											</div>
										</div>

									</div>

								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>

			</div>
		</div>



	</div>







</body>

</html>