package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import learning.bean.QuestionArrayBean;
import learning.bean.SubjectArrayBean;



/**
 * Servlet implementation class DispQuestionServlet
 */
@WebServlet("/DispQuestionServlet")
public class DispQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		DBDisp dbd = new DBDisp();
		SubjectArrayBean sab = dbd.DispSubject();
		QuestionArrayBean qab = dbd.DispQuestion();

		HttpSession session=request.getSession();
		session.setAttribute("sab", sab);
		session.setAttribute("qab", qab);
		 getServletContext().getRequestDispatcher("/Mondaiichiran.jsp").forward(request, response);

	}
}

