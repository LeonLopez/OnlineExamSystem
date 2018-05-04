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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function() {
		$("#tt")
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/managerGetAllStudent.action',
							pagination : true,
							rownumber : true,
							fit : true,
							fitColumns : true,
							toolbar : '#tb',
							columns : [ [ {
								field : 'cb',
								align : 'center',
								checkbox : true,
							}, {
								field : 'id',
								title : '编号',
								width : 50,
								align : 'center',
							}, {
								field : 'name',
								title : '帐号',
								width : 150,
								align : 'center',
							},

							{
								field : 'sex',
								title : '性别',
								width : 50,
								align : 'center',
							}, {
								field : 'email',
								title : '邮箱',
								width : 150,
								align : 'center',
							}, {
								field : 'jointime',
								title : '注册时间',
								width : 150,
								align : 'center',
								formatter : function(value) {
									var date = new Date(value);
									var y = date.getFullYear();
									var m = date.getMonth() + 1;
									var d = date.getDate();
									return y + "-" + m + "-" + d;
								}
							}, {
								field : 'profession',
								title : '专业',
								width : 150,
								align : 'center',
							}, {
								field : 'clazz',
								title : '班别',
								width : 100,
								align : 'center',
							}

							] ]
						})
	})

	function resetValue() {
		$("#profession").combobox('clear');
		$("#clazz").combobox('clear');
		$("#name").val("");
	}

	function addStudentToMyStuList() {
		var selections = $("#tt").datagrid("getSelections");
		if (selections.length == 0) {
			$.messager.alert("系统提示", "请选择要添加的学生！");
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
						"确定要添加这" + selections.length + "个学生吗？",
						function(r) {
							if (r) {
								$
										.ajax({
											url : '${pageContext.request.contextPath }/managerAddStudentToMyStuList.action',
											data : idsStr,
											type : 'post',
											contentType : 'application/json;charset=utf-8',
											success : function(result) {
												if (result == "success") {
													$.messager.alert("系统提示",
															"添加成功！");
													resetValue();
												} else {
													$.messager.alert("系统提示",
															"添加失败，请联系系统管理员！");
													resetValue();
												}
											}
										})
							}
						})
	}

	function searchResult(){
		 var profession=$("#profession").val();
		 var clazz=$("#clazz").val();
		 var name=$("#name").val();

			$("#tt").datagrid("load",{
					profession:profession,
					clazz:clazz,
					name:name,
			})
	}
</script>
</head>
<body style="margin: 1px">
	<table id="tt"></table>
	<div id="tb">
		
		&nbsp;&nbsp;<a href="javascript:addStudentToMyStuList()"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加学生到我的学生列表</a>
			<font style="margin-left: 400px;">专业</font> <input id="profession" name="profession"
			class="easyui-combobox"
			data-options="panelHeight:'auto',editable:false,valueField:'profession',textField:'profession',data:'rows',url:'${pageContext.request.contextPath}/managerGetProfession.action',onSelect: function(rec){var url = '${pageContext.request.contextPath }/managerGetClazz.action?profession='+rec.profession;$('#clazz').combobox('reload', url);}"
			style="width: 90px;" /> &nbsp;&nbsp;<font>班别</font> <input id="clazz"
			class="easyui-combobox" name="clazz"
			data-options="textField:'clazz',valueField:'clazz',panelHeight:'auto'"
			value="" style="width: 70px;"> &nbsp;&nbsp;<font>账号</font>&nbsp;<input
			id="name" type="text" value="" style="width: 80px;">
			<a href="javascript:searchResult()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
	</div>


</body>
</html>