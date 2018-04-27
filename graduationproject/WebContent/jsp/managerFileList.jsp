<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<style>
			.file {
				position: relative;
				background: #D0EEFF;
				border: 1px solid #99D3F5;
				border-radius: 4px;
				padding: 4px 12px;
				overflow: hidden;
				color: #1E88C7;
				text-decoration: none;
				text-indent: 0;
				line-height: 20px;
			}
			
			.file input {
				position: absolute;
				font-size: 100px;
				right: 0;
				top: 0;
				opacity: 0;
			}
			
			.file:hover {
				background: #AADFFD;
				border-color: #78C3F3;
				color: #004974;
				text-decoration: none;
			}
			div#tb {
    height: 33px;
}
		</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function() {
		$("#dg")
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/managerGetFileList.action',
							pagination : true,
							fit : true,
							fitColumns : true,
							toolbar : '#tb',
							rownumber : true,
							columns : [ [
									{
										field : 'cb',
										align : 'center',
										checkbox : true,
									},
									{
										field : 'id',
										title : '编号',
										width : 100,
										align : 'center',
									},
									{
										field : 'filename',
										title : '文件名称',
										width : 200,
										align : 'center',
									},

									{
										field : 'createuser',
										title : '创建人',
										width : 150,
										align : 'center',
									},
									{
										field : 'createtime',
										title : '创建日期',
										width : 200,
										align : 'center',
										formatter : function(value) {
											var date = new Date(value);
											var y = date.getFullYear();
											var m = date.getMonth() + 1;
											var d = date.getDate();
											var h = date.getHours();
											var min = date.getMinutes();
											var s = date.getSeconds();
											return y + "-" + m + "-" + d
													+ "&nbsp;" + h + ":" + min
													+ ":" + s;
										}
									}, ] ]
						})
	})

	function uploadFile() {
		$("#fm").form("submit", {
			url : "${pageContext.request.contextPath }/uploadFile.action",

			success : function(result) {
				if (result == "success") {
					$.messager.alert("系统提示", "上传成功！");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "上传失败，请联系系统管理员！");
				}
			}
		})
	}

	function deleteFile() {
		var selections = $("#dg").datagrid("getSelections");
		if (selections.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var ids = [];
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		var idsStr = ids.join();
		$.messager
				.confirm(
						"系统提示",
						"确定要删除这" + selections.length + "条数据吗？",
						function(r) {
							if (r) {
								$
										.ajax({
											url : '${pageContext.request.contextPath }/managerDeleteFile.action',
											data : idsStr,
											type : 'post',
											contentType : 'application/json;charset=utf-8',
											success : function(result) {
												if (result == "success") {
													$.messager.alert("系统提示",
															"删除成功！");
													$("#dg").datagrid("reload");
												} else {
													$.messager.alert("系统提示",
															"删除失败，请联系系统管理员！");
												}
											}
										})
							}
						})
	}
</script>
</head>
<body>
	<table id="dg"></table>
	<div id="tb">
		
		<form id="fm" method="post" enctype="multipart/form-data"
			style="padding-right: 100px; float: left;margin-top:6px;margin-bottom: 2px;">
			
			  <a href="javascript:;" class="file">选择文件<input type="file"
				name="file" >
			</a>&nbsp;&nbsp; <a href="javascript:uploadFile()" class="easyui-linkbutton"
				data-options="iconCls:'icon-upload',plain:true">上传</a>
		</form>
		<div style="margin-left: 975px;">
<a href="javascript:deleteFile()" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除资料</a></div>
	</div>

</body>
</html>