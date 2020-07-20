<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="resource\css\Table.css">
<style>

@import url('https://fonts.googleapis.com/css?family=Lobster&display=swap');
body{
    background: linear-gradient(
      90deg,
      rgba(69, 87, 266, 0.9),
      rgba(196, 80, 193, 1)
    );
}
.container{
  max-width: 1100px;
  margin: auto;
  padding: 0 2rem;
  overflow: hidden;
}

h1{
    padding: 1rem;
    color: #fff;
    text-align: center;
    font-size: 3rem;
    position: relative;
}

.title-underline{
     width: 200px;
    border: 3px solid white;
    position: absolute;
    top: 47%;
    right: 43%;
    border-radius: 7px;
}

table{
    border-collapse: collapse;
    width: 100%;
    text-align: center
}
table thead{ 
    font-family: 'Lobster', cursive;
    background-color: #000;
    color: #fff;
    font-size: 1.5rem;
   
}
table th{
    border: 2px solid #ddd;
    padding: 14px 12px;
    color: #fff;
    position: sticky;
    top: 0;
    z-index: 5;
    
}

table tbody td{
    border: 2px solid #ddd;
/*    padding: 15px 12px;*/
    color: #fff;
    font-size: 18px;
}


table tr:nth-child(even)
{background-color: rgba(237, 237, 237, 0.5);}

table tr:hover {background-color: #36314A;}



table tbody td a{
    display: block;
    padding: 10px; 
    /*IMPORTANT: padding just for a 
    so we fill all the A:link cell
    (delete the padding for td)*/
     text-decoration: none;
    color: #fff;
    
}
table tbody td a:hover{
    background-color: aqua;
}

</style>
</head>
<body>

	<div class="container">
	<h1>List of Students</h1>
	<p align = "right">
		<button onclick= "window.location.href = 'addStudent';" return false;>Add Student</button>
	</p>
	<table align = "center" border = "1">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Date of birth</th>
			<th>Gender</th>
			<th>Hobbies</th>
			<th>City</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${theStudents}" var="student">
			<c:url var = "updateLink" value = "showUpdateForm">
				<c:param name="studentId" value="${student.id}"></c:param>
			</c:url>
			<c:url var = "deleteLink" value = "deleteRecord">
				<c:param name="studentId" value="${student.id}"></c:param>
			</c:url>
			<tr>
				<td>${student.name}</td>
				<td>${student.email}</td>
				<td>${student.dateofbirth}</td>
				<td>${student.gender}</td>
				<td>${student.hobbies}</td>
				<td>${student.city}</td>
				<td>${student.address}</td>
				<td> <a href="${updateLink}">update</a> | <a onclick="if(!(confirm('Are you sure want to delete this Student permanently?'))) return false" 
																	href = "${deleteLink}">delete</a> </td>
			</tr>
		
		</c:forEach>
	</table>
	</div>
</body>
</html>