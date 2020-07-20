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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<h1> Student information</h1><hr/>
	<f:form modelAttribute = "student" action = "saveProcess">
	<input type = "hidden" value = "${student.hobbies}" id = "hobbies"/>
		<div class="container">
		<table align ="center" border="1">
		
		<f:hidden path="id"/>
			<tr>
				<td>Student's Name</td>
				<td><f:input path="name"/></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><f:input path="email"/></td>
			</tr>
			<tr>
				<td>Date of birth</td>
				<td><f:input path="dateofbirth" type="date"/></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<f:radiobutton path="gender" value = "Male"/>Male
					<f:radiobutton path="gender" value = "Female"/>Female
				</td>
			</tr>
			<tr>
				<td>Hobbies</td>
				<td>
					<f:checkbox path="hobbies" value="cricket" />cricket
					<f:checkbox path="hobbies" value="football" />football
					<f:checkbox path="hobbies" value="vollyball" />vollyball
					<f:checkbox path="hobbies" value="hockey" />hockey
				</td>
			</tr>
			<tr>
				<td>address</td>
				<td>
					<f:textarea path="address" />
				</td>
			</tr>
			<tr>
				<td>city</td>
				<td>
					<f:select path="city">
						<f:option  value="mumbai">mumbai</f:option>
						<f:option  value="pune">pune</f:option>
						<f:option  value="kolhapur">kolhapur</f:option>
						<f:option  value="nasik">nasik</f:option>
					</f:select>
				</td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value="Submit">&nbsp;
					<input type = "reset" value ="Reset">
				</td>
			</tr>
		</table>
		</div>
	</f:form>
	<a align = "center" href = "listStudents">list all students</a>
	<script type="text/javascript">
		
		$(document).ready(function(){
			var hobbies = $('#hobbies').val().split(",");
			var $checkboxes = $("input[type=checkbox]");
			$checkboxes.each(function(id,element){
				if(hobbies.indexOf(element.value) != -1){
					element.setAttribute("checked","checked");
				}
			})
		});
	</script>
</body>
</html>