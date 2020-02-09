package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import learning.bean.HomeworkArrayBean;
import learning.bean.HomeworkBean;

/**
 * Servlet implementation class DispTextServlet2
 */
@WebServlet("/DispTextServlet2")
public class DispTextServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispTextServlet2() {
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
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		String a = request.getParameter("subject");
		String b = request.getParameter("question");
		DBDisp dbd = new DBDisp();
		HomeworkBean hb = new HomeworkBean();
		hb.setA(a);
		hb.setB(b);

		HttpSession session=request.getSession();
		HomeworkArrayBean hab = dbd.DispHomeworkText(q_id, s_id);
		session.setAttribute("hab", hab);
		getServletContext().getRequestDispatcher("/HomeworkText.jsp").forward(request, response);
	}

}
