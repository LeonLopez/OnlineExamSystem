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
	$(function(){
		$("#tt").datagrid({
			url:'${pageContext.request.contextPath}/managerStudentGetList.action',
			pagination:true,
			rownumber:true,
			fit:true,
			fitColumns:true,
			toolbar:'#tb',
			columns:[[
				{
					field:'cb',
					align:'center',
					checkbox:true,
				},
				{
					field:'id',
					title:'编号',
					width:50,
					align:'center',
				},
				{
					field:'name',
					title:'帐号',
					width:150,
					align:'center',
				},
				{
					field:'password',
					title:'密码',
					width:150,
					align:'center',
				},
				{
					field:'sex',
					title:'性别',
					width:50,
					align:'center',
				},
				{
					field:'email',
					title:'邮箱',
					width:150,
					align:'center',
				},
				{
					field:'jointime',
					title:'注册时间',
					width:150,
					align:'center',
					formatter:function(value){
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						return y+"-"+m+"-"+d;
					}
				},
				{
					field:'profession',
					title:'专业',
					width:150,
					align:'center',
				},
				{
					field:'clazz',
					title:'班别',
					width:100,
					align:'center',
				}
				
			]]
		})
	})
	
	function openAddStudentDialog(){
		
		$("#dlg").dialog("open").dialog("setTitle","添加学生");
	}
	
	function addStudent(){
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath }/managerAddStudent.action",
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if (result=="success") {
					$.messager.alert("系统提示","操作成功！");
					closeDialog();
					$("#tt").datagrid("reload");
				}else{
					$.messager.alert("系统提示","操作失败，请联系系统管理员！");
				}
			}
		})
	}
	
	function deleteStudent(){
		var selections=$("#tt").datagrid("getSelections");
		if (selections.length==0) {
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var ids=[];
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		var idsStr = ids.join();
		$.messager.confirm("系统提示","确定要删除这"+selections.length+"条数据吗？",function(r){
			if (r) {
				$.ajax({
					url:'${pageContext.request.contextPath }/managerDeleteStudent.action',
					data:idsStr,
					type:'post',
					contentType:'application/json;charset=utf-8',
					success:function(result){
						if (result=="success") {
							$.messager.alert("系统提示","删除成功！");
							closeDialog();
							$("#tt").datagrid("reload");
						}else{
							$.messager.alert("系统提示","删除失败，请联系系统管理员！");
						}
					}
				})
			}
		})
	}

	function closeDialog(){
		$("#name").val("");
		$("#dlg").dialog("close");
	}
</script>
</head>
<body style="margin: 1px">
<table id="tt"></table>
<div id="tb">
	<a href="javascript:openAddStudentDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
	<a href="javascript:editStudentDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</a>
	<a href="javascript:deleteStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<div id="dlg" align="center" class="easyui-dialog" data-options="closed:true,buttons:'#bts'" style="width: 400px;height: 400px;padding: 10px">
	<form id="fm" method="post"> 
		<table cellpadding="15px">
			<tr>
				<td>账号</td>
				<td><input id="name" name="name" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="password" name="password" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>性别</td>
				<td>男<input type="radio" name="sex" value="男" checked>&nbsp;&nbsp;女<input type="radio" name="sex" value="女"></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input id="email" name="email" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><input id="profession" name="profession" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>班别</td>
				<td><input id="clazz" name="clazz" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			
			
		</table>
	</form>
</div>
<div id="bts" align="center">
	<a href="javascript:addStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
</body>
</html>