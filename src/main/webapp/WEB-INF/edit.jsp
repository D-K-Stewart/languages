<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
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
	<div style="margin-top:40px; margin-left:400px">
		<div style="display:flex;">
			<h1 style="margin-right:40px">Edit Language</h1>		
			<p><a href="/languages">Dashboard</a></p>
		</div>
		
		<form:form action="/languages/${language.id}/edit" method="post" modelAttribute="language">
		    <input type="hidden" name="_method" value="put">
		    <p>
		        <form:errors style="color:red" path="name"/>
		        <form:label path="name">Language Name:</form:label>
		        <form:input path="name"/>
		    </p>
		    <br/>
		    <p>
		        <form:errors style="color:red" path="creator"/>
		        <form:label path="creator">Creator:</form:label>
		        <form:textarea path="creator"/>
		    </p>
		    <br/>
		    <p>
		        <form:errors style="color:red" path="version"/>
		        <form:label path="version">Version:</form:label>
		        <form:input type="number" min="0.01" step="0.01" path="version"/>
		    </p>
		    <br/>
		        
		    <input type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>