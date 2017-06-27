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
		<title>知识分类管理</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
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
							<h1> <i class="fa fa-bar-chart-o"></i> 知识分类管理 </h1>
						</div>
						<div class="page-content">
							<div id="question-filter">
								<dl id="question-filter-field">
									<dt>
										题库：
									</dt>
									<dd>	
										<c:choose>
											<c:when test="${fieldId == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										
										
										<c:forEach items="${fieldList }" var="item">
										
											<c:choose>
												<c:when test="${fieldId == item.fieldId }">
													<span data-id="${item.fieldId}" class="label label-info">${item.fieldName}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${item.fieldId }">${item.fieldName }</span>
												</c:otherwise>
											</c:choose>
											
										</c:forEach>
									</dd>
								</dl>
								<div class="page-link-content">
									<ul class="pagination pagination-sm">${pageStr}</ul>
								</div>
							</div>
							
							
							<div id="field-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td>
											<td>ID</td>
											<td>标签名</td>
											<td>描述</td>
											<td>创建时间</td>
											<td>创建人</td>
											<td>私有</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${tagList }" var="item">
											<tr>
												<td>
													<%-- <c:if test="${item.removeable }">
														<input type="checkbox" value="${item.tagId }">
													</c:if> --%>
												</td>
												<td>${item.tagId }</td>
												<td>${item.tagName }</td>
												<td>${item.memo }</td>
												<td>${item.createTime }</td>
												<td>${item.creator }</td>
												<td>${item.privatee }</td>
												<td>
													<%-- <c:if test="${item.removeable }">
														<button class="delete-btn" data-id="${item.pointId }">删除</button>
													</c:if> --%>
												</td>
											</tr>
										</c:forEach>
										
									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
								<ul class="pagination pagination-sm">${pageStr}</ul>
							</div>

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
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/point-list.js"></script>
		
	</body>
</html>