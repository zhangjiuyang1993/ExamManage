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
		<title>培训管理</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style type="text/css">
			
			a.btn{
				    margin-top: 0px; 
			}
			.section-navi-item {
			    display: inline-block;
			    height: 24px;
			    background: rgb(239,237,237);
			     padding:0 10px;
			    margin: 3px;
			    font-family: arial;
			    text-align: center;
			    line-height: 24px;
			    color: #428bca;
			    font-size: 12px;
			    cursor: pointer;
			}	
		</style>
	</head>
	<body>
	<span style="display:none;" id="rule-role-val"><%=list[1]%></span>
	
		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-12">
						<div class="page-header">
							<h1> <i class="fa fa-bar-chart-o"></i> 培训进度</h1>
						</div>
						<div class="page-content">
							<div class="row">
								<div class="col-xs-12">
									<input type="hidden" id="training-id-hidden" value="${trainingId }">
									<div id="exampaper-list">
									<div class="table-search table-controller-item"	style="float: left; width: 200px;margin-top:10px;">
										<div class="input-group search-form">
											<input type="text" class="form-control" placeholder="搜索学员" value="${searchStr }"
											id="txt-search">
											<span class="input-group-btn">
												<button class="btn btn-sm btn-default" type="button"
												id="btn-search" >
													<i class="fa fa-search"></i>搜索
												</button> </span>
										</div>
									</div>
									<table class=" table" id="training-table">
										<thead>
											<tr>
												<td>学员ID</td><td>学员姓名</td><td>部门</td><td>学习进度</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${userTrainingList }" var="item">
												<tr>
													<td>${item.userName }</td>
													<td>${item.trueName }</td>
													<td>${item.depName }</td>
													<td>
														<div>
															<c:forEach items="${processMap[item.userId] }" var="processItem">
																<c:choose>
																	<c:when test="${processItem.process == 1 }">
																		<a class="section-navi-item navi-item-success">${processItem.sectionName }</a>
																	</c:when>
																	<c:otherwise>
																		<a class="section-navi-item">${processItem.sectionName }</a>
																	</c:otherwise>
																</c:choose>
																
															</c:forEach>
															
														</div>
													</td>	
													
												</tr>
											</c:forEach>
											
										</tbody><tfoot></tfoot>
									</table>
								</div>
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

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/training-process-list.js"></script>
		
	</body>
</html>