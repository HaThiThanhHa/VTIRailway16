package com.vti.entity;

import java.time.LocalDate;
import java.util.Arrays;

public class Account {

private	int				accountID;
private	String 			email;
private	String 			userName;
private	String  		fullName;
private	Department		department;
private	Position   		position;
private	LocalDate 		createDate;
private	Group[] 		groups;
	
public  Account() {	
}

	public Account(int accountID, String email, String userName, String fullName, Position pos) {

	}
	public Account(int accountID, String email, String userName, String fullName, Position pos ,LocalDate creaDate) {

	}
	public int getAccountID() {
	return accountID;
}

public void setAccountID(int accountID) {
	this.accountID = accountID;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getFullName() {
	return fullName;
}

public void setFullName(String fullName) {
	this.fullName = fullName;
}

public Department getDepartment() {
	return department;
}

public void setDepartment(Department department) {
	this.department = department;
}

public Position getPosition() {
	return position;
}

public void setPosition(Position position) {
	this.position = position;
}

public LocalDate getCreateDate() {
	return createDate;
}

public void setCreateDate(LocalDate createDate) {
	this.createDate = createDate;
}

public Group[] getGroups() {
	return groups;
}

public void setGroups(Group[] groups) {
	this.groups = groups;
}

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

