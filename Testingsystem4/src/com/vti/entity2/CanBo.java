package com.vti.entity2;

public class CanBo {

	public CanBo() {
		// TODO Auto-generated constructor stub
	}
	private String	fullName;
	private int		age;
	private Gender	gender;
	private String	homeTown;

public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName = fullName;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public Gender getGender() {
	return gender;
}
public void setGender(Gender gender) {
	this.gender = gender;
}
public String getHomeTown() {
	return homeTown;
}
public void setHomeTown(String homeTown) {
	this.homeTown = homeTown;
}
@Override
public String toString() {
	return "CanBo [fullName=" + fullName + ", age=" + age + ", gender=" + gender + ", homeTown=" + homeTown + "]";
}
	
}
