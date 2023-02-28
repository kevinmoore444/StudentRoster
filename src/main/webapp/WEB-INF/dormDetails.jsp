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
<title>${dorm.dormName} Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>

</head>
<body>
	<div class="content">
		<form action="/students/edit/${dorm.id}" method="post">
			<input type="hidden" name="_method" value="put">
				<p>
					<select name="student">
						<c:forEach var="eachStudent" items="${studentList}">
							<option value="${eachStudent.id}">${eachStudent.studentName} (${eachStudent.dorm.dormName})</option>
						</c:forEach>
					</select>
				</p>
			<button style="margin-bottom: 15px;"class="btn btn-primary" type="submit" value="Submit">Reassign</button>
		</form>
	</div>  



	<div class="content">
		<h1>${dorm.dormName} Students</h1>
		<table style="margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 20px" class="table table-striped">
			<thead>
				<tr>
					<th>Student</th>
					<th>Action</th>	
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachStudent" items="${dorm.students}">
					<tr>
						<td><c:out value="${eachStudent.studentName}"/></td>
						<td><a href="/students/delete/${eachStudent.id}"><button>Remove</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/dorms"><button class="btn btn-secondary">Go back</button></a>
	</div>
</body>
</html>


















