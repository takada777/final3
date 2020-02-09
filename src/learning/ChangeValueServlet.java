package learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeValueServlet
 */
@WebServlet("/ChangeValueServlet")
public class ChangeValueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeValueServlet() {
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
		int num = Integer.parseInt(request.getParameter("num"));
		String val = (request.getParameter("val"));

		DBRelation dbr = new DBRelation();

		if(num==1){
			dbr.UpdateClass(id, val);
		}else if(num==2){
			dbr.UpdateName(id, val);
		}else if(num==3){
			dbr.UpdateAddress(id, val);
		}else if(num==4){
			dbr.UpdatePassword(id, val);
		}

		response.sendRedirect("DispAccountServlet");

	}

}
