package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import learning.bean.QuestionArrayBean;

/**
 * Servlet implementation class DispTextServlet
 */
@WebServlet("/DispTextServlet")
public class DispTextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispTextServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());


		String q_id = request.getParameter("q_id");
		DBDisp dbd = new DBDisp();
		HttpSession session=request.getSession();

		//if(val==1){
			QuestionArrayBean qab = dbd.DispQuestionText(q_id);
			session.setAttribute("qab", qab);
			getServletContext().getRequestDispatcher("/Text.jsp").forward(request, response);
		//}else{
		//	int s_id = Integer.parseInt(request.getParameter("s_id"));
		//	HomeworkArrayBean hab = dbd.DispHomeworkText(q_id, s_id);
		//	session.setAttribute("hab", hab);
		//	getServletContext().getRequestDispatcher("/HomeworkText.jsp").forward(request, response);
		//}


	}

}
