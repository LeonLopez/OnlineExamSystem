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
		$("#dg").datagrid({
			url:'${pageContext.request.contextPath}/managerGetExamList.action',
			pagination:true,
			fit:true,
			fitColumns:true,
			toolbar:'#tb',
			rownumbers:true,
			columns:[[
				{
					field:'cb',
					align:'center',
					checkbox:true,
				},
				{
					field:'name',
					title:'考试名称',
					width:100,
					align:'center',
				},
				{
					field:'taotiName',
					title:'试题名称',
					width:150,
					align:'center',
				},
				{
					field:'duration',
					title:'考试时长（分钟）',
					width:100,
					align:'center',
				},
				{
					field:'passscore',
					title:'及格分数',
					width:50,
					align:'center',
				},
				{
					field:'starttime',
					title:'开始时间',
					width:100,
					align:'center',
					formatter:function(value){
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						var h=date.getHours();
						var min=date.getMinutes();
						var s=date.getSeconds();
						return y+"-"+m+"-"+d+"&nbsp;"+h+":"+min+":"+s;
					}
				},
				{
					field:'endtime',
					title:'结束时间',
					width:100,
					align:'center',
					formatter:function(value){
						
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						var h=date.getHours();
						var min=date.getMinutes();
						var s=date.getSeconds();
						return y+"-"+m+"-"+d+"&nbsp;"+h+":"+min+":"+s;
					}
				},
				{
					field:'createuser',
					title:'创建人',
					width:50,
					align:'center',
				},
				{
					field:'createtime',
					title:'创建时间',
					width:100,
					align:'center',
					formatter:function(value){
						
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						var h=date.getHours();
						var min=date.getMinutes();
						var s=date.getSeconds();
						return y+"-"+m+"-"+d+"&nbsp;"+h+":"+min+":"+s;
					}
				}
			]]
		})
	})
	
	function formatDate(value){
						
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						var h=date.getHours();
						var min=date.getMinutes();
						var s=date.getSeconds();
						return y+"-"+m+"-"+d+" "+h+":"+min+":"+s;
					}
	
	function resetValue(){
		$("#cc2").val("");
		$("#name").val("");
		$("#duration").val("");
		$("#passscore").val("");
		$("#introduction").val("");
		$("#starttime").val("");
		$("#endtime").val("");
		$("#addorupdate").val("");
		$("#id").val("");
	}

	function openAddDialog(){
		$("#addorupdate").val("1");
		$("#name").attr("readonly",false);
		$("#dlg").dialog("open").dialog("setTitle","添加考试");
	}
	
	function openUpdateDialog(){
		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow==null) {
			$.messager.alert("系统提示","请选择要修改的数据！");
			return;
		}
		//格式化日期时间
		var starttime = selectedRow.starttime;
		var endtime = selectedRow.endtime;
		//修复格式化时间，上次因为格式化返回的字符串有"nbsp;",
		//使得starttimeformat赋值给selectedRow.starttime时出现截断，使得显示没有具体的时间
		starttimeformat = formatDate(starttime);
		endtimeformat = formatDate(endtime);
		selectedRow.starttime = starttimeformat;
		selectedRow.endtime = endtimeformat;
		$("#fm").form("load",selectedRow);
		$("#addorupdate").val("2");
		$("#name").attr("readonly",false);
		$("#dlg").dialog("open").dialog("setTitle","修改考试");
	}
	
	function closeDialog(){
		resetValue();
		$("#dlg").dialog("close");
	}
	
	function addOrUpdateQuestions(){
		var choice = $("#addorupdate").val();
		var myUrl;
		if (choice=="1") {
			myUrl="${pageContext.request.contextPath }/managerAddExam.action";
		}else{
			myUrl="${pageContext.request.contextPath }/managerUpdateExam.action";
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
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","操作失败，请联系系统管理员！");
					resetValue();
				}
			}
		})
	}
	
	function deleteQuestions(){
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
					url:'${pageContext.request.contextPath }/managerDeleteExam.action',
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
<body style="margin: 1px">
<table id="dg"></table>
<div id="tb">
	&nbsp;<a href="javascript:openAddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加考试</a>
	&nbsp;<a href="javascript:openUpdateDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑考试</a>
	&nbsp;<a href="javascript:deleteQuestions()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除考试</a>
</div>
  
<div id="dlg" class="easyui-dialog" data-options="buttons:'#bts',closed:true" style="width: 700px;height:450px">
	<form id="fm" method="post"> 
		<table cellpadding="10px">
			<tr>
				<td>考试名称</td>
				<td><input  id="name" name="name" class="easyui-validatebox" data-options="required:true"  style="width: 480px"></td>
			</tr>
			<tr>
				<td>选用试卷</td>
				<td><input id="cc2" class="easyui-combobox" name="taotiid"
					data-options="textField:'name',valueField:'id',panelHeight:'auto',url:'${pageContext.request.contextPath }/managerGetTaoti.action'">
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="id" name="id">
				</td>
				<td>
					<input type="hidden" id="addorupdate" value="">
				</td>
			</tr>
			<tr>
			<td>考试时间</td>
			<td><input class="easyui-datetimebox" name="starttime" id="starttime"
    data-options="required:true,showSeconds:true" value="" style="width:150px">&nbsp;到&nbsp;<input class="easyui-datetimebox" name="endtime" id="endtime"
    data-options="required:true,showSeconds:true" value="" style="width:150px"></td>
			</tr>
			<tr>
				<td>答卷时长</td>
				<td><input id="duration" name="duration" style="width: 60px"/>分钟</td>
			</tr>
			<tr>
				<td>及格分数</td>
				<td><input id="passscore" name="passscore" style="width: 60px"/>分</td>
			</tr>
			<tr>
				<td>考试说明</td>
				<td><textarea id="introduction" name="introduction" cols="65" rows="6"></textarea></td>
			</tr>
			
			
			
			
		</table>
	</form>
</div>

<div id="bts">
	<a href="javascript:addOrUpdateQuestions()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>

</body>
</html>