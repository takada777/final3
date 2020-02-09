package learning.bean;

import java.io.Serializable;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class SubjectBean
 */
@WebServlet("/SubjectBean")
public class SubjectBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	int subject_id;
	String subject_name;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectBean() {
    }

	public int getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

}
