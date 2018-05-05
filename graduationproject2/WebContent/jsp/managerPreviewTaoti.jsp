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
	function deleteFromTaoti(questionid,taotiid){

		var status = confirm("你确定要将该题目从该试卷移除吗?");
		  if(!status){
		   return false;
		  }

		  $
			.ajax({
				url : '${pageContext.request.contextPath }/managerDeleteQuestionFromTaoti.action?taotiid='+taotiid+'&questionid='+questionid,
				type : 'post',
				dataType:'json',
				success : function(result) {
						alert("题目移除成功！");
						$("#"+questionid).remove();
						if(result.type=="单选"){
							var singleQuestions= $("#singleQuestions").text();
							singleQuestions = singleQuestions-1;
							$("#singleQuestions").text(singleQuestions);
							var singleScore= $("#singleScore").text();
							singleScore = singleScore-result.score;
							$("#singleScore").text(singleScore);
							if(singleQuestions==0){

								$("#singletitle").remove();
							}
						}
						if(result.type=="多选"){
							var multiQuestions= $("#multiQuestions").text();
							multiQuestions = multiQuestions-1;
							$("#multiQuestions").text(multiQuestions);
							var multiScore= $("#multiScore").text();
							multiScore = multiScore-result.score;
							$("#multiScore").text(multiScore);
							if(multiQuestions==0){

								$("#multititle").remove();
							}
						}
						if(result.type=="判断"){
							var judgeQuestions= $("#judgeQuestions").text();
							judgeQuestions = judgeQuestions-1;
							$("#judgeQuestions").text(judgeQuestions);
							var judgeScore= $("#judgeScore").text();
							judgeScore = judgeScore-result.score;
							$("#judgeScore").text(judgeScore);
							if(judgeQuestions==0){

								$("#judgetitle").remove();
							}
						}
						var totalQuestions= $("#totalQuestions").text();
						totalQuestions = totalQuestions-1;
						$("#totalQuestions").text(totalQuestions);
						var totalScore= $("#totalScore").text();
						totalScore = totalScore-result.score;
						$("#totalScore").text(totalScore);
					
				}
			})
		
	}
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
					<div class="questions" id="singletitle">

						<div class="questions-title">单选题</div>

						<div class="questions-content">
							<c:forEach items="${singleList }" var="single" varStatus="status">
								<div class="question-content" id="${single.id }">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>
									<div style="float: right;">
										<button class="btn btn-default"
											onclick="deleteFromTaoti(${single.id},${taotiid })">删除</button>
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
					<div class="questions" id="multititle">

						<div class="questions-title">多选题</div>

						<div class="questions-content">
							<c:forEach items="${multiList }" var="multi" varStatus="status">
								<div class="question-content" id="${multi.id }">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>
									<div style="float: right;">
										<button class="btn btn-default"
											onclick="deleteFromTaoti(${multi.id},${taotiid })">删除</button>
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
					<div class="questions" id="judgetitle">

						<div class="questions-title" >判断题</div>

						<div class="questions-content">
							<c:forEach items="${judgeList }" var="judge" varStatus="status">
								<div class="question-content" id="${judge.id }">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>
									<div style="float: right;">
										<button class="btn btn-default"
											onclick="deleteFromTaoti(${judge.id},${taotiid })">删除</button>
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

		<div class="nav-wrapper">
			<div class="nav nav-status">
				<ul class="menu-items">
					
					<li class="menu-item menu-item-process">
						<div class="item-label">单选题<span id="singleQuestions">${singleQuestions }</span>道</div>
						<div class="item-data">
							<span id="commitCount">共<span id="singleScore">${singleScore }</span>分</span>
						</div>
						
					</li>
					<li class="menu-item menu-item-process">
						<div class="item-label">多选题<span id="multiQuestions">${multiQuestions }</span>道</div>
						<div class="item-data">
							<span id="commitCount">共<span id="multiScore">${multiScore }</span>分</span>
						</div>
						
					</li>
					<li class="menu-item menu-item-process">
						<div class="item-label">判断题<span id="judgeQuestions">${judgeQuestions }</span>道</div>
						<div class="item-data">
							<span id="commitCount">共<span id="judgeScore">${judgeScore }</span>分</span>
						</div>
						
					</li>
					<li class="menu-item menu-item-process">
						<div class="item-label">共<span id="totalQuestions">${totalQuestions }</span>道题目</div>
						<div class="item-data">
							<span id="commitCount">总分:<span id="totalScore">${totalScore }</span>分</span>
						</div>
						
					</li>
				</ul>
			</div>

			
		</div>


	</div>







</body>

</html>