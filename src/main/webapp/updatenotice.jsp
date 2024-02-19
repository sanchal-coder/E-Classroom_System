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
			<th>Notice Id</th>
			<th>Description</th>
			<th>Date</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<tr>
			<%
			int i = 0;
			Integer nid=Integer.parseInt(request.getParameter("nid"));
			NoticeDao dao =new NoticeDao(Provider.getConnection());		
		   List  <Notice> list = dao.getAllNotices();
		   for(Notice e : list)
			   
  {  if(nid.equals(e.getNoticeId())) 
	{
      %>
		
		<tr class="table-primary">
			<form action="updatenoticenow.jsp">
			
			
					
				
				<td><%=i++%></td>
			
				
				
				<td><%=e.getNoticeId()%></td>
				
				
				
				<td><input type="text" value="<%=e.getContent()%>"
					name="ntcmodified"></input></td>
					
						<td><%=e.getCreatedAt()%></td>
						
						
				
						
						
					
					<td><input type="submit" value="update"></td>
				<td><a href="deletenotice.jsp?nid=<%=e.getNoticeId()%>">Delete</a></td>
				
						<input type="hidden" value="<%=e.getNoticeId()%>"
				type="text"	name="nid"></input>
				
				
			</form>
		</tr>
		<%	
	}
  else
	{ 
	%>
		<tr>
			<td><%=i++%></td>
			<td><%=e.getNoticeId()%></td>
			<td><%=e.getContent()%></td>
			<td><%=e.getCreatedAt()%></td>
			<td><a href="updatenotice.jsp?nid=<%=e.getNoticeId()%>">Update</a></td>
			<td><a href="deletenotice.jsp?nid=<%=e.getNoticeId()%>">Delete</a></td>
		</tr>
		<%
  }
  }
  %>
		</tr>
		<th colspan="4"><center>
				<input type="button" class="btn btn-outline-success"
					value="Add Notice" onclick="location.href='Addnotice.jsp'">
			</center></th>
		<th><input type="hidden"></th>
		<th colspan="4"><center>
				<input type="button" class="btn btn-outline-danger"
					value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
			</center></th>
	</table>
</body>
</html>