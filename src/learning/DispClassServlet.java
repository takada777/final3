package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import learning.bean.StudentArrayBean;

/**
 * Servlet implementation class DispClassServlet
 */
@WebServlet("/DispClassServlet")
public class DispClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispClassServlet() {
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
		HttpSession session=request.getSession();

		StudentArrayBean sab =dbd.DispClass();
		session.setAttribute("sab", sab);
		getServletContext().getRequestDispatcher("/Class.jsp").forward(request, response);
	}

}
