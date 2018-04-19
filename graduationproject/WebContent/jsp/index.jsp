<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课程考试系统</title>

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../styles/personal_center.css" rel="stylesheet">
    <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
<div class="container-fluid">
    <div class="row" id="head">
        <div class="col-md-2">
            <p><img  src="../images/logo.png"></p>
        </div>
        <div class="col-md-10">
            <h4>课程考试系统</h4>
            <h4><small>Online Examination System</small></h4>
        </div>
    </div >
    <div class="row" id="body">
        <div class="col-md-3">
          
            <div class="row">
                <h5><strong>小明</strong></h5>
            </div>
            <div class="row">
                <ul class="list-unstyled">
                    <li><button class="btn btn-default" id="main-btn" style="background-color: #307ac1;color:#fff">首页</button></li>
                    <li><button class="btn btn-default" id="cart-btn" >在线考试</button></li>
                    <li><button class="btn btn-default" id="psn-btn">成绩查询</button></li>
                    <li><button class="btn btn-default" id="pbuy-btn">知识库</button></li>
                    <li><button class="btn btn-default" id="pcol-btn">个人资料</button></li>
                    
                    <li><button class="btn btn-default" id="exit-btn">退出</button></li>
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <iframe
                    width="100%"
                    height="500px"
                    frameborder="0"
                    id = "contentiframe"
                    name = "contentiframe"
                    scrolling="yes"
                    src = "examList.jsp">
            </iframe>
        </div>
    </div>
    <div class="row" id="footer">
        <div class="col-md-12">
           <h5><small>copyright@2016 14级计科3班 郭明周</small></h5>
        </div>
    </div>
    <div class="row" id="trail">
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../scripts/jquery-1.11.0.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function(){
        /*设置导航栏按钮背景色和字体颜色*/
        $("#body .col-md-3 button").click(function(){
            $("#body .col-md-3 button").css("background-color","#ffffff");
            $("#body .col-md-3 button").css("color","#307ac1");
            $(this).css("background-color","#307ac1");
            $(this).css("color","#ffffff");
        });
        $("#main-btn").click(function(){
           $("#contentiframe").attr("src","examList.jsp");
        });
        $("#cart-btn").click(function(){
            $("#contentiframe").attr("src","examList.jsp");
        });
        $("#psn-btn").click(function(){
            $("#contentiframe").attr("src","scoreList.jsp");
        });
        $("#pbuy-btn").click(function(){
            $("#contentiframe").attr("src","#");
        });
        $("#pcol-btn").click(function(){
            $("#contentiframe").attr("src","personal_inf_edit.jsp");
        });
       
       
        $("#exit-btn").click(function(){
        	location.href = "logout.action";
        });
    })
</script>
</body>
</html>
