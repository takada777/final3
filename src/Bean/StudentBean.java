package Bean;
import java.io.Serializable;
public class StudentBean implements Serializable{
	int student_id;
	String student_name;
	String student_pass;
	int student_class;
	int role;
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
	public int getStudent_class() {
		return student_class;
	}
	public void setStudent_class(int student_class) {
		this.student_class = student_class;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}

}
