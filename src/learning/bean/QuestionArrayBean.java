package learning.bean;

import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class QuestionArrayBean
 */
@WebServlet("/QuestionArrayBean")
public class QuestionArrayBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	ArrayList<QuestionBean> questionArray;

    /**
     * @see HttpServlet#HttpServlet()
     */
	public QuestionArrayBean(){
		questionArray = new ArrayList<QuestionBean>();
	}

	public void addQuestionArray(QuestionBean qb){
		questionArray.add(qb);
	}

	public ArrayList<QuestionBean> getQuestionArray(){
		return questionArray;
	}

}

