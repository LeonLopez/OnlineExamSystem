<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="zh-CN">

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<title>考试云平台</title>

		<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/new_logo.ico" />

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/editTaoti.css">

	</head>

	<div class="viewFrameWork sidebar-full" id="viewFrameWork">

		<div class="viewFrameWork-body">
			<div class="body-top body-addition">
				<!--<div class="body-top-left body-operation">
						<div class="body-nav">
							<div class="body-toolbar clearfix">
								<div class="body-toolbar-right pull-right toolbar-right-operation">
									<button type="button" class="btn btn-primary savePaperBtn">保存</button>
								</div>
							</div>
						</div>

					</div>-->
				<div class="body-bottom body-content">

					<div class="cont-r">
						<!-- Nav tabs -->
						<div role="tabpanel" class="tab-area tab-col4">
							<!-- Tab panes -->
							<form action="#" name="form" method="post" id="subForm">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="manualInput">
										<div class="input-questions-area clearfix">
											<div class="info-board">
												<div class="total">
													<p>总题数：<span class="test_total">0</span>题</p>
													<p>当前总分：<span class="total_score">0</span>分</p>
												</div>
											</div>
											<div class="questions-board">
												<h3><input name="paper_name" value="高数"></h3>
												<div class="group_main">
													<!-- 所有题目 -->
													<div class="group_simple" sort="182467" questionType="3">
														<!-- 大题标题信息 -->
														<div class="questions-group group_title">
															<h4>
                                                
                                                				<span class="inline-ite">
                                                                <input class="disorder" type="checkbox" name="question_disorder" >
                                                                <span class="disorder">试题乱序</span>
                                                				</span>
                                                
                                            				</h4>
														</div>
														<!-- /.questions-group group_title_update -->

														<!-- 小题 -->
														<div class="group_questionShow">

															<div class="manual-cont">
																<!-- 判断小题id类型，到底是数字id还是大于12位的_id -->

																<div class="m-example questions" questionId="5acc1ace1f6dd32693c3ee4e">

																	<dl>
																		<dt>
                                                                        <a name="questions_182467" class="hidden"></a>
                                                                        
                                                                                与他人交谈完毕就可以立即转身离开。
                                                                            
                                                                    </dt>

																		<dd class="rt"><em class="icon icon-ksx-icons8-正确"></em>正确</dd>
																		<dd class="wg correctAnswer"><em class="icon icon-ksx-icons8-错误"></em>错误</dd>

																	</dl>

																	<p class="answer">答案：错误</p>

																	<p class="analysis">解析：无</p>

																	<span class="m-example-score"><input name="per_score" value="2">分</span>

																	<a class="m-example-edit " href="javascript:void(0)" questionId="5acc1ace1f6dd32693c3ee4e">
																		<i class="icons8-edit-property"></i> 编辑
																	</a>

																	<a href="javascript:void(0)" class="m-example-remove" questionId="5acc1ace1f6dd32693c3ee4e">
																		<i class="icons8-trash-can"></i> 删除
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
					<button type="button" class="btn btn-default savePaperBtn">保存</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	</body>

</html>