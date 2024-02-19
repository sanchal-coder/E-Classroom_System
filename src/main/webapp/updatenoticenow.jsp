<%@page import="oes.db.Provider"%>
<%@page import="oes.model.NoticeDao"%>
<%@page import="oes.model.QuestionsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import= "java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%      
        String OriginalQuestion = request.getParameter("ntcoriginal");
		String ntcmodified = request.getParameter("ntcmodified");
		
		int nid = Integer.parseInt(request.getParameter("nid"));
		
		LocalDateTime createdAt= LocalDateTime.now();
   		NoticeDao dao = new NoticeDao(Provider.getConnection());
		boolean status =dao.updateNotice(ntcmodified,createdAt,nid);
		if(status == true)
		{
			response.sendRedirect("NoticeList.jsp");
		}
		else if(status == false)
		{
			out.print("error from databse");
			
		}
		else
		{
			out.print("exception occured");
		}
		
	%>
</body>
</html>