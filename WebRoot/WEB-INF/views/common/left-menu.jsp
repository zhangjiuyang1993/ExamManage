<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<div class="accordion" id="menu-${topMenuId}">
	<c:set var="firstMenu" value="true"/>

		<div class="accordion-group">
		    <div class="accordion-heading">
		    	<a class="accordion-toggle" data-toggle="collapse" data-href="#collapse-${topMenuId}111" data-parent="#menu-${topMenuId}" href="#collapse-${topMenuId}111" title="${topMenuName}"><i class="icon-chevron-${firstMenu?'down':'right'}"></i>&nbsp;${topMenuName}</a>
		    </div>
		    <div id="collapse-${topMenuId}111" class="accordion-body collapse ${firstMenu?'in':''}">
				<div class="accordion-inner">
					<ul class="nav nav-list"><c:forEach items="${leftMenuList}" var="menuChild">
					<c:if test="${menuChild.visiable eq true}">
						<li><a href="${ctx}/${menuChild.menuHref}"  target="rightContent" data-href=".menu3-${menuChild.menuId}"><i class="icon-${not empty menuChild.icon?menuChild.icon:'circle-arrow-right'}"></i>&nbsp;${menuChild.menuName}</a></li>
					<c:set var="firstMenu" value="false"/>
					</c:if></c:forEach></ul>
				</div>
		    </div>
		</div>
   </div>

