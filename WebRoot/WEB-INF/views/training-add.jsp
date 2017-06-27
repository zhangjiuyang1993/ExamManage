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
		<title>发布培训</title>
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
							<h1><i class="fa fa-file-text-o"></i> 发布培训 </h1>
						</div>
						<div class="page-content">
							<form id="form-training-add">
								<div class="form-line add-update-training-name">
									<span class="form-label"><span class="warning-label">*</span>培训名称：</span>
									<input id="exam-name" type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-training-desc">
									<span class="form-label"><span class="warning-label">*</span>培训描述：</span>
									<textarea id="exam-name" rows="8" style="width:600px;"></textarea>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-training-type" style="display:none;">
									<span class="form-label"><span class="warning-label">*</span>私有培训：</span>
									<input id="training-type" type="checkbox" class="df-input-narrow" checked="checked">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-training-field">
									<span class="form-label"><span class="warning-label">*</span>培训专业：</span>
									<select class="df-input-narrow">
										<option value="-1">------请选择培训专业------</option>
										<c:forEach items="${fieldList }" var="item">
											<option value="${item.fieldId }">${item.fieldName }</option>
										</c:forEach>
										
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line form-training-duration ">
									<span class="form-label"><span class="warning-label">*</span>失效日期：</span>
									<input id="training-exp-date" type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								
								<div class="form-line">
									<input value="确认发布" type="button" id="training-add-btn" class="df-submit btn-info btn">
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.ui.datepicker-zh-TW.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#training-exp-date").datepicker();
				$("#training-exp-date").datepicker("option", "dateFormat", "yy-mm-dd");
			});
		</script>
		<script type="text/javascript" src="resources/js/add-training.js"></script>
	</body>
</html>