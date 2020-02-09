package learning.bean;

import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class StudentArrayBean
 */
@WebServlet("/StudentArrayBean")
public class StudentArrayBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	ArrayList<StudentBean> studentArray;

	public StudentArrayBean(){
		studentArray = new ArrayList<StudentBean>();
	}

	public void addStudentArray(StudentBean sb){
		studentArray.add(sb);
	}

	public ArrayList<StudentBean> getStudentArray(){
		return studentArray;
	}

}
