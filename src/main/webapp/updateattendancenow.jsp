<%@page import="oes.db.attendance"%>
<%@page import="oes.model.attendanceDao"%>
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
       // String OriginalDate = request.getParameter("dt");
		String lecmodified = request.getParameter("lec");
		String sts = request.getParameter("sts");
		
		int nid =Integer.parseInt(request.getParameter("aid"));
		
		//LocalDateTime createdAt= LocalDateTime.now();
		attendance aupdt = new attendance();
		aupdt.setAttendanceId(nid);
		aupdt.setLecture(lecmodified);
		aupdt.setStatus(sts);
   		attendanceDao dao = new attendanceDao(Provider.getConnection());
		boolean status =dao.updateAttendance(aupdt);
		if(status == true)
		{
			response.sendRedirect("attendance.jsp");
		}
		else if(status == false)
		{
			out.print("error from databse");
			
		}
		else
		{
			out.print("excepion occured");
		}
		
	%>
</body>
</html>