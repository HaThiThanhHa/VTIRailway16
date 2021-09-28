package Exercise3;

import java.util.Arrays;
import java.util.Date;

public class Account {

	int				accountID;
	String 			email;
	String 			userName;
	String  		fullName;
	Department		department;
	Position   		position;
	Date 			createDate;
	Group[] 		groups;
	

	@Override
	public String toString() {
		return "Account [accountID=" + accountID + ", email=" + email + ", userName=" + userName + ", fullName="
				+ fullName + ", department=" + department + ", position=" + position + ", createDate=" + createDate
				+ ", groups=" + Arrays.toString(groups) + "]";
	}
	

	}

