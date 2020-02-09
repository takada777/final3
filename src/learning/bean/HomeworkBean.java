package learning.bean;

import java.io.Serializable;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class HomeworkBean
 */
@WebServlet("/HomeworkBean")
public class HomeworkBean extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	String question_id;
	int student_id;
	int subject_id;
	String subject_name;
	String question_name;
	String question_text;
	String question_answer;
	String deadline;

	static public String q_id;
	static public int stu_id;
	static public int sub_id;
	static public String sub_name;
	static public String q_name;
	static public String q_text;
	static public String q_answer;
	static public String d_line;

	static public String message;
	static public boolean flag = false;

	static public String a;
	static public String b;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeworkBean() {
    }

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
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

	public String getQuestion_name() {
		return question_name;
	}

	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}

	public String getQuestion_text() {
		return question_text;
	}

	public void setQuestion_text(String question_text) {
		this.question_text = question_text;
	}

	public String getQuestion_answer() {
		return question_answer;
	}

	public void setQuestion_answer(String question_answer) {
		this.question_answer = question_answer;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		HomeworkBean.q_id = q_id;
	}

	public int getStu_id() {
		return stu_id;
	}

	public void setStu_id(int stu_id) {
		HomeworkBean.stu_id = stu_id;
	}

	public int getSub_id() {
		return sub_id;
	}

	public void setSub_id(int sub_id) {
		HomeworkBean.sub_id = sub_id;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		HomeworkBean.sub_name = sub_name;
	}

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String q_name) {
		HomeworkBean.q_name = q_name;
	}

	public String getQ_text() {
		return q_text;
	}

	public void setQ_text(String q_text) {
		HomeworkBean.q_text = q_text;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		HomeworkBean.q_answer = q_answer;
	}

	public String getD_line() {
		return d_line;
	}

	public void setD_line(String d_line) {
		HomeworkBean.d_line = d_line;
	}

	public String getMsg(){
		return message;
	}

	public void setMsg(String msg){
		HomeworkBean.message = msg;
	}

	public String getA(){
		return a;
	}

	public void setA(String a){
		HomeworkBean.a = a;
	}

	public String getB(){
		return b;
	}

	public void setB(String b){
		HomeworkBean.b = b;
	}

	public boolean getFlag(){
		return flag;
	}

	public void setFlag(boolean flag){
		HomeworkBean.flag = flag;
	}

}
