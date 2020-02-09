package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import learning.bean.StudentArrayBean;
import learning.bean.StudentBean;

/**
 * Servlet implementation class DispAccountServlet
 */
@WebServlet("/DispAccountServlet2")
public class DispAccountServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispAccountServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		StudentBean sb = new StudentBean();
		DBDisp dbd = new DBDisp();
		HttpSession session=request.getSession();

		StudentArrayBean sab =dbd.DispAccount(sb.getId());
		session.setAttribute("sab", sab);
		getServletContext().getRequestDispatcher("/Oshirase2.jsp").forward(request, response);
	}
}