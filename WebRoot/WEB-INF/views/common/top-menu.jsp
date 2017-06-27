<%@ page language="java" contentType="text/html;   charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!-- 	<li><a href="#"><i class="fa fa-home"></i>网站首页</a></li>
	<li><a href="admin/question-list"><i class="fa fa-edit"></i>试题管理</a>
	</li>

	<li><a href="admin/exampaper-list"><i
			class="fa fa-file-text-o"></i>试卷管理</a></li>
	<li><a href="admin/user-list"><i class="fa fa-user"></i>会员管理</a></li>
	<li><a href="admin/field-list-1"><i class="fa fa-cloud"></i>题库管理</a>
	</li>
	<li><a href="admin/sys-backup"><i class="fa fa-cogs"></i>网站设置</a>
	</li> -->

	<c:forEach items="${topMenuList }" var="topMenuListItem">
		<c:if test="${topMenuListItem.parentId eq '-1' && topMenuListItem.visiable eq true}">
			<li class="menu">
				<a class="menu" href="javascript:" data-href="${ctx}/common-page/left-menu?topMenuId=${topMenuListItem.menuId}&leftMenuId=1" data-id="${topMenuListItem.menuId}"><span>${topMenuListItem.menuName }</span></a>
			</li>
		</c:if>
	</c:forEach>