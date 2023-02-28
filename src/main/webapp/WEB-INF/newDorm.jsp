<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a New Dorm</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>

</head>
<body>
	<div class="content">
		<h1>New Dorm</h1>
			<form:form action="/dorms/new" method="post" modelAttribute="newDorm">
		    <p>
		        <form:errors path="dormName"/>
		        <form:input style="text-align: center" path="dormName" placeholder="Dorm Name"/>
		    </p>
		    <button style="margin-bottom: 15px"class="btn btn-primary" type="submit" value="Submit">Add</button>
			</form:form>
		<a href="/dorms">Return</a>
	</div>
</body>
</html>