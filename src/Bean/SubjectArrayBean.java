package Bean;

import java.io.Serializable;
import java.util.ArrayList;
public class SubjectArrayBean implements Serializable {
	private ArrayList<SubjectBean> subjectArray;
	public SubjectArrayBean() {
	      subjectArray=new ArrayList<SubjectBean>();

	       // TODO Auto-generated constructor stub
	   }
	   public void addsubjectArray(SubjectBean subjectBean){
	   	subjectArray.add(subjectBean);
	   }
	   public int getArraysize(){
	   	return subjectArray.size();
	   }
	   public ArrayList<SubjectBean> getSubjectArray(){
		   	return subjectArray;

		   }
		   public void setSubjectArray(ArrayList<SubjectBean> subjectArray) {
				this.subjectArray = subjectArray;
			}
}