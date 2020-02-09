package learning.bean;

import java.io.Serializable;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class StudentBean
 */
@WebServlet("/StudentBean")
public class StudentBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	int student_id;
	String student_name;
	String student_pass;
	String student_address;
	String student_class;

	static public int role;
	static public int id;
	static public String name;
	static public String pass;

	static public boolean flag = false;
	static public String msg;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentBean() {
    }

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_pass() {
		return student_pass;
	}

	public void setStudent_pass(String student_pass) {
		this.student_pass = student_pass;
	}

	public String getStudent_address() {
		return student_address;
	}

	public void setStudent_address(String student_address) {
		this.student_address = student_address;
	}

	public String getStudent_class() {
		return student_class;
	}

	public void setStudent_class(String student_class) {
		this.student_class = student_class;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		StudentBean.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		StudentBean.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		StudentBean.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		StudentBean.pass = pass;
	}

	public boolean getFlag(){
		return flag;
	}

	public void setFlag(boolean flag){
		HomeworkBean.flag = flag;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		StudentBean.msg = msg;
	}

}
