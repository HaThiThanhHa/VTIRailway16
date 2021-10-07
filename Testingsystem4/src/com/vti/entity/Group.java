package com.vti.entity;


import java.util.Arrays;
import java.util.Date;

public class Group {

private	byte	groupID;
private String	groupName;
private int		creatorID;
private Date	creatDate;

Account[] accounts;
public Group (){
}

public byte getGroupID() {
	return groupID;
}




public void setGroupID(byte groupID) {
	this.groupID = groupID;
}




public String getGroupName() {
	return groupName;
}




public void setGroupName(String groupName) {
	this.groupName = groupName;
}




public int getCreatorID() {
	return creatorID;
}




public void setCreatorID(int creatorID) {
	this.creatorID = creatorID;
}




public Date getCreatDate() {
	return creatDate;
}




public void setCreatDate(Date creatDate) {
	this.creatDate = creatDate;
}




public Account[] getAccounts() {
	return accounts;
}




public void setAccounts(Account[] accounts) {
	this.accounts = accounts;
}




@Override
public String toString() {
	return "Group [groupID=" + groupID + ", groupName=" + groupName + ", creatorID=" + creatorID + ", creatDate="
			+ creatDate + ", accounts=" + Arrays.toString(accounts) + "]";
}





}

