package assignment3;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;

public class Account {

	int				accountID;
	String 			email;
	String 			userName;
	String  		fullName;
	Department		department;
	Position   		position;
	LocalDate 		createDate;
	Group[] 		groups;
	
	
	

	@Override
	public String toString() {
		return "Account [accountID=" + accountID + ", email=" + email + ", userName=" + userName + ", fullName="
				+ fullName + ", department=" + department + ", position=" + position + ", createDate=" + createDate
				+ ", groups=" + Arrays.toString(groups) + "]";
	}
	
		@Override
		public boolean 		equals(Object obj) {
			Account 		accDemo = (Account) obj;
			if (fullName == accDemo.fullName ) {
			return true;
			} else {
			return false;

		}
	}
}
