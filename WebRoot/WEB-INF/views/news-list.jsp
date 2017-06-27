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
		<style type="text/css">
			.disable-btn, .enable-btn{
				text-decoration: underline;
			}
			.disable-btn, .enable-btn{
				cursor:pointer;
			}
		</style>
	</head>
	<body>
		  <span style="display:none;" id="rule-role-val"><%=list[1]%></span>
		<div>

			<div class="container" style="min-height:500px;">

				<div class="row">
					
					<div class="col-xs-12" id="right-content">
						<div class="page-header">
							<h1><i class="fa fa-bar-chart-o"></i> 管理员列表 </h1>
						</div>
						<div class="page-content">
							<div id="news-list">
								<div class="table-controller">
									<div class="btn-group table-controller-item" style="float:left">
										<button class="btn btn-default btn-sm" id="add-news-modal-btn">
											<i class="fa fa-plus-square"></i> 发布公告
										</button>
									</div>
								</div>
								<table class="table-striped table">
									<thead>
										<tr>
											<td>ID</td>
											<td>标题</td>
											<td>创建时间</td>
											<td>创建人</td>
											
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${newsList }" var="item">
											<tr>
												<td><span class="r-id">${item.newsId }</span></td>
												<td><span class="r-name">${item.title }</span></td>
												<td>
													<span class="r-createtime">
														<fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm"/>
													</span>
												</td>
												<td>
												<div class="r-truename">
													${item.creator }
												</div>
																								
													
											</tr>

										</c:forEach>

									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
								<ul class="pagination pagination-sm">
									${pageStr}
								</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

			<div class="modal fade" id="add-news-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h6 class="modal-title" id="myModalLabel">发布公告</h6>
						</div>
						<div class="modal-body">
							<form id="teacher-add-form" style="margin-top:40px;"  action="admin/add-news">
								<div class="form-line form-news-title" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>公告标题：</span>
									<input type="text" class="df-input-narrow" id="name-add" maxlength="50">
									<span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-news-content" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>公告内容：</span>
									<textarea rows="15" cols="50" id="news-content"></textarea>
									<span class="form-message"></span>
									<br>
								</div>
								
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								关闭窗口
							</button>
							<button id="add-news-btn" data-action="admin/add-news" data-group="0" type="button" class="btn btn-primary">
								确定添加
							</button>
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
		<script type="text/javascript" src="resources/js/news-list.js"></script>
		<script type="text/javascript" src="resources/js/add-news.js"></script>
		<script>
			$(function() {
				$("#add-news-modal-btn").click(function() {
					$("#add-news-modal").modal({
						backdrop : true,
						keyboard : true
					});

				});
			});
		</script>
	</body>
</html>