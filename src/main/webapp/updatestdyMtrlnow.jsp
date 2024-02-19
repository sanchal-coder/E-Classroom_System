<%@page import="oes.db.studyMatrl"%>
<%@page import="oes.model.studyMtrlDao"%>
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
        String stdymSrc = request.getParameter("stdymSrc");
		String stdyMmodified = request.getParameter("stdymDesc");
		
		int stdyid = Integer.parseInt(request.getParameter("stdmyid"));
		
		LocalDateTime createdAt= LocalDateTime.now();
		studyMatrl smt = new studyMatrl();
		smt.setSource(stdymSrc);
		smt.setDescription(stdyMmodified);
		smt.setDate( createdAt);
		smt.setId(stdyid);
		
   		studyMtrlDao dao = new studyMtrlDao(Provider.getConnection());
		boolean status =dao.updateStudyMaterial(smt);
		if(status == true)
		{
			response.sendRedirect("studyMaterial.jsp");
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