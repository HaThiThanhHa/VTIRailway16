package Exercise1;

import java.util.Date;

public class Question {

	int								questionID;
	String							content;
	CatelogyQuestion				catelogyQuestion;
	Account 						account;
	Date							createDate;
	@Override
	public String toString() {
		return "Question [questionID=" + questionID + ", content=" + content + ", catelogyQuestion=" + catelogyQuestion
				+ ", account=" + account + ", createDate=" + createDate + "]";
	}
	
	
}	
	