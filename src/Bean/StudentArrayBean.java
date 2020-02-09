package Bean;

import java.io.Serializable;
import java.util.ArrayList;
public class StudentArrayBean implements Serializable {
	private ArrayList<StudentBean> studentArray;
	public StudentArrayBean() {
	      studentArray=new ArrayList<StudentBean>();

	       // TODO Auto-generated constructor stub
	   }
	   public void addstudentArray(StudentBean sBean){
	   	studentArray.add(sBean);
	   }
	   public int getArraysize(){
	   	return studentArray.size();
	   }
	   public ArrayList<StudentBean> getStudentArray(){
		   	return studentArray;

		   }
		   public void setStudentArray(ArrayList<StudentBean> studentArray) {
				this.studentArray = studentArray;
			}
}
