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
		<title>用户管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
	</head>
	<body>
	    <span style="display:none;" id="rule-role-val"><%=list[1]%></span>
		
		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
			
					<div class="col-xs-12" id="right-content">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i> 添加管理员 </h1>
						</div>
						<div class="page-content">

							<form id="user-add-form" style="margin-top:40px;" action="admin/add-admin">
								<div class="form-line form-username" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>用户名：</span>
										<input type="text" class="df-input-narrow" id="name"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-password" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>密码：</span>
										<input type="text" class="df-input-narrow" id="password"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line">
									<input id="btn-save" value="确认添加" type="submit" class="df-submit btn btn-info">
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
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		
		<script>
		$(function() {
			create_account.initial();
		});

		var create_account = {

			initial : function initial() {
				this.bindSubmitForm();
			},

			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#user-add-form");

				form
						.submit(function() {
							var result = create_account.verifyInput();
							if (result) {
								var data = new Object();
								data.username = $("#name").val();
								data.email = "";
								data.password = $("#password").val();
								data.fieldId = 1;
								jQuery
										.ajax({
											headers : {
												'Accept' : 'application/json',
												'Content-Type' : 'application/json'
											},
											type : "POST",
											url : form.attr("action"),
											data : JSON.stringify(data),
											success : function(message, tst, jqXHR) {
												if (message.result == "success") {
													document.location.href = document
															.getElementsByTagName('base')[0].href
															+ "admin/sys-admin-list";
												} else {
													if (message.result == "duplicate-username") {
														$(
																".form-username .form-message")
																.text(
																		message.messageInfo);
													} else if (message.result == "captch-error") {
														
													} else if (message.result == "duplicate-email") {
														$(
																".form-email .form-message")
																.text(
																		message.messageInfo);
													} else {
														alert(message.result);
													}
												}
											}
										});
							}

							return false;
						});
			},

			verifyInput : function verifyInput() {
				$(".form-message").empty();
				var result = true;
				var check_u = this.checkUsername();
				//var check_e = this.checkEmail();
				var check_p = this.checkPassword();
				//var check_cp = this.checkConfirmPassword();
				//var check_job = this.checkJob();
				
				result = check_u && check_p;
				return result;
			},

			checkUsername : function checkUsername() {
				var username = $(".form-username input").val();
				if (username == "") {
					$(".form-username .form-message").text("用户名不能为空");
					return false;
				} else if (username.length > 20 || username.length < 5) {
					$(".form-username .form-message").text("请保持在5-20个字符以内");
					return false;
				} else {
					var re=/[\+|\-|\\|\/||&|!|~|@|#|\$|%|\^|\*|\(|\)|=|\?|´|"|<|>|\.|,|:|;|\]|\[|\{|\}|\|]+/;
					if(re.test(username)){
						$(".form-username .form-message").text("只能是数字字母或者下划线的组合");
						return false;
					}else return true; 
					
					
				}
				return true;
			},

			checkEmail : function checkEmail() {
				var email = $(".form-email input").val();
				if (email == "") {
					$(".form-email .form-message").text("邮箱不能为空");
					return false;
				} else if (email.length > 40 || email.length < 5) {
					$(".form-email .form-message").text("请保持在5-40个字符以内");
					return false;
				} else {
					var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				   if(re.test(email)){
					   return true;
				   }else{
					   $(".form-email .form-message").text("无效的邮箱");
						return false;
				   }
					
				}
				return true;
			},

			checkPassword : function checkPassword() {
				var password = $(".form-password input").val();
				if (password == "") {
					$(".form-password .form-message").text("密码不能为空");
					return false;
				} else if (password.length < 6 || password.length > 20) {
					$(".form-password .form-message").text("密码请保持在6到20个字符以内");
					return false;
				} else {
					return true;
				}
				return true;
			},

			checkConfirmPassword : function checkConfirmPassword() {
				var password_confirm = $(".form-password-confirm input").val();
				var password = $(".form-password-confirm input").val();
				if (password_confirm == "") {
					$(".form-password-confirm .form-message").text("请再输入一次密码");
					return false;
				} else if (password_confirm.length > 20) {
					$(".form-password-confirm .form-message").text(
							"内容过长，请保持在20个字符以内");
					return false;
				} else if (password_confirm != password) {
					$(".form-password-confirm .form-message").text("2次密码输入不一致");
					return false;
				} else {
					return true;
				}
			},
			
			checkJob : function(){
				var jobid = $("#job-type-input").val();
				if(jobid == -1){
					$(".form-job-type .form-message").text("请选择专业");
					return false;
				}else{
					return true;
				}
				return false;
			},
			
			checkTerm : function checkTerm() {

				if ($('.form-confirm input[type=checkbox]').is(':checked')) {
					return true;

				} else {
					$(".form-confirm .form-message").text("请选择");
					return false;
				}
			}

		};
		</script>
	</body>
</html>