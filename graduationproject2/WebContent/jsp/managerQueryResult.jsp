<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache" />

<meta http-equiv="Cache-Control" content="no-cache" />

<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT" />
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
							url : '${pageContext.request.contextPath}/managerGetQueryResult.action',
							singleSelect : true,
							pagination : true,
							fit : true,
							fitColumns : true,
							toolbar : '#tb',
							columns : [ [
									
									{
										field : 'sname',
										title : '姓名',
										width : 100,
										align : 'center',
									},
									{
										field : 'profession',
										title : '专业',
										width : 100,
										align : 'center',
									},
									{
										field : 'clazz',
										title : '班别',
										width : 100,
										align : 'center',
									},
									{
										field : 'examname',
										title : '考试名称',
										width : 100,
										align : 'center',
									},
									{
										field : 'resingle',
										title : '单选题得分',
										width : 100,
										align : 'center',
									},
									{
										field : 'resmore',
										title : '多选题得分',
										width : 100,
										align : 'center',
									},
									{
										field : 'restotal',
										title : '总分',
										width : 100,
										align : 'center',
									},
									{
										field : 'ispass',
										title : '及格',
										width : 100,
										align : 'center',
									},
									{
										field : 'createtime',
										title : '考试时间',
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
											return y
													+ "-"
													+ m
													+ "-"
													+ d
													+ "&nbsp;&nbsp;&nbsp;&nbsp;"
													+ h + ":" + min + ":" + s;
										}
									}, ] ]
						})
	})
   
	function searchResult(){
		 var profession=$("#profession").val();
		 var clazz=$("#clazz").val();
		 var sname=$("#sname").val();
		 var examname=$("#examname").val();
		 var ispass=$("#ispass").val();
		 var order=$("#order").val();
			
			$("#tt").datagrid("load",{
					profession:profession,
					clazz:clazz,
					examname:examname,
					sname:sname,
					ispass:ispass,
					order:order
			})
	}
	function saveExcel(){
		$("form").submit();
	}
</script>
</head>
<body>
	<table id="tt"></table>
	
	<div id="tb">
		<form id="queryform" action="${pageContext.request.contextPath }/managerSaveExcel.action" method="post">
		 <font style="margin-left:10px;">专业</font> <input id="profession" name="profession"
			class="easyui-combobox"
			data-options="panelHeight:'auto',editable:true,valueField:'profession',textField:'profession',data:'rows',url:'${pageContext.request.contextPath}/managerGetProfessionByMid.action',onSelect: function(rec){var url = '${pageContext.request.contextPath }/managerGetClazzByProfessionAndMid.action?profession='+rec.profession;$('#clazz').combobox('reload', url);}"
			style="width: 90px;" /> &nbsp;&nbsp;<font>班别</font> <input id="clazz"
			class="easyui-combobox" name="clazz"
			data-options="textField:'clazz',valueField:'clazz',panelHeight:'auto',editable:false"
			value="" style="width: 70px;"> &nbsp;&nbsp;<font>姓名</font>&nbsp;<input
			id="sname" name="sname" type="text" value="" style="width: 80px;">&nbsp;&nbsp;
			<font style="margin-left: 10px">考试名称</font>&nbsp;<input id="examname" name="examname" class="easyui-combobox"
						data-options="panelHeight:'auto',editable:true,valueField:'examname',textField:'examname',data:'rows',url:'${pageContext.request.contextPath}/managerGetExamination.action'" style="width: 90px;"  />
			
		&nbsp;&nbsp;<font>及格</font> <select id="ispass" name="ispass"
			class="easyui-combobox" data-options="panelHeight:'auto'"
			style="width: 90px; text-align: center;">
			<option value="">--请选择--</option>
			<option value="是">是</option>
			<option value="否">否</option>
		</select> &nbsp;&nbsp;
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:searchResult()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
		<div style="float: right;margin-right:50px;">
		<a  onclick="saveExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-signout'">导出成绩单</a>
		</div>
		</form>
	</div>
</body>
</html>