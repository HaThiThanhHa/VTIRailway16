package Assignment2;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;

public class Account {

	public int				accountID;
	public String 			email;
	public String 			userName;
	public String  			fullName;
	Department				department;
	Position   				position;
	public Date		 		createDate;
	public LocalDate		createDateEx5;
	public Group[] 		    groups;
	

	@Override
	public String toString() {
		return "Account [accountID=" + accountID + ", email=" + email + ", userName=" + userName + ", fullName="
				+ fullName + ", department=" + department + ", position=" + position + ", createDate=" + createDate
				+ ", groups=" + Arrays.toString(groups) + "]";
	}
	

	}

