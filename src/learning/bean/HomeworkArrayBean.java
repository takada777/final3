package learning.bean;

import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class HomeworkArrayBean
 */
@WebServlet("/HomeworkArrayBean")
public class HomeworkArrayBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	ArrayList<HomeworkBean> homeworkArray;

    /**
     * @see HttpServlet#HttpServlet()
     */
	public HomeworkArrayBean(){
		homeworkArray = new ArrayList<HomeworkBean>();
	}

	public void addHomeworkArray(HomeworkBean hb){
		homeworkArray.add(hb);
	}

	public ArrayList<HomeworkBean> getHomeworkArray(){
		return homeworkArray;
	}

}