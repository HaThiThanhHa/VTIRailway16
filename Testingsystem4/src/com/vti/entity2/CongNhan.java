package com.vti.entity2;

public class CongNhan extends CanBo{

	public CongNhan() {
		// TODO Auto-generated constructor stub
	}

private Level_congNhan level;



public Level_congNhan getLevel() {
	return level;
}
public void setLevel(Level_congNhan level) {
	this.level = level;
}
@Override
public String toString() {
	return "CongNhan [level=" + level + ", toString()=" + super.toString() + "]";
}



}
