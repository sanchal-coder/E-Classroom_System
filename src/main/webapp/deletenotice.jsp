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
		Notice n = new Notice();
	    NoticeDao nd = new NoticeDao(Provider.getConnection());
		int sid=Integer.parseInt(request.getParameter("nid"));
		n.setNoticeId(sid);
		boolean status = nd.deleteNotice(sid);
		if(status ==  true)
			response.sendRedirect("NoticeList.jsp");
		else
			out.print("Error");
		
	%>
</body>
</html>