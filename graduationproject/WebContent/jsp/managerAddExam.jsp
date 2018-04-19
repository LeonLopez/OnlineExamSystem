<!DOCTYPE html>

<html lang="zh-CN">

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="keywords" content="在线考试系统,网络考试系统,企业考试系统,在线考试平台,手机考试,移动考试" />
		<meta name="description" content="考试星是一款免费,好用在线考试系统,可以用手机考试,支持多种客户端" />
		<meta name="author" content="" />
		<title>考试云平台</title>

		<link rel="shortcut icon" href="../images/new_logo.ico" />
		<link rel="stylesheet" type="text/css" href="../styles/ksx-base.css">
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../styles/exam_add.css">
		<style>
			.tab-content {
				padding: 30px;
				background: #f6f7fb;
			}
			
			.form-horizontal {
				background: #fff
			}
			
			.form-horizontal .form-group.info-group {
				display: inline-block
			}
			
			#okModal .modal-dialog {
				width: 800px;
			}
			
			.qr-code .download-qrcode {
				text-align: left;
				margin-left: 10px;
			}
			
			.qr-code .download-qrcode .qrcode-prompt {
				font-family: PingFangSC-Regular;
				font-size: 16px;
				color: #666666;
				letter-spacing: 0;
				padding-bottom: 5px;
			}
			
			.download-qrcode .btn-group .btn-download {
				font-size: 14px;
			}
			
			#okModal .modal-body .qr-code .download-qrcode {
				display: inline-block;
				vertical-align: middle;
			}
			
			.qr-code .download-qrcode {
				text-align: left;
				margin-left: 10px;
			}
			
			.qr-code .download-qrcode .btn-group .btn-download {
				font-family: MicrosoftYaHei;
				font-size: 14px;
				color: #1A8CFE;
				letter-spacing: -0.4px;
				padding: 9px 22px;
			}
			
			.qr-code .download-qrcode .qrcode-prompt {
				font-family: PingFangSC-Regular;
				font-size: 16px;
				color: #666666;
				letter-spacing: 0;
				padding-bottom: 5px;
			}
			
			#okModal .modal-body .btn-div .btn-info {
				border: 0;
				margin-right: 10px
			}
			
			#trial-link {
				width: 100px;
				height: 34px;
				font-size: 12px;
				border-radius: 4px;
				line-height: 34px;
				padding: 0;
				color: #ffffff;
			}
			
			#okModal .try-exam {
				display: inline-block;
				height: 100%;
				width: 100%;
			}
			
			.normal-setting .form-group .col-sm-10 .note-editor.note-frame.fullscreen {
				z-index: 99999;
			}
		</style>

	</head>

	

		<!-- viewFrameWork-body -->
		<div class="viewFrameWork-body">
			<!--<div class="body-top body-addition">
				<div class="body-top-left body-operation">
					<div class="body-nav">
						<div class="nav-left nav-tab">
							<ul class="nav nav-pills">
								<li role="presentation" class="active"><a href="#">编辑考试</a></li>
							</ul>
						</div>

					</div>
					<div class="body-toolbar clearfix">
						<div class="body-toolbar-right pull-right toolbar-right-operation guide">
							<button class="btn btn-default" id="saveBtn">保存修改</button>
						</div>
					</div>
				</div>

			</div>-->
			<div class="row" style="height:60px">
				<div class="col-md-6"><h3 style="margin-left: 50px;">添加考试</h3></div>
				<div class="col-md-6" ><button class="btn btn-default" id="saveBtn" style="float:right;margin-right: 60px;margin-top: 15px;">保存</button></div>"
			</div>

				<div class="cont-r">
					<div role="tabpanel" class="tab-area tab-col4">
						<div class="clear"></div>
						<div class="tab-content">
							<form class="form-horizontal" action="https://admin.kaoshixing.com/admin/exam_add" name="form" method="post" id="subForm">
								<div class="exam-setting normal-setting">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="examName" class="col-sm-2 control-label">考试名称</label>
												<div class="col-sm-10">
													<input type="text" name="examName" class="form-control hasUsingFormDom" id="examName" value="高数" />
												</div>
											</div>
											<div class="form-group">
												<label for="examName" class="col-sm-2 control-label">课程名称</label>
												<div class="col-sm-10">
													<input type="text" name="examName" class="form-control hasUsingFormDom" id="lessonName" value="高数" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">考试时间</label>
												<div class="col-sm-10">
													<div class="btn-group">
														<div class="calendar-wrap">
															<i class="icons8-calendar start"></i>
															<input value="2018-04-11 10:29:00" name="examStartTime" id="dateFrom">
														</div>
														<span>到</span>
														<div class="calendar-wrap">
															<i class="icons8-calendar end"></i>
															<input value="2018-04-14 10:29:00" name="examEndTime" id="dateTo">
														</div>

													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">答卷时长</label>
												<div class="col-sm-10">
													<span>
													<input type="text" value="60" name="examTime" class="form-control form-control-inline width-48 fl" />
													
													<span>分钟</span>
													</span>
												</div>
											</div>
											<div class="form-group">
												<label for="passMark" class="col-sm-2 control-label">及格分数</label>
												<div class="col-sm-10">
													<input type="text" name="passMark" class="form-control form-control-inline width-48 fl hasUsingFormDom" id="passMark" value="1" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">考试说明</label>
												<div class="col-sm-10">
													<div class="" id="noticeEditor"></div>
													<textarea class="form-control" rows="6"></textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="exam-title">试卷信息</div>
											<div class="panel panel-default panel-paper" id="paperPanel">
												<div class="panel-heading clearfix">
													<div class="paper-title">
														<span class="paper-name">未添加试卷</span>
														
													</div>

												</div>
												<div class="panel-body">
													<div class="form-row">
														<span class="title">总分:</span>
														<span class="content paper-total-score">0</span>
													</div>
													<div class="form-row">
														<span class="title">创建人:</span>
														<span class="content paper-create-user-name">无</span>
													</div>
													<div class="form-row">
														<span class="title">试题数量:</span>
														<span class="content paper-test-count">0</span>
													</div>
													<div class="form-row">
														<span class="title">创建日期:</span>
														<span class="content paper-created-time">无</span>
													</div>
													<div class="text-center">

														<button type="button" class="btn btn-default changePaper" id="selPaperLink">请添加试卷</button>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
	

	</body>

</html>