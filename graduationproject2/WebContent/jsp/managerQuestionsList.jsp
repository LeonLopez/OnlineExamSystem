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
	$(function() {
		$("#dg")
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/managerGetQuestionsList.action',
							pagination : true,
							fit : true,
							fitColumns : true,
							toolbar : '#tb',
							rownumbers : true,
							columns : [ [
									{
										field : 'cb',
										align : 'center',
										checkbox : true,
									},
									{
										field : 'lessonName',
										title : '课程名称',
										width : 80,
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
									},
									{
										field : 'createuser',
										title : '创建人',
										width : 100,
										align : 'center',
									},
									{
										field : 'createtime',
										title : '创建时间',
										width : 150,
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
									} ] ]
						})
	})

	function resetValue() {
		$('#cc2').combobox('clear');//清空选中项  
		$('#cc3').combobox('clear');//清空选中项  
		$("#type").combobox('clear');
		$("#difficulty").combobox('clear');
		$("input[name=answer]").prop("checked", false);
		$("input[name=judgeanswer]").prop("checked", false);
		$("#subject").val("");
		$("#optiond").val("");
		$("#optionc").val("");
		$("#optionb").val("");
		$("#optiona").val("");
		$("#remark").val("");
		$("#addorupdate").val("");
		$("#id").val("");
		$('#queryLesson').combobox('clear');//清空选中项  
		$('#queryKnowledge').combobox('clear');//清空选中项  
		$("#queryType").combobox('clear');
		$("#queryDifficulty").combobox('clear');
	}

	function openAddDialog() {
		$("#addorupdate").val("1");
		$("#dlg").dialog("open").dialog("setTitle", "添加考试题目");
	}

	function openUpdateDialog() {
		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow == null) {
			$.messager.alert("系统提示", "请选择要修改的数据！");
			return;
		}
		if (selectedRow.type == "多选") {
			//选择题答案回显
			var str = selectedRow.answer;
			var arr = str.split(',');
			for (var i = 0; i < arr.length; i++) {
				$("#fm input[name='answer']").each(function() {

					if ($(this).attr("value") == arr[i]) {
						//alert(arr[i]);
						//用prop解决checked失效问题
						$(this).prop("checked", true);
					}
				});
			}
			//判断题答案回显
			/*$("#fm input[name='judgeanswer']").each(function() {
			    if ($(this).attr("value") == selectedRow.judgeanswer) {
			        $(this).attr("checked", true);
			    }

			});*/

			$('#cc2').combobox('setValue', selectedRow.lessonid);
			$('#cc3').combobox('setValue', selectedRow.knowledgeid);
			$('#type').combobox('setValue', selectedRow.type);
			$('#difficulty').combobox('setValue', selectedRow.difficulty);
			$("#subject").val(selectedRow.subject);
			$("#optiona").val(selectedRow.optiona);
			$("#optionb").val(selectedRow.optionb);
			$("#optionc").val(selectedRow.optionc);
			$("#optiond").val(selectedRow.optiond);
			$("#remark").val(selectedRow.note);
			$("#id").val(selectedRow.id);

		} else {
			$("#fm").form("load", selectedRow);
		}

		//$("#fm").form("load", selectedRow);

		$("#addorupdate").val("2");
		$("#dlg").dialog("open").dialog("setTitle", "修改考试题目");
	}

	function closeDialog() {
		resetValue();
		$("#dlg").dialog("close");
	}

	function addOrUpdateQuestions() {
		var choice = $("#addorupdate").val();
		var myUrl;
		if (choice == "1") {
			myUrl = "${pageContext.request.contextPath }/managerAddQuestion.action";
		} else {
			myUrl = "${pageContext.request.contextPath }/managerUpdateQuestion.action";
		}
		$("#fm").form("submit", {
			url : myUrl,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result == "success") {
					$.messager.alert("系统提示", "操作成功！");
					closeDialog();
					resetValue();
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "操作失败，请联系系统管理员！");
					resetValue();
				}
			}
		})
	}

	function deleteQuestions() {
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
											url : '${pageContext.request.contextPath }/managerDeleteQuestion.action',
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

	$(document).ready(function() {
		$("#answercontent2").hide();
		$("#type").combobox({
			onChange : function(newvalue, oldvalue) {
				if (newvalue == '判断') {
					$("#choicecontent").hide();
					$("#answercontent1").hide();
					$("#answercontent2").show();
				} else {
					$("#choicecontent").show();
					$("#answercontent1").show();
					$("#answercontent2").hide();
				}
			}
		});
		$("#cc2").combobox({
			onChange : function(newvalue, oldvalue) {
				$('#cc3').combobox('clear');//清空选中项  
			}
		});
	});

	function searchQuestion(){
		 var lessonid=$('#queryLesson').val();
		 var knowledgeid=$('#queryKnowledge').val();
		 var type=$("#queryType").val();
		 var difficulty=$("#queryDifficulty").val();
			$("#dg").datagrid("load",{
					lessonid:lessonid,
					knowledgeid:knowledgeid,
					type:type,
					difficulty:difficulty
			})
	}
</script>
</head>
<body style="margin: 1px">
	<table id="dg"></table>
	<div id="tb">
		&nbsp;<a href="javascript:openAddDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加题目</a> &nbsp;<a
			href="javascript:openUpdateDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true">修改题目</a> &nbsp;<a
			href="javascript:deleteQuestions()" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除题目</a>
		<span style="margin-left:165px;">
			所属课程 <input id="queryLesson" class="easyui-combobox" name="lessonid"
				data-options="valueField: 'id',textField: 'name',panelHeight:'auto',url: '${pageContext.request.contextPath }/managerGetLesson.action',onSelect: function(rec){var url = '${pageContext.request.contextPath }/managerGetKnowledge.action?id='+rec.id;$('#queryKnowledge').combobox('reload', url);}" style="width: 80px">
			&nbsp;&nbsp;所属知识点 <input id="queryKnowledge" class="easyui-combobox" name="knowledgeid"
				data-options="textField:'name',valueField:'id',panelHeight:'auto'"
				value="" style="width: 80px"> &nbsp;&nbsp;题目类型 <select id="queryType" name="type"
				class="easyui-combobox" data-options="panelHeight:'auto'"
				style="width: 80px">
				<option value="">-请选择-</option>
				<option value="单选">单选</option>
				<option value="多选">多选</option>
				<option value="判断">判断</option>
			</select> &nbsp;&nbsp;题目难度 <select id="queryDifficulty" name="difficulty"
				class="easyui-combobox" data-options="panelHeight:'auto'"
				style="width: 80px">
				<option value="">-请选择-</option>
				<option value="简单">简单</option>
				<option value="一般">一般</option>
				<option value="困难">困难</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:searchQuestion()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
		</span>


	</div>

	<div id="dlg" class="easyui-dialog"
		data-options="buttons:'#bts',closed:true"
		style="width: 700px; height: 450px">
		<form id="fm" method="post">
			<table cellpadding="10px">

				<tr>
					<td>所属课程</td>
					<td><input id="cc2" class="easyui-combobox" name="lessonid"
						data-options="valueField: 'id',textField: 'name',panelHeight:'auto',url: '${pageContext.request.contextPath }/managerGetLesson.action',onSelect: function(rec){var url = '${pageContext.request.contextPath }/managerGetKnowledge.action?id='+rec.id;$('#cc3').combobox('reload', url);}">
					</td>
				</tr>
				<tr>
					<td>所属知识点</td>
					<td><input id="cc3" class="easyui-combobox" name="knowledgeid"
						data-options="textField:'name',valueField:'id',panelHeight:'auto'"
						value=""></td>
				</tr>
				<tr>
					<td><input type="hidden" id="id" name="id"></td>
					<td><input type="hidden" id="addorupdate" value=""></td>
				</tr>
				<tr>
					<td>题目类型</td>
					<td><select id="type" name="type" class="easyui-combobox"
						data-options="panelHeight:'auto'" style="width: 70px">
							<option value="单选">单选</option>
							<option value="多选">多选</option>
							<option value="判断">判断</option>
					</select></td>


				</tr>
				<tr>
					<td>题目难度</td>
					<td><select id="difficulty" name="difficulty"
						class="easyui-combobox" data-options="panelHeight:'auto'"
						style="width: 70px">
							<option value="简单">简单</option>
							<option value="一般">一般</option>
							<option value="困难">困难</option>
					</select></td>


				</tr>
				<tr>
					<td>考试题目</td>
					<td><textarea id="subject" name="subject" cols="65" rows="6"></textarea></td>

				</tr>

			</table>
			<div id="choicecontent">
				<table cellpadding="10px">

					<tr>
						<td>选项A</td>
						<td style="padding-left: 36px;"><input id="optiona"
							class="easyui-validatebox" name="optiona" style="width: 480px"></td>
					</tr>
					<tr>

						<td>选项B</td>
						<td style="padding-left: 36px;"><input id="optionb"
							class="easyui-validatebox" name="optionb" style="width: 480px"></td>
					</tr>
					<tr>
						<td>选项C</td>
						<td style="padding-left: 36px;"><input id="optionc"
							class="easyui-validatebox" name="optionc" style="width: 480px"></td>
					</tr>
					<tr>
						<td>选项D</td>
						<td style="padding-left: 36px;"><input id="optiond"
							class="easyui-validatebox" name="optiond" style="width: 480px"></td>
					</tr>
				</table>
			</div>
			<table cellpadding="10px">
				<tr>
					<td>正确答案</td>
					<td id="answercontent1" style="padding-left: 36px;">A<input
						type="checkbox" name="answer" checked="checked" value="A">&nbsp;&nbsp;&nbsp;&nbsp;
						B<input type="checkbox" name="answer" value="B">&nbsp;&nbsp;&nbsp;&nbsp;
						C<input type="checkbox" name="answer" value="C">&nbsp;&nbsp;&nbsp;&nbsp;
						D<input type="checkbox" name="answer" value="D">
					</td>
					<td id="answercontent2" style="padding-left: 36px;"><label
						for="correct"><input id="correct" type="radio"
							name="judgeanswer" checked="checked" value="正确">正确</label>&nbsp;&nbsp;&nbsp;&nbsp;<label
						for="wrong"> <input id="wrong" type="radio"
							name="judgeanswer" value="错误">错误
					</label></td>
				</tr>
			</table>
			<table cellpadding="10px">
				<tr>
					<td>备注</td>
					<td style="padding-left: 46px;"><input id="remark" type="text"
						name="note" style="width: 480px"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="bts">
		<a href="javascript:addOrUpdateQuestions()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">保存</a> <a
			href="javascript:closeDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">关闭</a>
	</div>
</body>
</html>