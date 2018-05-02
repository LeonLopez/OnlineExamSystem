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


	<body>
		<div class="page-header" >
			<h3 style="text-align:center">知识库</h3>
		</div>
		<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<td>编号</td>
					<td>文件名称</td>
					<td>创建人</td>
					<td>创建日期</td>
					
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="file" items="${fileList }" >
				<tr>
					<td >${file.id }</td>
					<td>${file.filename }</td>
					<td>${file.createuser }</td>
					<td><fmt:formatDate value="${file.createtime }" pattern="yyyy-MM-dd"/>  </td>
					<td><a  class="btn btn-default" value="下载" href="${pageContext.request.contextPath }/downloadFile.action?filename=${file.filename }" >下载</a>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
	</body>

</html>