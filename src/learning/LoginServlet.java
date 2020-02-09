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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String pass = request.getParameter("pass");
		DBRelation dbr = new DBRelation();
		DBDisp dbd = new DBDisp();
		StudentBean sb = new StudentBean();
		HttpSession session=request.getSession();

		if(dbr.login(id, pass)){
			if(sb.getRole()==2){
				StudentArrayBean sab =dbd.DispAccount(id);
				session.setAttribute("sab", sab);
				getServletContext().getRequestDispatcher("/Student_main.jsp").forward(request, response);
			}else if(sb.getRole()==1){
				//StudentArrayBean sab =dbd.DispClass();
				StudentArrayBean sab =dbd.DispAccount2(id);
				session.setAttribute("sab", sab);

				getServletContext().getRequestDispatcher("/AdminMain.jsp").forward(request, response);
			}
		}else{
			response.sendRedirect("Login.jsp");
		}
	}

}
