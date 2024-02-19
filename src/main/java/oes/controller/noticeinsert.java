package oes.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oes.db.Instructions;
import oes.db.Notice;
import oes.db.Provider;
import oes.model.InstructionsDao;
import oes.model.NoticeDao;

/**
 * Servlet implementation class InstructionInsert
 */
@WebServlet("/oes.controller.NoticeInsert")
public class noticeinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeinsert() {
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
		
		String dscrpt = request.getParameter("note");
		LocalDateTime createdAt= LocalDateTime.now();
		
		Notice nt = new Notice();
	 
		nt.setContent(dscrpt);
		nt.setCreatedAt(createdAt);
		NoticeDao dao = new NoticeDao(Provider.getConnection());		
		boolean status;
		try {
			status = dao.addNotice(nt);
			if(status)
			{
				String msg1 = "Notice Added";
		    	response.sendRedirect("Addnotice.jsp?msg1="+msg1);
			}
			else
			{
				String msg2 = "Notice not Added";
		    	response.sendRedirect("Addnotice.jsp?msg2="+msg2);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}



}
