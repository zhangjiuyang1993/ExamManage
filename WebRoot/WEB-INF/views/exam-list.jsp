<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String servletPath = (String) request.getAttribute("javax.servlet.forward.servlet_path");
	String[] list = servletPath.split("\\/");
	request.setAttribute("role", list[1]);
	request.setAttribute("topMenuId", list[2]);
	request.setAttribute("leftMenuId", list[3]);
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>考试管理</title>
<meta name="keywords" content="">
<link rel="shortcut icon"
	href="<%=basePath%>resources/images/favicon.ico" />
<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">

<link href="resources/css/exam.css" rel="stylesheet">
<link href="resources/chart/morris.css" rel="stylesheet">
<style>
.change-property, .publish-paper, .delete-paper, .offline-paper {
	cursor: pointer;
}
</style>
</head>
<body>
<span style="display:none;" id="rule-role-val"><%=list[1]%></span>


	<div>
		<!-- Slider (Flex Slider) -->

		<div class="container" style="min-height: 800px;">

			<div class="row">
				
				<div class="col-xs-12" id="right-content">
					<div class="page-header">
						<h1>
							<i class="fa fa-list-ul"></i> 考试管理
						</h1>
					</div>
					<div class="page-content">
						<div id="question-list">
							<table class="table-striped table">
								<thead>
									<tr>
										<td>ID</td>
										<td>考试名称</td>
										<td>起始时间</td>
										<td>截止时间</td>


										<td>试卷</td>
										<td>创建人</td>
										<td>状态</td>
										<c:if test="${fn:contains(sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.authorities,'ROLE_ADMIN') }">
											<td>操作</td>
										</c:if>
										
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${examList }" var="item">
										<tr>
											<td>${item.examId }</td>
											<td><span>${item.examName }</span> 
												<br> 
												<a	href="<%=list[1]%>/exam/exam-student-list/${item.examId }" target="rightContent">学员名单</a></td>
											<td><fmt:formatDate value="${item.effTime}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><fmt:formatDate value="${item.expTime}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td>${item.examPaperName }</td>
											<td>${item.creatorId }</td>
											<td><c:choose>
													<c:when test="${item.approved == 0 }">
															未审核
														</c:when>
													<c:when test="${item.approved == 1 }">
															审核通过
														</c:when>
													<c:otherwise>
															审核未通过
														</c:otherwise>
												</c:choose></td>
											<c:if test="${fn:contains(sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.authorities,'ROLE_ADMIN') }">
												<td><c:choose>
														<c:when test="${item.approved == 0 }">
															<button class="approved-btn" data-id="${item.examId }">通过</button>
															<button class="disapproved-btn" data-id="${item.examId }">不通过</button>
														</c:when>
														<c:when test="${item.approved == 2 }">
															<button class="delete-btn" data-id="${item.examId }">删除</button>
														</c:when>
													</c:choose>
													<span class="link-user-r-btn btn-sm btn-info" title="关联学员" data-id="${item.examId }">
													<i class="fa fa-random"></i>
													</span> 
												</td>
											</c:if>
											

										</tr>
									</c:forEach>

								</tbody>
								<tfoot></tfoot>
							</table>

						</div>
						<div class="page-link-content">
							<ul class="pagination pagination-sm">${pageStr}</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="link-user-modal" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h6 class="modal-title" id="myModalLabel">关联用户</h6>
				</div>
				<div class="modal-body">
					<form id="link-user-form">
						<div class="form-line form-user-id" style="display: block;">
							<span class="form-label"><span class="warning-label"></span>用户ID：</span>
							<input type="text" class="df-input-narrow" id="name-add-link">
							<span class="form-message"></span> <br>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭窗口</button>
					<button id="link-user-btn" type="button" class="btn btn-primary">
						确定添加</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Slider Ends -->

	<!-- Javascript files -->
	<!-- jQuery -->
	<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="resources/js/all.js"></script>
	<!-- Bootstrap JS -->
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="resources/js/exam-list.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".link-user-r-btn").click(function(){
				$("#link-user-btn").data("id",$(this).data("id"));
				$("#link-user-modal").modal({
					backdrop : true,
					keyboard : true
				});
			});
		});
	</script>
</body>
</html>