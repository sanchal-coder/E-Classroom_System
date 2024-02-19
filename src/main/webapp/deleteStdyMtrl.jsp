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
		studyMatrl sm = new studyMatrl();
	studyMtrlDao dao =new studyMtrlDao(Provider.getConnection());		
		int stdyid=Integer.parseInt(request.getParameter("id"));
		sm.setId(stdyid);
		boolean status = dao.deleteStudyMaterial(stdyid);
		if(status ==  true)
			response.sendRedirect("studyMaterial.jsp");
		else
			out.print("Error");
		
	%>
</body>
</html>