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
<title>Dorm Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>

</head>
<body>
	<div class="content">
		<h1>Dorms Dashboard</h1>
		<a href="/dorms/new"><button>Add a New Dorm</button></a>
		<a href="/students/new"><button>Add a New Student</button></a>
			<table  class="table table-striped">
				<thead>
					<tr>
						<th>Dorm</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="eachDorm" items="${dormList}">
						<tr>
							<td><c:out value="${eachDorm.dormName}"/></td>
							<td><a href="/dorms/${eachDorm.id}">See Students</a></td> 
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
</body>
</html>