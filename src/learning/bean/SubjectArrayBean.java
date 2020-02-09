package learning.bean;

import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class SubjectArrayBean
 */
@WebServlet("/SubjectArrayBean")
public class SubjectArrayBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	ArrayList<SubjectBean> subjectArray;

    /**
     * @see HttpServlet#HttpServlet()
     */
	public SubjectArrayBean(){
		subjectArray = new ArrayList<SubjectBean>();
	}

	public void addSubjectArray(SubjectBean sb){
		subjectArray.add(sb);
	}

	public ArrayList<SubjectBean> getSubjectArray(){
		return subjectArray;
	}

}

