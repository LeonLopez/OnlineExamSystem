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
		$("#dg")
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/managerGetTaotiList.action',
							pagination : true,
							fit : true,
							fitColumns : true,
							toolbar : '#tb',
							rownumber : true,
							columns : [ [ {
								field : 'cb',
								align : 'center',
								checkbox : true,
							}, {
								field : 'id',
								title : '编号',
								width : 100,
								align : 'center',
							}, {
								field : 'name',
								title : '试卷名称',
								width : 200,
								align : 'center',
							}, {
								field : 'lessonname',
								title : '所属课程',
								width : 200,
								align : 'center',
							}, {
								field : 'singlenum',
								title : '单选题数',
								width : 100,
								align : 'center',
							}, {
								field : 'singlescore',
								title : '单选分值',
								width : 100,
								align : 'center',
							}, {
								field : 'multinum',
								title : '多选题数',
								width : 100,
								align : 'center',
							}, {
								field : 'multiscore',
								title : '多选分值',
								width : 100,
								align : 'center',
							}, {
								field : 'trueorfalsenum',
								title : '判断题数',
								width : 100,
								align : 'center',
							}, {
								field : 'trueorfalsescore',
								title : '判断分值',
								width : 100,
								align : 'center',
							}, {
								field : 'totalscore',
								title : '总分',
								width : 100,
								align : 'center',
							}, {
								field : 'difficultylevel',
								title : '难度等级',
								width : 100,
								align : 'center',
							}, {
								field : 'createuser',
								title : '创建人',
								width : 100,
								align : 'center',
							}, {
								field : 'createtime',
								title : '创建日期',
								width : 200,
								align : 'center',
								formatter : function(value) {
									var date = new Date(value);
									var y = date.getFullYear();
									var m = date.getMonth() + 1;
									var d = date.getDate();
									return y + "-" + m + "-" + d;
								}
							}, ] ]
						})
						
	})
    //打开新建套题窗口
	function openAddTaotiDialog() {
		$("#name").attr("readonly", false);
		$("#dlg").dialog("open").dialog("setTitle", "添加试卷");
	}
    //新建套题
	function addTaoti() {
		$("#fm").form("submit", {
			url : "${pageContext.request.contextPath }/managerAddTaoti.action",
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result == "success") {
					$.messager.alert("系统提示", "操作成功！");
					closeDialog();
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "操作失败，请联系系统管理员！");
				}
			}
		})
	}
    //新建试卷的关闭窗口
	function closeDialog() {
		$("#name").val("");
		$("#dlg").dialog("close");
	}
    //删除套题
	function deleteTaoti() {
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
											url : '${pageContext.request.contextPath }/managerDeleteTaoti.action',
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




	
    //手动组卷窗口
	function openMakeTaotiDialog() {
		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow == null) {
			$.messager.alert("系统提示", "请选择试卷！");
			return;
		}
		var taotiid = selectedRow.id;
		$("#taotiid").val(taotiid);
		var lessonid = selectedRow.lessonid;
		$('#cc2').combobox({
		    url:'${pageContext.request.contextPath }/managerGetKnowledge.action?id='+lessonid,
		    valueField:'id',
		    textField:'name'
		});
		$("#questions")
		.datagrid(
				{
					url : '${pageContext.request.contextPath}/managerGetQuestionsListByLessonId.action?lessonid='+lessonid,
					fit : true,
					fitColumns : true,
					toolbar : '#tb2',
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
								field : 'knowledgeName',
								title : '知识点',
								width : 80,
								align : 'center',
							},
							{
								field : 'subject',
								title : '考试题目',
								width : 500,
								align : 'center',
							},
							{
								field : 'type',
								title : '题目类型',
								width : 60,
								align : 'center',
							},

							{
								field : 'difficulty',
								title : '难度',
								width : 60,
								align : 'center',
							}
							
							] ]
				})
		$("#dlg2").dialog("open").dialog("setTitle", "人工组卷");

	}
    //手动组卷搜索
	function searchResult(){
		 var knowledgeid=$("#cc2").val();
		 var type=$("#type2").val();
		 var difficulty=$("#difficulty2").val();

		 //alert(knowledgeid+"+"+type);
			$("#questions").datagrid("load",{
					knowledgeid:knowledgeid,
					type:type,
					difficulty:difficulty
					
			})
	}
    //手动组卷
	function addQuestionsToTaoti() {
		var reg = /^[1-9]\d*$/;
		var selections = $("#questions").datagrid("getSelections");
		//校验部分
		if (selections.length == 0) {
			$.messager.alert("系统提示", "请选择题目！");
			return;
		}
		var score = $("#score").val();
		//alert(score);
		if(score==""){
			$.messager.alert("系统提示", "请输入分值（正整数）！");
			return;
		}
		var ival = parseInt(score);
		if(!reg.test(ival)){
			$.messager.alert("系统提示", "请输入正整数分值！");
			return;
		}
		var taotiid = $("#taotiid").val();
		//alert(taotiid);
        //为试卷添加题目
		var ids = [];
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		var idsStr = ids.join();
		$.messager
				.confirm(
						"系统提示",
						"确定要添加这" + selections.length + "道题目到该试卷吗？",
						function(r) {
							if (r) {
								$
										.ajax({
											url : '${pageContext.request.contextPath }/managerAddQuestionsToTaoti.action?score='+ival+'&taotiid='+taotiid,
											data : idsStr,
											type : 'post',
											contentType : 'application/json;charset=utf-8',
											success : function(result) {
												if (result == "success") {
													$.messager.alert("系统提示",
															"添加成功！");
													$("#dg").datagrid("reload");
													closeDialog2();
												} else {
													$.messager.alert("系统提示",
															"添加失败，请联系系统管理员！");
												}
											}
										})
							}
						})

	}
	//手动组卷的关闭窗口
	function closeDialog2() {
		$('#cc2').combobox('clear');//清空选中项  
		$("#type2").combobox('clear');
		$("#difficulty2").combobox('clear');
		searchResult();
		$("#dlg2").dialog("close");
	}



	
    //打开自动组卷窗口
	function openAutoTaotiDialog() {
		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow == null) {
			$.messager.alert("系统提示", "请选择试卷！");
			return;
		}
		var taotiid = selectedRow.id;
		$("#taotiid").val(taotiid);
		var lessonid = selectedRow.lessonid;
		$("#lessonid").val(lessonid);
		//alert("lessonid"+lessonid);
		$('#cc3').combobox({
		    url:'${pageContext.request.contextPath }/managerGetKnowledge.action?id='+lessonid,
		    valueField:'id',
		    textField:'name'
		});
		$("#dlg3").dialog("open").dialog("setTitle", "自动组卷");

	}

	//自动组卷
    function autoMakeTaoti(){
    	var reg = /^[1-9]\d*$/;
    	var flag1 = 1;
    	var flag2 = 1;
    	var score = $("#score3").val();
    	var questionNum = $("#questionNum").val();
		if(score==""){
			$("#scoreError").text("请输入正整数！");
			flag1=0;
		}else{
			$("#scoreError").text("");
            flag1=1;
		}
		
		if(!reg.test(score)){
			$("#scoreError").text("请输入正整数！");
			flag1=0;
		}else{
			$("#scoreError").text("");
			flag1=1;
		}
		if(questionNum==""){
			$("#questionNumError").text("请输入正整数！");
			flag2=0;
		}else{
			$("#questionNumError").text("");
			flag2=1;
		}
		
		if(!reg.test(questionNum)){
			$("#questionNumError").text("请输入正整数！");
			flag2=0;
		}else{
			$("#questionNumError").text("");
			flag2=1;
		}
		if(flag1==0 || flag2==0){
			return;
		}
		//自动组卷处理部分
		//score = parseInt(score);
		questionNum = parseInt(questionNum);
		var taotiid = $("#taotiid").val();
		var lessonid = $("#lessonid").val();
		$("#fm3").form("submit", {
			url : '${pageContext.request.contextPath }/managerAutoAddQuestionsToTaoti.action?taotiid='+taotiid+'&lessonid='+lessonid,
			
			success : function(result) {
				if (result == "success") {
					$.messager.alert("系统提示", "添加成功！");
					$("#dg").datagrid("reload");
					closeDialog3();
				} else {
					alert(result);
					var num = parseInt(result);
					alert(num);
					$.messager.alert("系统提示", "您好，题库中满足上述条件的题数为"+num+"道，请修改题数或到题库中添加题目！");
					
				}
			}
		})
    	
    }
    //自动组卷的关闭窗口
	function closeDialog3() {
		$('#cc3').combobox('clear');//清空选中项  
		$("#type3").combobox('clear');
		$("#difficulty3").combobox('clear');
		$("#score3").val("");
		$("#questionNum").val("");
		$("#dlg3").dialog("close");
	}

	//查看试卷知识点详情
	function openKnowledgeInfoDialog(){
		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow == null) {
			$.messager.alert("系统提示", "请选择试卷！");
			return;
		}
		var taotiid = selectedRow.id;
		var lessonid = selectedRow.lessonid;
		//alert(taotiid);
		$
		.ajax({
			url : '${pageContext.request.contextPath }/managerGetKnowledgeDetail.action?lessonid='+lessonid+'&taotiid='+taotiid,
			type : 'post',
			dataType:"json",
			success : function(result) {
				       //alert(result.knowledgerate);
				       //alert("knowledgepoints"+result.knowledgepoints);
				       $("#knowledgerate").text(result.knowledgerate);
				       $("#knowledgepoints").text(result.knowledgepoints);
				       $("#lessonknowledgepoints").text(result.lessonknowledgepoints);
			}
		})
		$("#dlg4").dialog("open").dialog("setTitle", "查看试卷知识点");
	}
	function previewTaoti(){

		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow == null) {
			$.messager.alert("系统提示", "请选择试卷！");
			return;
		}
		var taotiid = selectedRow.id;
		window.open("${pageContext.request.contextPath }/managerPreviewTaoti.action?id="+taotiid);

	}
