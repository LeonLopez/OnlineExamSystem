<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
	</head>

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
				<tr>
					<td>高数</td>
					<td>高数A</td>
					<td>100</td>
					<td>60</td>
					<td>2011-12-10</td>
					<td>2018-10-20</td>
					<td>60分钟</td>
					<td><button class="btn btn-default" value="进入考试">进入考试</button>&nbsp;&nbsp;<button class="btn btn-default" value="成绩查询">成绩查询</button></td>
				</tr>
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
				<tr>
					<td>高数</td>
					<td>高数A</td>
					<td>100</td>
					<td>60</td>
					<td>2011-12-10</td>
					<td>2018-10-20</td>
					<td>60分钟</td>
					<td><button class="btn btn-default" value="查看答案">查看答案</button>&nbsp;&nbsp;<button class="btn btn-default" value="成绩查询">成绩查询</button></td>
				</tr>
			</tbody>
		</table>
	</body>

</html>