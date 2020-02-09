package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learning.bean.HomeworkBean;

/**
 * Servlet implementation class HomeworkSubmitServlet
 */
@WebServlet("/HomeworkSubmitServlet")
public class HomeworkSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeworkSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HomeworkBean hb = new HomeworkBean();
		String q_id = request.getParameter("q_id");
		int  s_id= Integer.parseInt(request.getParameter("s_id"));
		String subject = hb.getA();
		String question = hb.getB();
		String msg = subject + "の" + question + "を提出しました";

		DBRelation dbr = new DBRelation();
		dbr.SubmitHomework(q_id, s_id);

		hb.setFlag(true);
		hb.setMsg(msg);

		response.sendRedirect("DispHomeworkServlet");
	}

}
