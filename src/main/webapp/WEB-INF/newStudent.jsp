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
<title>Add a New Student</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>

</head>
<body>
	<div class="content">
		<h1>New Student</h1>
			<form:form action="/students/new" method="post" modelAttribute="newStudent">
			    <p>
			        <form:errors path="studentName"/>
			        <form:input style="text-align: center" path="studentName" placeholder="Student Name"/>
			    </p>
			    <p style="text-decoration: underline">Dorm</p>
			    <p>
				<form:select path="dorm">
					<c:forEach var="eachDorm" items="${dormList}">
					  	<form:option value="${eachDorm.id}">${eachDorm.dormName}</form:option>
					</c:forEach>
				</form:select>
				<form:errors path="dorm"/>
				</p>
		    <button style="margin-bottom: 15px; margin-top: 20px"class="btn btn-primary" type="submit" value="Submit">Add</button>
			</form:form>
		<a href="/dorms">Return</a>
	</div>
</body>
</html>