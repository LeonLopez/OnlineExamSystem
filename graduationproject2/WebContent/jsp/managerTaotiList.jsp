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
		$("#dg").datagrid({
			url:'${pageContext.request.contextPath}/managerGetTaotiList.action',
			pagination:true,
			fit:true,
			fitColumns:true,
			toolbar:'#tb',
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
					width:100,
					align:'center',
				},
				{
					field:'name',
					title:'试卷名称',
					width:200,
					align:'center',
				},
				{
					field:'lessonname',
					title:'所属课程',
					width:200,
					align:'center',
				},
				{
					field:'totalscore',
					title:'总分',
					width:100,
					align:'center',
				},
				{
					field:'createuser',
					title:'创建人',
					width:100,
					align:'center',
				},
				{
					field:'createtime',
					title:'创建日期',
					width:200,
					align:'center',
					formatter:function(value){
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						return y+"-"+m+"-"+d;
					}
				},
			]]
		})
	})
	
	function openAddTaotiDialog(){
		$("#name").attr("readonly",false);
		$("#dlg").dialog("open").dialog("setTitle","添加试卷");
	}
	
	function addTaoti(){
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath }/managerAddTaoti.action",
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if (result=="success") {
					$.messager.alert("系统提示","操作成功！");
					closeDialog();
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","操作失败，请联系系统管理员！");
				}
			}
		})
	}

	function closeDialog(){
		$("#name").val("");
		$("#dlg").dialog("close");
	}
	
	function deleteTaoti(){
		var selections=$("#dg").datagrid("getSelections");
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
					url:'${pageContext.request.contextPath }/managerDeleteTaoti.action',
					data:idsStr,
					type:'post',
					contentType:'application/json;charset=utf-8',
					success:function(result){
						if (result=="success") {
							$.messager.alert("系统提示","删除成功！");
							$("#dg").datagrid("reload");
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
<body>
<table id="dg"></table>
<div id="tb">
	<a href="javascript:openAddTaotiDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加试卷</a>
	<!-- <a href="managerEditTaoti.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑试卷</a> -->
	<a href="javascript:deleteTaoti()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除试卷</a>
</div>
<div id="dlg" align="center" class="easyui-dialog" data-options="buttons:'#bts',closed:true" style="width: 400px;height: 200px">
	<form id="fm" method="post"> 
		<table style="padding: 20px;">
			<tr>
				<td>试卷名称</td>
				<td><input id="name" class="easyui-validatebox" name="name" data-options="required:true,panelHeight:'auto'"></td>
			</tr>
			<tr>
				<td>所属课程</td>
				<td><input id="cc" name="lessonid" class="easyui-combobox"
					data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',data:'rows',url:'${pageContext.request.contextPath}/managerGetLesson.action'"/></td>
			</tr>
			
			
		</table>
	</form>
</div>
<div id="bts" align="center">
	<a href="javascript:addTaoti()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
</body>
</html>