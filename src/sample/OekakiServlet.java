package sample;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exception.DatabaseException;
import exception.SystemException;

/**
 * Servlet implementation class OekakiServlet
 */
@WebServlet("/OekakiServlet")
public class OekakiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("roomid");
		Dao dao = new Dao();
		String roomname = null;
		try {
			roomname = dao.roomname(Integer.parseInt(id));
		} catch (NumberFormatException | DatabaseException
				| SystemException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		request.setAttribute("roomid", id);
		request.setAttribute("roomname", roomname);
		getServletContext().getRequestDispatcher("/oekaki.jsp")
		.forward(request, response);
	}

}
