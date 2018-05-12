<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<style type="text/css">
font{font-size: 12px;}

.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
}
table {
    background-color: transparent;
    font-size: 13px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
.table-hover > tbody > tr:hover {
  background-color: #f5f5f5;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/scripts/echarts.common.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
	function statisticAnalysis(){
		var reg = /^[1-9]\d*$/;
		//校验部分
		
		var medium = $("#medium").val();
		var good = $("#good").val();
		var excellent = $("#excellent").val();
		var examname = $("#examname").val();
		if(examname==""){
			$.messager.alert("系统提示", "请选择分析哪一场考试！");
			return;
		}
		if(medium==""){
			$.messager.alert("系统提示", "请输入中等级别的分数！");
			return;
		}
		if(!reg.test(medium)){
			$.messager.alert("系统提示", "中等级别的分数必须为正整数！");
			return;
		}
		if(good==""){
			$.messager.alert("系统提示", "请输入良好级别的分数！");
			return;
		}
		if(!reg.test(good)){
			$.messager.alert("系统提示", "良好级别的分数必须为正整数！");
			return;
		}
		if(excellent==""){
			$.messager.alert("系统提示", "请输入优秀级别的分数！");
			return;
		}
		if(!reg.test(excellent)){
			$.messager.alert("系统提示", "优秀级别的分数必须为正整数！");
			return;
		}
		if(medium<good && good<excellent){
			$("form").submit();
			}
		else{
			$.messager.alert("系统提示", "请检查输入数据是否合法：中等<良好<优秀");
			return;
			}
		
	}
	
</script>
</head>
<body>
	
	<div id="tb" class="datagrid-toolbar">
		<form id="queryform" action="${pageContext.request.contextPath }/managerStatisticAnalysis.action" method="post">
		 <font >专业</font> <input id="profession" name="profession"
			class="easyui-combobox"
			data-options="panelHeight:'auto',editable:true,valueField:'profession',textField:'profession',data:'rows',url:'${pageContext.request.contextPath}/managerGetProfessionByMid.action',onSelect: function(rec){var url = '${pageContext.request.contextPath }/managerGetClazzByProfessionAndMid.action?profession='+rec.profession;$('#clazz').combobox('reload', url);}"
			style="width: 90px;" /> &nbsp;&nbsp;<font>班别</font> <input id="clazz"
			class="easyui-combobox" name="clazz"
			data-options="textField:'clazz',valueField:'clazz',panelHeight:'auto',editable:false"
			value="" style="width: 70px;"> &nbsp;&nbsp;
			<font style="margin-left: 10px">考试名称</font>&nbsp;<input id="examname" name="examname" class="easyui-combobox"
						data-options="panelHeight:'auto',editable:true,valueField:'examname',textField:'examname',data:'rows',url:'${pageContext.request.contextPath}/managerGetExamination.action'" style="width: 90px;"  />
	    &nbsp;&nbsp;&nbsp;&nbsp;<font>分数等级设定：</font>
		&nbsp;&nbsp;<font>中等</font>&nbsp;<input
			id="medium" name="medium" type="text" value="" style="width: 40px;"><font>以上</font>
		&nbsp;&nbsp;<font>良好</font>&nbsp;<input
			id="good" name="good" type="text" value="" style="width: 40px;"><font>以上</font>
			&nbsp;&nbsp;<font>优秀</font>&nbsp;<input
			id="excellent" name="excellent" type="text" value="" style="width: 40px;"><font>以上</font>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:statisticAnalysis()" class="easyui-linkbutton"
			data-options="iconCls:'icon-sum'">统计分析</a>
		
		</form>
	</div>
	
	<c:if test="${scoreAnalysis!=null}">
	<h4>统计结果如下</h4><div style="margin-left: 14px;margin-bottom: 20px;"><a href="javascript:showChart()" class="easyui-linkbutton"
			data-options="iconCls:'icon-large-chart'">图表展示</a></div>
		<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr>
				    <td>考试名称</td>
					<td>参加考试人数</td>
					<td>不及格人数</td>
					<td>及格人数</td>
					<td>中等人数</td>
					<td>良好人数</td>
					<td>优秀人数</td>
					<td>及格率</td>
					<td>最高分</td> 
					<td>最低分</td>
					<td>平均分</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><span id="examname">${examname }</span></td>
					<td><span id="totalNum">${scoreAnalysis.totalNum }</span></td>
					<td><span id="notpassNum">${scoreAnalysis.notpassNum }</span></td>
					<td><span id="passNum">${scoreAnalysis.passNum }</span></td>
					<td><span id="mediumNum">${scoreAnalysis.mediumNum }</span></td>
					<td><span id="goodNum">${scoreAnalysis.goodNum }</span></td>
					<td><span id="excellentNum">${scoreAnalysis.excellentNum }</span></td>
					<td><span id="passRate">${scoreAnalysis.passRate }%</span></td>
					<td><span id="topScore">${scoreAnalysis.topScore }</span></td>
					<td><span id="lowScore">${scoreAnalysis.lowScore }</span></td>
					<td><span id="averageScore">${scoreAnalysis.averageScore }</span></td>
				</tr>
			</tbody>
		</table>
		<div id="main" style="width: 800px;height:400px;"></div>
		</c:if>
		 
    <script type="text/javascript">
    function showChart(){
    	 // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		var num = [];
		num.push($("#totalNum").text());
		num.push($("#notpassNum").text());
		num.push($("#passNum").text());
		num.push($("#mediumNum").text());
		num.push($("#goodNum").text());
		num.push($("#excellentNum").text());
		alert(num);
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '考试图表分析'
            },
            tooltip: {},
            legend: {
                data:['人数']
            },
            xAxis: {
                data: ["参加考试人数","不及格人数","及格人数","中等人数","良好人数","优秀人数"]
            },
            yAxis: {},
            series: [{
                name: '人数',
                type: 'bar',
                data: num
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

        }
       
    </script>
</body>
</html>