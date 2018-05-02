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
										field : 'id',
										title : '编号',
										width : 100,
										align : 'center',

									},
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
	/*
	 $(function() {
	 alert("error");
	 $.ajax({
	 type: "post",
	 url:'${pageContext.request.contextPath}/managerGetProfession.action' ,
	 dataType: "json",
	 success: function (response) {
	
	 var ddl = $("#profession");//列表框id
	 //方法1：添加默认节点
	 ddl.append("<option value='-1'>--请选择--</option>");
	 //转成Json对象
	 var result = eval(response.obj);
	 //循环遍历 下拉框绑定
	 $(result).each(function (key) {
	 var opt = $("<option></option>").text(result[key].profession).val(result[key].profession);
	 ddl.append(opt);
	 });
	
	 },
	 error: function (data){
	 alert("error");
	 }
	 });
	 });

	function searchResult() {
	var queryoption = $("#queryoption").val();
	var optionvalue = $("#optionvalue").val();

	$("#tt").datagrid("load", {
		option : queryoption,
		value : optionvalue
	})
}
	 */
	function searchResult(){
		 var profession1=$("#profession").val();
		 var clazz1=$("#clazz").val();
		 var examname1=$("#examname").val();
		 var sname1=$("#sname").val();
		 var ispass1=$("#ispass").val();
		 var order1=$("#order").val();

		 alert(profession1+"+"+clazz1+examname)
			/*if(queryoption == "createtime"){
				var reg=/^\d{4}\-\d{2}\-\d{2}$/;
				if(!reg.test(optionvalue) && optionvalue!=""){
					alert("日期格式错误！请输入正确格式的日期，如：1990-09-06");
					return false;
				}
			}*/
			$("#tt").datagrid("load",{
					profession:profession1,
					clazz:clazz1,
					examname:examname1,
					sname:sname1,
					ispass:ispass1,
					order:order1,
			})
	}
</script>
</head>
<body>
	<table id="tt"></table>
	<div id="tb">
		<!-- 
	    &nbsp;&nbsp;<font>班别</font>
		<select id="clazz" name="clazz" class="easyui-combobox"
			data-options="panelHeight:'auto'"
			style="width: 90px; text-align: center;">

		</select>&nbsp;&nbsp;<font>考试名称</font> <select id="examname" name="examname"
			class="easyui-combobox" data-options="panelHeight:'auto'"
			style="width: 150px; text-align: center;">

		</select>  
		-->
		 <font style="margin-left: 10px">专业</font>&nbsp;<input id="profession" name="profession"
			type="text" value="" style="width: 100px; " >
			<font style="margin-left: 10px">班别</font>&nbsp;<input id="clazz" name="clazz"
			type="text" value="" style="width: 60px; " >
			<font style="margin-left: 10px">考试名称</font>&nbsp;<input id="examname" name="examname"
			type="text" value="" style="width: 100px; " >
			<font style="margin-left: 10px">姓名</font>&nbsp;<input id="sname"
			type="text" value="" style="width: 80px; ">
		&nbsp;&nbsp;<font>及格</font> <select id="ispass" name="ispass"
			class="easyui-combobox" data-options="panelHeight:'auto'"
			style="width: 90px; text-align: center;">
			<option value="">--请选择--</option>
			<option value="是">是</option>
			<option value="否">否</option>
		</select> &nbsp;&nbsp;
		<!--  <font>总分</font> <select id="order" name="order"
			class="easyui-combobox" data-options="panelHeight:'auto'"
			style="width: 90px; text-align: center;">
			<option value="">--请选择--</option>
			<option value="restotal desc">从高到低</option>
			<option value="restotal asc">从低到高</option>
		</select> -->
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:searchResult()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
		<div style="float: right;margin-right:50px;">
		<a href="${pageContext.request.contextPath }/managerSaveExcel.action" class="easyui-linkbutton" data-options="iconCls:'icon-signout'">导出成绩单</a>
		</div>
	</div>
</body>
</html>