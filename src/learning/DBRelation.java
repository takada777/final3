package learning;

import java.io.Serializable;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import learning.bean.HomeworkBean;
import learning.bean.StudentBean;



/**
 * Servlet implementation class DBRelation
 */

@WebServlet("/DBRelation)")
public class DBRelation extends DBDAO implements Serializable {
	private static final long serialVersionUID = 1L;

	StudentBean sb = new StudentBean();
	HomeworkBean hb = new HomeworkBean();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBRelation() {
        super();
    }

	public boolean login(int id,String pass){

		ResultSet rslt = null;
		String login = "SELECT * FROM student WHERE student_id = ? AND student_pass = ?";
		try{
		stmt = con.prepareStatement(login);
		stmt.setInt(1,id);
		stmt.setString(2,pass);
		rslt = stmt.executeQuery();
	    if(rslt.next()){
	    		sb.setId(rslt.getInt("student_id"));
	    		sb.setName(rslt.getString("student_name"));
	    		sb.setPass(rslt.getString("student_pass"));
	    		sb.setRole(rslt.getInt("role"));
				return true;
	    }else{
			return false;
	    }

		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try{
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	public boolean IdDuplicateCheck(int id){
    	ResultSet rs=null;
		String sql = "SELECT * FROM student WHERE student_id = ?";
		try{
		stmt = con.prepareStatement(sql);
		stmt.setInt(1,id);
		rs = stmt.executeQuery();
	    if(rs.next()){
				return true;
	    }else{
			return false;
	    }

		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try{
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
    }

	public void InsertStudent(int id,String name,String pass,String adress,String cls){

		//String sql = "INSERT INTO student VALUES(?,?,?,?,?,1);";
		String sql = ("INSERT INTO student VALUES('"+id+"','"+name+"','"+pass+"','"+adress+"',"+cls+")");

		try{
			stmt = con.prepareStatement(sql);
			//stmt.setInt(1,id);
			//stmt.setString(2,name);
			//stmt.setString(3,pass);
			//stmt.setString(4,adress);
			//stmt.setString(5,cls);

			stmt.executeUpdate(sql);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void InsertStudent2(int id,String name,String pass,String adress,String cls){
		ResultSet rs=null;
		this.open();
		System.out.println(id);
		System.out.println(name);
		System.out.println(pass);
		System.out.println(adress);
		System.out.println(cls);

		try{
		stmt = con.prepareStatement("INSERT INTO student VALUES(?,?,?,?,?,2)");

		stmt.setInt(1,id);
		stmt.setString(2,name);
		stmt.setString(3,pass);
		stmt.setString(4,adress);
		stmt.setString(5,cls);
		int num=stmt.executeUpdate();
		rs=stmt.executeQuery();
	//	stmt.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
    }



	public void SetHomeworkBean(String question_id){
    	ResultSet rs=null;
		String sql = "SELECT * FROM question WHERE question_id = ?";
		try{
			stmt = con.prepareStatement(sql);
			stmt.setString(1,question_id);
			rs = stmt.executeQuery();
		    	if(rs.next()){
		    		hb.setSub_id(rs.getInt("subject_id"));
		    		hb.setSub_name(rs.getString("subject_name"));
		    		hb.setQ_name(rs.getString("question_name"));
		    		hb.setQ_text(rs.getString("question_text"));
		    		hb.setQ_answer(rs.getString("question_answer"));
		    	}

			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					stmt.close();
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

	public void InsertHomework(String question_id,int student_id,int subject_id,String subject_name,
			String question_name,String question_text,String question_answer,String deadline){
		ResultSet rs=null;
		this.open();
		System.out.println(hb.getQ_id());
		System.out.println(student_id);
		System.out.println(subject_id);
		System.out.println(subject_name);
		System.out.println(question_name);
		System.out.println(question_text);
		System.out.println(question_answer);
		System.out.println(deadline);

		try{

			stmt = con.prepareStatement("INSERT INTO homework VALUES(?,?,?,?,?,?,?,?)");
			stmt.setString(1,question_id);
			stmt.setInt(2,student_id);
			stmt.setInt(3,subject_id);
			stmt.setString(4,subject_name);
			stmt.setString(5,question_name);
			stmt.setString(6,question_text);
			stmt.setString(7,question_answer);
			stmt.setString(8,deadline);

    		int num=stmt.executeUpdate();
    		rs=stmt.executeQuery();

			}catch(Exception e){
			e.printStackTrace();
			}
		}

	public void SubmitHomework(String q_id,int s_id){
		System.out.println(s_id);
		System.out.println(q_id);
			ResultSet rs=null;
			this.open();
    	try{
        	stmt = con.prepareStatement("DELETE FROM homework WHERE question_id=? AND student_id=?;");
        	stmt.setString(1,q_id);
        	stmt.setInt(2,s_id);
    		int num=stmt.executeUpdate();
    		rs=stmt.executeQuery();

        	}catch(Exception e){
    		e.printStackTrace();
        	}
	}

	 public void UpdateClass(int id,String val){
	    	try{
	    	stmt = con.prepareStatement("UPDATE student SET student_class=? WHERE student_id=?;");
	    	stmt.setString(1,val);
	    	stmt.setInt(2,id);

	    	stmt.executeUpdate();

	    	}catch(Exception e){
			e.printStackTrace();
	    	}
	    }

	 public void UpdateName(int id,String val){
	    	try{
	    	stmt = con.prepareStatement("UPDATE student SET student_name=? WHERE student_id=?;");
	    	stmt.setString(1,val);
	    	stmt.setInt(2,id);

	    	stmt.executeUpdate();

	    	}catch(Exception e){
			e.printStackTrace();
	    	}
	    }

	 public void UpdateAddress(int id,String val){
	    	try{
	    	stmt = con.prepareStatement("UPDATE student SET student_address=? WHERE student_id=?;");
	    	stmt.setString(1,val);
	    	stmt.setInt(2,id);

	    	stmt.executeUpdate();

	    	}catch(Exception e){
			e.printStackTrace();
	    	}
	    }

	 public void UpdatePassword(int id,String val){
	    	try{
	    	stmt = con.prepareStatement("UPDATE student SET student_pass=? WHERE student_id=?;");
	    	stmt.setString(1,val);
	    	stmt.setInt(2,id);

	    	stmt.executeUpdate();

	    	}catch(Exception e){
			e.printStackTrace();
	    	}
	    }

}
