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
			<th>Id</th>
			<th>Source</th>
			<th>Description</th>
			<th>Date</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<tr>
			<%
			int i = 0;
			Integer nid=Integer.parseInt(request.getParameter("id"));
				studyMtrlDao dao =new studyMtrlDao(Provider.getConnection());		
			   List <studyMatrl> studyMatrls = dao.getAllStudyMaterials();
			  for(studyMatrl e : studyMatrls)
			    
  {  if(nid.equals(e.getId())) 
	{
      %>
		
		<tr class="table-primary">
			<form action="updatestdyMtrlnow.jsp">
			
			
					
				
				<td><%=i++%></td>
			
				
				
				<td><%=e.getId()%></td>
				
				
				
				<td><input type="text" value="<%=e.getSource()%>"
					name="stdymSrc"></input></td>
					
					<td><input type="text" value="<%=e.getDescription()%>"
					name="stdymDesc"></input></td>
					
						<td><%=e.getDate()%></td>
						
						
				
						
						
					
					<td><input type="submit" value="update"></td>
		<td><a href="deleteStdyMtrl.jsp?id=<%=e.getId()%>">Delete</a></td>
				
						<input type="hidden" value="<%=e.getId()%>"
				type="text"	name="stdmyid"></input>
				
				
			</form>
		</tr>
		<%	
	}
  else
	{ 
	%>
		<tr>
			<td><%=i++%></td>
			<td><%=e.getId()%></td>
			<td><a href="<%=e.getSource()%>"><%=e.getSource()%></a></td>
			<td><%=e.getDescription()%></td>
			<td><%=e.getDate()%></td>
			<td><a href="updatestdyMtrl.jsp?id=<%=e.getId()%>">Update</a></td>
			<td><a href="deleteStdyMtrl.jsp?id=<%=e.getId()%>">Delete</a></td>
		</tr>
		<%
  }
  }
  %>
	<tr>
			<th colspan="2"><center>
					<input type="button" value="Add Study Material"
						class="btn btn-outline-success"
						onclick="location.href='AddstdyMtrl.jsp'">
				</center></th>
			<th colspan="2"><input type="hidden"></th>
			<th colspan="2"><center>
					<input type="button" class="btn btn-outline-danger"
						value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
				</center></th>
		</tr>
	</table>
</body>
</html>