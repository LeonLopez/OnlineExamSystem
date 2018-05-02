<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			url:'${pageContext.request.contextPath}/managerGetLessonList.action',
			pagination:true,
			toolbar:'#tb',
			fit:true,
			fitColumns:true,
			rownumber:true,
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
					title:'课程名称',
					width:100,
					align:'center',
				},
				
				{
					field:'createtime',
					title:'修改日期',
					width:100,
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
					field:'knowledgepoint',
					title:'课程知识点',
					width:450,
					align:'center',
				}
			]]
		})
	})
	
	
	

	function resetValue(){
		$("#name").val("");
		$("#knowledgepoint").val("");
		$("#addorupdate").val("");
		$("#id").val("");
	}

	function openAddLessonDialog(){
		$("#addorupdate").val("1");
		$("#dlg").dialog("open").dialog("setTitle","添加课程");
	}
	
	function openUpdateDialog(){
		var selectedRow = $("#tt").datagrid("getSelected");
		if (selectedRow==null) {
			$.messager.alert("系统提示","请选择要修改的数据！");
			return;
		}
		$("#fm").form("load",selectedRow);
		$("#addorupdate").val("2");
		$("#dlg").dialog("open").dialog("setTitle","修改课程");
	}
	
	function closeDialog(){
		resetValue();
		$("#dlg").dialog("close");
	}
	
	function addOrUpdateLesson(){
		var choice = $("#addorupdate").val();
		var myUrl;
		if (choice=="1") {
			myUrl="${pageContext.request.contextPath }/managerAddLesson.action";
		}else{
			myUrl="${pageContext.request.contextPath }/managerUpdateLesson.action";
		}
		$("#fm").form("submit",{
			url:myUrl,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if (result=="success") {
					$.messager.alert("系统提示","操作成功！");
					closeDialog();
					resetValue();
					$("#tt").datagrid("reload");
				}else{
					$.messager.alert("系统提示","操作失败，请联系系统管理员！");
					resetValue();
				}
			}
		})
	}
	
	
	function deleteLesson(){
		var selections=$("#tt").datagrid("getSelections");
		if (selections.length==0) {
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var ids=[];
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		var idsStr=ids.join();
		$.messager.confirm("系统提示","确定要删除这"+selections.length+"条数据吗？",function(r){
			if (r) {
				$.ajax({
					url:'${pageContext.request.contextPath }/managerDeleteLesson.action',
					data:idsStr,
					type:'post',
					contentType:'application/json;charset=utf-8',
					success:function(result){
						if (result=="success") {
							$.messager.alert("系统提示","删除成功！");
							$("#tt").datagrid("reload");
						}else{
							$.messager.alert("系统提示","删除失败，请联系系统管理员！");
						}
					}
				})
			}
		})
	}
	
	
</script>
</head>
<body style="margin: 1px">
<table id="tt"></table>
<div id="tb">
	&nbsp;<a href="javascript:openAddLessonDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加课程</a>
	&nbsp;<a href="javascript:openUpdateDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改课程</a>
	&nbsp;<a href="javascript:deleteLesson()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除课程</a>
</div>
<div id="dlg" align="center" class="easyui-dialog" data-options="closed:true,buttons:'#bts'" style="width: 600px;height: 300px;padding: 10px">
	<form id="fm" method="post"> 
		<table cellpadding="15px">
			<tr>
				<td>
					<input type="hidden" id="id" name="id">
				</td>
				<td>
					<input type="hidden" id="addorupdate" value="">
				</td>
			</tr>
			<tr>
				<td>课程名称</td>
				<td><input id="name" name="name" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>课程知识点</td>
				<td><textarea id="knowledgepoint" name="knowledgepoint" cols="55" rows="6"></textarea></td>
			</tr>
		</table>
	</form>
</div>
<div id="bts" align="center">
	<a href="javascript:addOrUpdateLesson()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
</body>
</html>