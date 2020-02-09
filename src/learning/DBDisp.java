package learning;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import learning.bean.HomeworkArrayBean;
import learning.bean.HomeworkBean;
import learning.bean.QuestionArrayBean;
import learning.bean.QuestionBean;
import learning.bean.StudentArrayBean;
import learning.bean.StudentBean;
import learning.bean.SubjectArrayBean;
import learning.bean.SubjectBean;



/**
 * Servlet implementation class DBDisp
 */
@WebServlet("/DBDisp")
public class DBDisp extends DBDAO implements Serializable {
	private static final long serialVersionUID = 1L;

	ResultSet rs = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBDisp() {
        super();
        // TODO Auto-generated constructor stub
    }

    public StudentArrayBean DispAccount(int id){
    	StudentArrayBean sab = new StudentArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM student WHERE student_id=?");
    	stmt.setInt(1,id);
    	rs=stmt.executeQuery();
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStudent_id(rs.getInt("student_id"));
			sb.setStudent_name(rs.getString("student_name"));
			sb.setStudent_address(rs.getString("student_address"));
			sb.setStudent_class(rs.getString("student_class"));
			sab.addStudentArray(sb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return sab;
    }
    public StudentArrayBean DispAccount2(int id){
    	StudentArrayBean sab = new StudentArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM student WHERE student_id=?");
    	stmt.setInt(1,id);
    	rs=stmt.executeQuery();
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStudent_id(rs.getInt("student_id"));
			sb.setStudent_name(rs.getString("student_name"));
			//sb.setStudent_address(rs.getString("student_address"));
			//sb.setStudent_class(rs.getString("student_class"));
			sab.addStudentArray(sb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return sab;
    }

    public SubjectArrayBean DispSubject(){
    	SubjectArrayBean sab = new SubjectArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM subject");
    	rs=stmt.executeQuery();
		while(rs.next()){
			SubjectBean sb = new SubjectBean();
			sb.setSubject_id(rs.getInt("subject_id"));
			sb.setSubject_name(rs.getString("subject_name"));
			sab.addSubjectArray(sb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return sab;
    }


    public QuestionArrayBean DispQuestion(){
    	QuestionArrayBean qab = new QuestionArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM question");
    	rs=stmt.executeQuery();
		while(rs.next()){
			QuestionBean qb = new QuestionBean();
			qb.setQuestion_id(rs.getString("question_id"));
			qb.setSubject_id(rs.getInt("subject_id"));
			qb.setSubject_name(rs.getString("subject_name"));
			qb.setQuestion_name(rs.getString("question_name"));
			qb.setQuestion_text(rs.getString("question_text"));
			qb.setQuestion_answer(rs.getString("question_answer"));
			qab.addQuestionArray(qb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return qab;
    }

    public QuestionArrayBean DispQuestionText(String q_id){
    	QuestionArrayBean qab = new QuestionArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM question WHERE question_id=?");
    	stmt.setString(1,q_id);
    	rs=stmt.executeQuery();
		while(rs.next()){
			QuestionBean qb = new QuestionBean();
			qb.setQuestion_id(rs.getString("question_id"));
			qb.setSubject_id(rs.getInt("subject_id"));
			qb.setSubject_name(rs.getString("subject_name"));
			qb.setQuestion_name(rs.getString("question_name"));
			qb.setQuestion_text(rs.getString("question_text"));
			qb.setQuestion_answer(rs.getString("question_answer"));
			qab.addQuestionArray(qb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return qab;
    }

    public StudentArrayBean DispClass(){
    	StudentArrayBean sab = new StudentArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM student WHERE role=1");
    	rs=stmt.executeQuery();
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStudent_id(rs.getInt("student_id"));
			sb.setStudent_name(rs.getString("student_name"));
			sb.setStudent_address(rs.getString("student_address"));
			sb.setStudent_class(rs.getString("student_class"));
			sab.addStudentArray(sb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return sab;
    }

    public HomeworkArrayBean DispHomework(){
    	HomeworkArrayBean hab = new HomeworkArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM homework");
    	rs=stmt.executeQuery();
		while(rs.next()){
			HomeworkBean hb = new HomeworkBean();
			hb.setQuestion_id(rs.getString("question_id"));
			hb.setStudent_id(rs.getInt("student_id"));
			hb.setSubject_id(rs.getInt("subject_id"));
			hb.setSubject_name(rs.getString("subject_name"));
			hb.setQuestion_name(rs.getString("question_name"));
			hb.setQuestion_text(rs.getString("question_text"));
			hb.setQuestion_answer(rs.getString("question_answer"));
			hb.setDeadline(rs.getString("deadline"));
			hab.addHomeworkArray(hb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return hab;
    }

    public HomeworkArrayBean DispHomeworkText(String q_id,int s_id){
    	HomeworkArrayBean hab = new HomeworkArrayBean();
    	try{
    	stmt = con.prepareStatement("SELECT * FROM homework WHERE question_id=? AND student_id=?");
    	stmt.setString(1,q_id);
    	stmt.setInt(2,s_id);
    	rs=stmt.executeQuery();
		while(rs.next()){
			HomeworkBean hb = new HomeworkBean();
			hb.setQuestion_id(rs.getString("question_id"));
			hb.setStudent_id(rs.getInt("student_id"));
			hb.setSubject_id(rs.getInt("subject_id"));
			hb.setSubject_name(rs.getString("subject_name"));
			hb.setQuestion_name(rs.getString("question_name"));
			hb.setQuestion_text(rs.getString("question_text"));
			hb.setQuestion_answer(rs.getString("question_answer"));
			hb.setDeadline(rs.getString("deadline"));
			hab.addHomeworkArray(hb);
		}
    	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
    	}
    	return hab;
    }

}
