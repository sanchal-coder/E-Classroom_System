<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="oes.db.*"%>
<%@page import="oes.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		
	
	int nid =Integer.parseInt(request.getParameter("aid"));
	attendanceDao dao =new attendanceDao(Provider.getConnection());		
		boolean status = dao.deleteAttendance(nid);
		if(status == true)
			response.sendRedirect("attendance.jsp");
		else
			out.print("Error");
		
	%>
</body>
</html>