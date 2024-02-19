<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<font face="WildWest" color="blue">Please Enter Details</font>
	</h2>
	
	
	<sql:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/OesDb" user="root" password="root"/>
	<sql:query var="rs">select * from studenttable</sql:query>
	



	
	<form action="oes.controller.AttendanceInsert">
		<pre>

Student Id:    <input list="browsers" name="uid">
 					 <datalist id="browsers">
    					 <c:forEach items="${rs.rows}" var="category">
              				  <option value="${category.userid}" >
                 					${category.userid}
                 			 </option>	
                   		</c:forEach>
                     </datalist>                
            
	
	

Date:         <input type="date" name="date">

Lecture:     <input type="text" name="lec">

Status:     <input type="text" name="status">
             
             <input type="submit" value="Add"
				class="btn btn-outline-primary">   <input type="button"
				onclick="location.href='AdminPanel.jsp'" value="Home"
				class="btn btn-outline-success">    <input type="button"
				onclick="location.href='attendance.jsp'" value="Back"
				class="btn btn-outline-danger">
</pre>
	</form>
	<div>
		<font color="red"> <%
			if(request.getParameter("msg2") != null)
				out.print(request.getParameter("msg2"));
		%>
		</font> <font color="green"> <%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
		</font>
	</div>

</body>
</html>