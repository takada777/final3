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
 * Servlet implementation class DispHomeworkServlet
 */
@WebServlet("/DispHomeworkServlet")
public class DispHomeworkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispHomeworkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());


		DBDisp dbd = new DBDisp();
		HomeworkBean hb = new HomeworkBean();
		HttpSession session=request.getSession();

		HomeworkArrayBean hab =dbd.DispHomework();
		session.setAttribute("hab", hab);
		session.setAttribute("msg",hb.getMsg());
		getServletContext().getRequestDispatcher("/Homework.jsp").forward(request, response);
	}

}
