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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	function postPractice(){
		var flag = confirm("确定要交卷吗？");
		if(flag){
			$("form").submit();
		}
		
	}
	
</script>
</head>

<body >


	<div class="main exam-mode">
		<div class="header-wrapper">

			<div class="logo-wrapper">
				<img class="icon-logo logo-ksx"
					src="${pageContext.request.contextPath }/images/logo.png" />

			</div>

			<div class="exam-name ellipsis">${examname }</div>
			<div class="user ellipsis">
				<i class="icon icon-a_nav_my"></i>${studentName }
			</div>

			<a type="button" class="btn btn-default logout" id="logoutBtn" href="${pageContext.request.contextPath }/logout.action" > <i
				class="icon icon-a_btn_sign_out btn-icon-left"></i> 退出
			</a>

		</div>

		<div class="body-wrapper">
		<form  action="${pageContext.request.contextPath }/postPractice.action" method="post">
			<div class="body paper">
             
               <input type="hidden" name="examname" value="${examname}" />

 			   <input type="hidden" name="examid" value="${examid}" />
				<c:if test="${singleList!=null and singleQuestions!=0}">
					<div class="questions">

						<div class="questions-title">单选题(共${singleQuestions }题，合计${singleScore }分)</div>

						<div class="questions-content">
							<c:forEach items="${singleList }" var="single" varStatus="status">
								<div class="question-content" id="">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>

									<div class="exam-question">
										<span class="question-index ellipsis">${status.count }.</span>
										${single.subject }(${single.score }分)
									</div>

									<div class="answers">

										<div class="select single-select a">

											<label for="${single.id }a"> <input type="radio"
												class="radioOrCheck " name="answerMap[${single.id }]"
												id="${single.id }a" value="A" /> <span class="words">A.
													${single.optiona } </span>
											</label>
										</div>

										<div class="select single-select b">

											<label for="${single.id }b"> <input type="radio"
												class="radioOrCheck " name="answerMap[${single.id }]"
												id="${single.id }b" value="B" /> <span class="words">B.
													${single.optionb } </span>
											</label>
										</div>
										<div class="select single-select c">

											<label for="${single.id }c"> <input type="radio"
												class="radioOrCheck " name="answerMap[${single.id }]"
												id="${single.id }c" value="C" /> <span class="words">C.
													${single.optionc } </span>
											</label>
										</div>
										<div class="select single-select d">

											<label for="${single.id }d"> <input type="radio"
												class="radioOrCheck " name="answerMap[${single.id }]"
												id="${single.id }d" value="D" /> <span class="words">D.
													${single.optiond } </span>
											</label>
										</div>
										
									</div>

								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>


				<c:if test="${multiList!=null and multiQuestions!=0}">
					<div class="questions">

						<div class="questions-title">多选题(共${multiQuestions }题，合计${multiScore }分)</div>

						<div class="questions-content">
							<c:forEach items="${multiList }" var="multi" varStatus="status">
								<div class="question-content" id="">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>

									<div class="exam-question">
										<span class="question-index ellipsis">${status.count }.</span>
										${multi.subject }(${multi.score }分)
									</div>

									<div class="answers">

										<div class="select single-select a">

											<label for="${multi.id }a"> <input type="checkbox"
												class="radioOrCheck " name="answerMap[${multi.id }]"
												id="${multi.id }a" value="A" /> <span class="words">A.
													${multi.optiona } </span>
											</label>
										</div>

										<div class="select single-select b">

											<label for="${multi.id }b"> <input type="checkbox"
												class="radioOrCheck " name="answerMap[${multi.id }]"
												id="${multi.id }b" value="B" /> <span class="words">B.
													${multi.optionb } </span>
											</label>
										</div>
										<div class="select single-select c">

											<label for="${multi.id }c"> <input type="checkbox"
												class="radioOrCheck " name="answerMap[${multi.id }]"
												id="${multi.id }c" value="C" /> <span class="words">C.
													${multi.optionc } </span>
											</label>
										</div>
										<div class="select single-select d">

											<label for="${multi.id }d"> <input type="checkbox"
												class="radioOrCheck " name="answerMap[${multi.id }]"
												id="${multi.id }d" value="D" /> <span class="words">D.
													${multi.optiond } </span>
											</label>
										</div>
									</div>

								</div>
							</c:forEach>

						</div>
					</div>
				</c:if>
				
				<c:if test="${judgeList!=null and judgeQuestions!=0}">
					<div class="questions">

						<div class="questions-title">判断题(共${judgeQuestions }题，合计${judgeScore }分)</div>

						<div class="questions-content">
							<c:forEach items="${judgeList }" var="judge" varStatus="status">
								<div class="question-content" id="">

									<div class="question-operation operation-icon icon-mark"
										data-type="1" data-toggle="tooltip" data-placement="top"
										data-container="body" title="标记本题">
										<i class="icon icon-p_exam_tag_de"></i>
									</div>

									<div class="exam-question">
										<span class="question-index ellipsis">${status.count }.</span>
										${judge.subject }(${judge.score }分)
									</div>

									<div class="answers">

										<div class="select single-select a">

											<label for="${judge.id }right"> <input type="radio"
												class="radioOrCheck " name="answerMap[${judge.id }]"
												id="${judge.id }right" value="正确" /> <span class="words">正确
													</span>
											</label>
										</div>

										<div class="select single-select a">

											<label for="${judge.id }wrong"> <input type="radio"
												class="radioOrCheck " name="answerMap[${judge.id }]"
												id="${judge.id }wrong" value="错误" /> <span class="words">错误
													</span>
											</label>
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
						<div class="item-label">当前进度</div>
						<div class="item-data">
							<span id="commitCount">0</span>/<span id="totalCount">${totalQuestions }</span>
						</div>
						<div class="item-process">
							<div class="item-process-bar" id="commitProcess"></div>
						</div>
					</li>
				</ul>
			</div>

			<button onclick="postPractice()" class="btn btn-primary btn-nav" id="endExamBtn">提交</button>
		</div>


	</div>


</form>




</body>

</html>