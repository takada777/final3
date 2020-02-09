package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learning.bean.HomeworkBean;

/**
 * Servlet implementation class HomeworkGiveServlet
 */
@WebServlet("/HomeworkGiveServlet")
public class HomeworkGiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeworkGiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String question_id = request.getParameter("question_id");
		int  student_id= Integer.parseInt(request.getParameter("student_id"));
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");

		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		//int  year= Integer.parseInt(request.getParameter("year"));
		//int  month= Integer.parseInt(request.getParameter("month"));
		//int  day= Integer.parseInt(request.getParameter("day"));

		String deadline = (year + month + day);

		System.out.println(deadline);

		HomeworkBean hb = new HomeworkBean();
		hb.setQ_id(question_id);
		hb.setStu_id(student_id);
		hb.setD_line(deadline);

		DBRelation dbr = new DBRelation();
		dbr.SetHomeworkBean(question_id);
		dbr.InsertHomework(question_id,hb.getStu_id(),hb.getSub_id(),hb.getSub_name(),hb.getQ_name(),hb.getQ_text(),hb.getQ_answer(),hb.getD_line());

		response.sendRedirect("DispClassServlet2");

	}

}
