<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="oes.model.*"%>
<%@page import="oes.db.*"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>
			<pre>
				<font color="blue">List of all questions</font>
		</h3>
		</pre>
	</center>
	<table class="table table-bordered table-hover">
		<tr class="table-dark">
			<th>sl no.</th>
			<th>Attendance Id</th>
			<th>Student Id</th>
			<th>Date</th>
			<th>Lecture</th>
			<th>Status</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<tr>
			<%
			int i = 0;
			Integer sid=Integer.parseInt(request.getParameter("aid"));
			attendanceDao dao =new attendanceDao(Provider.getConnection());		
		   List  <attendance> list = dao.viewAttendance();
		   for(attendance e : list)
			   
  {  if(sid.equals(e.getAttendanceId()))
	{
      %>
		
		<tr class="table-primary">
			<form action="updateattendancenow.jsp">
			
			
					
				
				<td><%=i++%></td>
			
				<td><%=e.getAttendanceId()%></td>
		
				
				<td><%=e.getStudentId()%></td>
			
				
				
				
				<td><%=e.getDate()%></td>
					
					<td><input type="text" value="<%=e.getLecture()%>"
					name="lec"></input></td>
					

						<td><input type="text" value="<%=e.getStatus()%>"
					name="sts"></input></td>
					
					
					<td><input type="submit" value="update"></td>
			<td><a href="deleteattendance.jsp?aid=<%=e.getAttendanceId()%>">Delete</a></td>
				
					
					<input type="hidden" value="<%=e.getAttendanceId()%>"
				type="text"	name="aid"></input>
							
			</form>
		</tr>
		<%	
	}
  else
	{ 
	%>
		<tr>
			<td><%=i++%></td>
			
			<td><%=e.getAttendanceId()%></td>
			<td><%=e.getStudentId()%></td>
			<td><%=e.getDate()%></td>
			<td><%=e.getLecture()%></td>
			<td><%=e.getStatus()%></td>
					<td><a href="updateattendance.jsp?aid=<%=e.getAttendanceId()%>">Update</a></td>
			<td><a href="deleteattendance.jsp?aid=<%=e.getAttendanceId()%>">Delete</a></td>
		</tr>
		<%
  }
  }
  %>
		</tr>
		<th colspan="4"><center>
				<input type="button" class="btn btn-outline-success"
					value="Add Attendance" onclick="location.href='AddAttendance.jsp'">
			</center></th>
		<th><input type="hidden"></th>
		<th colspan="4"><center>
				<input type="button" class="btn btn-outline-danger"
					value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
			</center></th>
	</table>
</body>
</html>