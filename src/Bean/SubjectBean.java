package Bean;

import java.io.Serializable;

public class SubjectBean implements Serializable{
 int subject_id;
 String subject_name;
 String subjectcol;
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
public String getSubjectcol() {
	return subjectcol;
}
public void setSubjectcol(String subjectcol) {
	this.subjectcol = subjectcol;
}
}
