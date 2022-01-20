<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 style="margin-top:40px; margin-left:100px">Languages</h1>
	<div>	
		<div style="text-align:center; width:75%; margin-top:10px;margin-left:100px;border:solid"class="cantainer mt-4">
			
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Language Name</td>
						<td>Creator</td>
						<td>Version</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="language" items="${languages}">
					<tr>
						<%-- <td>${expense.id}</td> --%>
						<td><a href="/languages/${language.id}/show">${language.name}</a></td>
						<td>${language.creator}</td>
						<td>${language.version}</td>
						<td style="display:flex;">
                            <form action="/languages/${language.id}/edit"><button type="submit" class="btndash">Edit</button></form>
                            <form action="/languages/${language.id}" method="post"><input type="hidden" name="_method" value="delete" class="btndash"/><input type="submit" value="Delete"/></form>
                        </td>
					</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div style="margin-top:40px; margin-left:400px">	
		<h1>Language</h1>
		<form:form action="/languages" method="post" modelAttribute="language">
		    <p>
		        <form:errors style="color:red" path="name"/>
		        <br/>
		        <form:label path="name">Language Name:</form:label> 
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:errors style="color:red" path="creator"/>
		        <br/>
		        <form:label path="creator">Creator:</form:label>
		        <form:textarea path="creator"/>
		        
		    </p>
		    <p>
		        <form:errors style="color:red" path="version"/>
		        <br/>
		        <form:label path="version">Version:</form:label>
		        <form:input type="number" min="0.01" step="0.01"  path="version"/>
		    </p>
		    <p>
		        
		    <input class="button" type="submit" value="Submit"/>
		</form:form>
	</div>		
</body>
</html>