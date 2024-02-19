		package oes.controller;

import java.awt.image.DataBuffer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.text.spi.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oes.db.Provider;
import oes.db.Students;
import oes.db.attendance;
import oes.model.StudentsDao;
import oes.model.attendanceDao;

/**
 * Servlet implementation class StudentInsert
 */
@WebServlet("/oes.controller.AttendanceInsert")
public class AttendanceInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String uid = 	request.getParameter("uid");
		//String date = request.getParameter("date");
		String lec = request.getParameter("lec");
		String sts = request.getParameter("status");
		String dateParameter = request.getParameter("date");

		if (lec.isEmpty() || sts.isEmpty() || dateParameter.isEmpty()) {
		    String msg2 = "Please fill in all the required fields.";
		    response.sendRedirect("AddAttendance.jsp?msg2=" + msg2);
		} else {
			
			int puid = 	Integer.parseInt(request.getParameter("uid"));
		    // Define the date format expected in the "date" parameter
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		    LocalDateTime currentDateTime = LocalDateTime.parse(dateParameter + " " + LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")), formatter);

		    // Create an attendance object and populate it with the data
		    attendance st = new attendance();
		    st.setStudentId(puid);
		    st.setDate(currentDateTime);
		    st.setLecture(lec);
		    st.setStatus(sts);

		    attendanceDao dao = new attendanceDao(Provider.getConnection());

		    boolean status = dao.insertAttendance(st);

		    if (status) {
		        String msg1 = "Attendance Added";
		        response.sendRedirect("AddAttendance.jsp?msg1=" + msg1);
		    } else {
		        String msg2 = "Attendance not Added";
		        response.sendRedirect("AddAttendance.jsp?msg2=" + msg2);
		    }
		}
	}
}


	

