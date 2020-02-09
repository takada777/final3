package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import learning.bean.StudentBean;

/**
 * Servlet implementation class JudgmentServlet2
 */
@WebServlet("/JudgmentServlet2")
public class JudgmentServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;



    /**
     * @see HttpServlet#HttpServlet()
     */
    public JudgmentServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String text = request.getParameter("text");
		String answer = request.getParameter("answer");
		String msg;
		StudentBean sb = new StudentBean();
		sb.setFlag(true);
		HttpSession session=request.getSession();

		if(text.equals(answer)){
			msg = "正解！！！";
			sb.setMsg(msg);
			session.setAttribute("text", text);
			session.setAttribute("answer", answer);
			getServletContext().getRequestDispatcher("/HomeworkText.jsp").forward(request, response);
		}else{
			msg = "雑魚じゃん！！！";
			sb.setMsg(msg);
			session.setAttribute("text", text);
			session.setAttribute("answer", answer);

			getServletContext().getRequestDispatcher("/HomeworkText.jsp").forward(request, response);

		}
	}

}
