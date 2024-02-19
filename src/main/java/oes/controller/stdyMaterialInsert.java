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
import oes.db.studyMatrl;
import oes.model.InstructionsDao;
import oes.model.NoticeDao;
import oes.model.studyMtrlDao;

/**
 * Servlet implementation class InstructionInsert
 */
@WebServlet("/oes.controller.stdyMatrlInsert")
public class stdyMaterialInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stdyMaterialInsert() {
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
		
		String src = request.getParameter("source");
		String dscrpt = request.getParameter("description");
		LocalDateTime createdAt= LocalDateTime.now();
		
		studyMatrl smt= new studyMatrl();
	 
		smt.setSource(src);
		smt.setDescription(dscrpt);
		smt.setDate(createdAt);
	 studyMtrlDao	dao = new  studyMtrlDao(Provider.getConnection());		
		boolean status;
		try {
			status = dao.insertStudyMaterial(smt);
			if(status)
			{
				String msg1 = "Resources Added";
		    	response.sendRedirect("AddstdyMtrl.jsp?msg1="+msg1);
			}
			else
			{
				String msg2 = "Resources not Added";
		    	response.sendRedirect("AAddnoticeddstdyMtrl.jsp?msg2="+msg2);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}



}
