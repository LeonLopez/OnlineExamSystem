<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" />
	</head>

<script type="text/javascript">
	function enterExam(id,name){
			window.open("${pageContext.request.contextPath }/jsp/beforeAnswer.jsp?id="+id+"&name="+name); 
		}
</script>
	<body>
		<div class="page-header" >
			<h3 style="margin-left: 40px;">正在进行的考试</h3>
		</div>
		<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<td>考试名称</td>
					<td>试题名称</td>
					<td>总分</td>
					<td>及格分数</td>
					<td>开始时间</td>
					<td>结束时间</td> 
					<td>考试时长</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="exam" items="${examList }" >
				<tr>
					<td style="display:none">${exam.id }</td>
					<td>${exam.name }</td>
					<td>${exam.taotiName }</td>
					<td>${exam.totalscore }</td>
					<td>${exam.passscore }</td>
					<td><fmt:formatDate value="${exam.starttime }" pattern="yyyy-MM-dd"/> </td>
					<td><fmt:formatDate value="${exam.endtime }" pattern="yyyy-MM-dd"/>  </td>
					<td>${exam.duration }分钟</td>
					<td><button class="btn btn-default" value="进入考试" onclick="enterExam(${exam.id},'${exam.name }')">进入考试</button>&nbsp;&nbsp;<button class="btn btn-default" value="成绩查询">成绩查询</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="page-header" >
			<h3 style="margin-left: 40px;">已经结束的考试</h3>
		</div>
		<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<td>考试名称</td>
					<td>试题名称</td>
					<td>总分</td>
					<td>及格分数</td>
					<td>开始时间</td>
					<td>结束时间</td>
					<td>考试时长</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="exam" items="${finishExamList }" >
				<tr>
					<td style="display:none">${exam.id }</td>
					<td>${exam.name }</td>
					<td>${exam.taotiName }</td>
					<td>${exam.totalscore }</td>
					<td>${exam.passscore }</td>
					<td><fmt:formatDate value="${exam.starttime }" pattern="yyyy-MM-dd"/> </td>
					<td><fmt:formatDate value="${exam.endtime }" pattern="yyyy-MM-dd"/>  </td>
					<td>${exam.duration }分钟</td>
					<td><button class="btn btn-default" value="查看答案">查看答案</button>&nbsp;&nbsp;<button class="btn btn-default" value="成绩查询">成绩查询</button></td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
	</body>

</html>