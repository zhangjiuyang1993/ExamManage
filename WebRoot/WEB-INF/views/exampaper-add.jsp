<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String servletPath = (String)request.getAttribute("javax.servlet.forward.servlet_path");
String[] list = servletPath.split("\\/");
request.setAttribute("role",list[1]);
request.setAttribute("topMenuId",list[2]);
request.setAttribute("leftMenuId",list[3]);
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试卷管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		<link href="resources/css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
		<link href="resources/css/question-add.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style>
			input.add-ques-amount,input.add-ques-score{
				width:50px;
				margin-right:0;
			}
			
		
		</style>
	</head>
	<body>
	<span style="display:none;" id="rule-role-val"><%=list[1]%></span>
		
		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
				
					<div class="col-xs-12" id="right-content">
						<div class="page-header">
							<h1><i class="fa fa-file-text-o"></i> 创建新试卷 </h1>
						</div>
						<div class="page-content">
							<form id="form-exampaper-add">
								<div class="form-line add-update-exampapername">
									<span class="form-label"><span class="warning-label">*</span>试卷名称：</span>
									<input type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								
								<div class="form-line add-update-exampaper-type">
									<span class="form-label"><span class="warning-label">*</span>专业类型：</span>
									<select class="df-input-narrow">
										<option value="-1">------请选择专业类型------</option>
										<c:forEach items="${fieldList }" var="item">
											<option value="${item.fieldId }">${item.fieldName }</option>
										</c:forEach>
										
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-creat-type">
									<span class="form-label"><span class="warning-label">*</span>组卷方式：</span>
									<select class="df-input-narrow">
										<option value="2">自动组卷</option>
										<option value="1">手动组卷</option>
										
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-pass-point">
									<span class="form-label"><span class="warning-label">*</span>及格分数：</span>
									<input type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-duration">
									<span class="form-label"><span class="warning-label">*</span>时长（分钟）：</span>
									<input type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								
								<div class="form-line add-update-types" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>题型：</span>
									<fieldset>
										<legend>
											选择题型分布
										</legend>
										<span class="add-ques-type">
											<label >单选题</label>
											<input type="hidden" class="ques-id" value="1">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >多选题</label>
											<input type="hidden" class="ques-id" value="2">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >判断题</label>
											<input type="hidden" class="ques-id" value="3">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >填空题</label>
											<input type="hidden" class="ques-id" value="4">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >简答题</label>
											<input type="hidden" class="ques-id" value="5">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >论述题</label>
											<input type="hidden" class="ques-id" value="6">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >分析题</label>
											<input type="hidden" class="ques-id" value="7">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-total-point">
									<span class="form-label"><span class="warning-label">*</span>总分：</span>
									<input id="total-point" type="text" class="df-input-narrow" disabled="disbaled">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-scope" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>知识分类：</span>
									<fieldset>
										<legend>
											知识分类范围
										</legend>
										<div>
										<div class="clearfix">
											<div id="aq-course1" style="padding:0px;float:left; width:48%;">
												<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
													<c:forEach items="${fieldList }" var="item">
														<option value="${item.fieldId }">${item.fieldName }</option>
													</c:forEach>
												</select>
											</div>
											<div id="aq-course2" style="padding:0px; float:right;width:48%;">
												<select id="point-from-select" class="df-input-narrow" size="4" style="width:100%;">
												</select>
											</div>
										</div>
										
										<div style="text-align:center;margin:10px 0;">
											<button id="add-point-btn" class="btn btn-primary btn-xs">选择知识分类</button>
											<button id="del-point-btn" class="btn btn-danger btn-xs">删除知识分类</button>
											<button id="remove-all-point-btn" class="btn btn-warning btn-xs">清除列表</button>
										</div>
										<div id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;">
												<select id="point-to-select" class="df-input-narrow" size="4" style="width:100%;">
												</select>
												<p style="font-size:12px;color:#AAA;">您可以从上面选择4个知识分类</p>
										</div>
									</div>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line">
									<input value="下一步" type="submit" class="df-submit btn btn-info">
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/field-2-point.js"></script>
		<script type="text/javascript" src="resources/js/exampaper-add.js"></script>
	</body>
</html>