<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="data" items="${mp }">
	<tr>
		<td class="col-md-3">${data.code }</td>
		<td class="col-md-4">${data.title }</td>
		<td class="col-md-4">${data.parents.title }</td>
		<td class="col-md-1">
			<div class="dropdown">
				<button class="btn btn-warning dropdown-toggle" type="button"
					data-toggle="dropdown">
					<i class="fa fa-align-justify"></i><span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li id="btn-edit" value="${data.id}"><a>Edit</a></li>
					<li id="btn-delete" value="${data.id}"><a>Delete</a></li>
				</ul>
			</div>
		</td>
	<tr>
</c:forEach>