</script>
</head>
<body>
    <!-- 试卷列表 -->
	<table id="dg"></table>
	<!-- 试卷列表的工具栏 -->
	<div id="tb">
		<a href="javascript:openAddTaotiDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">新建试卷</a> <a
			href="javascript:deleteTaoti()" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除试卷</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			href="javascript:openMakeTaotiDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-service',plain:true">人工组卷</a> <a
			href="javascript:openAutoTaotiDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-print',plain:true">自动组卷</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a
			href="javascript:previewTaoti()" class="easyui-linkbutton"
			data-options="iconCls:'icon-tip',plain:true">预览试卷</a>&nbsp;&nbsp;&nbsp;
			<a
			href="javascript:openKnowledgeInfoDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-definition',plain:true">查看试卷知识点</a>
	</div>
	
	<!-- 新建试卷的窗口内容 -->
	<div id="dlg" align="center" class="easyui-dialog"
		data-options="buttons:'#bts1',closed:true"
		style="width: 400px; height: 200px">
		<form id="fm" method="post">
			<table style="padding: 20px;">
				<tr>
					<td>试卷名称</td>
					<td><input id="name" class="easyui-validatebox" name="name"
						data-options="required:true,panelHeight:'auto'"></td>
				</tr>
				<tr>
					<td>所属课程</td>
					<td><input id="cc" name="lessonid" class="easyui-combobox"
						data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',data:'rows',url:'${pageContext.request.contextPath}/managerGetLesson.action'" /></td>
				</tr>


			</table>
		</form>
	</div>
	<!-- 新建试卷的按钮组 -->
	<div id="bts1" align="center">
		<a href="javascript:addTaoti()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">保存</a> <a
			href="javascript:closeDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">关闭</a>
	</div>
	
	
	
	<!-- 手动组卷的窗口 -->
	<div id="dlg2" align="center" class="easyui-dialog"
		data-options="buttons:'#bts2',closed:true"
		style="width: 800px; height: 450px">
		<input type="hidden" id="taotiid" name="taotiid">
		<form id="fm2" method="post">

				<div id="condition" style="margin:0px,auto;margin-top:20px;">
					<span>所属知识点</span>
					<input id="cc2" class="easyui-combobox" name="knowledgeid"
						data-options="textField:'name',valueField:'id',panelHeight:'auto'"
						value="" style="width: 120px;"></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span>题目类型</span>
					<select id="type2" name="type" class="easyui-combobox"
						data-options="panelHeight:'auto'" style="width: 90px">
						    <option value="">--请选择--</option>
							<option value="单选">单选</option>
							<option value="多选">多选</option>
							<option value="判断">判断</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span>题目难度</span>
					<select id="difficulty2" name="difficulty"
						class="easyui-combobox" data-options="panelHeight:'auto'"
						style="width: 90px">
						    <option value="">--请选择--</option>
							<option value="简单">简单</option>
							<option value="一般">一般</option>
							<option value="困难">困难</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:searchResult()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'" >查询</a>
				</div>	
				
		</form>
		<hr/>
		<!-- 手动组卷的问题列表 -->
		<table id="questions"></table>
	</div>
	<!-- 手动组卷工具栏 -->
	<div id="tb2">
		
		<font style="margin-left: 10px">设置题目分值</font>&nbsp;<input id="score" name="score"
			type="text" value="" style="width: 50px; " >分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:addQuestionsToTaoti()" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加题目到该试卷</a>
	</div>
	
	
	
	
	
	<!-- 自动组卷的窗口 -->
	<div id="dlg3" align="center" class="easyui-dialog"
		data-options="buttons:'#bts3',closed:true"
		style="width: 400px; height: 400px">
		<input type="hidden" id="lessonid" name="lessonid">
		<form id="fm3" method="post">
			<table cellpadding="10px">
				<tr>
					<td>所属知识点</td>
					<td><input id="cc3" class="easyui-combobox" name="knowledgeid"
						data-options="textField:'name',valueField:'id',panelHeight:'auto'"
						value=""></td>
				</tr>

				<tr>
					<td>题目类型</td>
					<td><select id="type3" name="type" class="easyui-combobox"
						data-options="panelHeight:'auto'" style="width: 90px">
						    <option value="">--请选择--</option>
							<option value="单选">单选</option>
							<option value="多选">多选</option>
							<option value="判断">判断</option>
					</select></td>


				</tr>
				<tr>
					<td>题目难度</td>
					<td><select id="difficulty3" name="difficulty"
						class="easyui-combobox" data-options="panelHeight:'auto'"
						style="width: 90px">
						    <option value="">--请选择--</option>
							<option value="简单">简单</option>
							<option value="一般">一般</option>
							<option value="困难">困难</option>
					</select></td>
				</tr>
				<tr>
					<td>设置题目分值</td>
					<td><input id="score3" name="score"
			type="text" value="1" style="width: 70px; " >&nbsp;分&nbsp;&nbsp;<span id="scoreError" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>添加题目数量</td>
					<td><input id="questionNum" name="questionNum"
			type="text" value="1" style="width: 70px; " >&nbsp;道&nbsp;&nbsp;<span id="questionNumError" style="color:red;"></span></td>
				</tr>

			</table>
			<div style="margin-top: 30px;"><a
			href="javascript:autoMakeTaoti()" class="easyui-linkbutton"
			data-options="iconCls:'icon-print',plain:true" style="border-width: 1px;">自动组卷</a></div>
		</form>
	</div>
	
	<div id="bts2" align="center">
		 <a
			href="javascript:closeDialog2()" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">关闭</a>
	</div>
	<div id="bts3" align="center">
		 <a
			href="javascript:closeDialog3()" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">关闭</a>
	</div>
	
	<!-- 查看试卷知识点的窗口 -->
	<div id="dlg4" align="center" class="easyui-dialog"
		data-options="closed:true"
		style="width: 550px; height: 260px">
		<div style="margin-top: 10px;margin-left:10px;margin-right:10px;">
			<table cellpadding="10px" border="1" cellspacing="0" bordercolor="#e0ecff">
				<tr>
					<td>知识点覆盖率</td>
					<td><span id="knowledgerate"></span>%</td>
				</tr>
                <tr>
					<td>试卷所含知识点</td>
					<td><p id="knowledgepoints"></p></td>
				</tr>
				<tr>
					<td>课程所含知识点</td>
					<td><p id="lessonknowledgepoints"></p></td>
				</tr>

			</table>
		</div>
	</div>
</body>
</html>