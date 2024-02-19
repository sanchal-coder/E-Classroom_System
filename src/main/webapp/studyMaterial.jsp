<%@page import="oes.db.Notice"%>
<%@page import="oes.db.studyMatrl"%>
<%@page import="oes.db.Provider"%>
<%@page import="oes.db.attendance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="oes.model.*"%>
<%@page import="oes.db.Students"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<center>
		<h3>
			<pre>
				<font color="blue">List of all study materials</font>
		</h3>
		</pre>
	</center>
	<table class="table table-bordered table-hover">
		<tr tr class="table-dark">
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
	studyMtrlDao dao =new studyMtrlDao(Provider.getConnection());		
   List <studyMatrl> studyMatrls = dao.getAllStudyMaterials();
  for(studyMatrl e : studyMatrls)
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