package com.vti.entity2;

public class highSchoolStudent {


	public class HighSchoolStudent extends StudentAbstract{
	private String clazz;
	private String desiredUniversity;
	
	public HighSchoolStudent(String name, int id, String clazz, String desiredUniversity) {
		super(name, id);
		this.clazz = clazz;
		this.desiredUniversity = desiredUniversity;
	}

	@Override
	public String toString() {
		return "HighSchoolStudent [" + (clazz != null ? "clazz=" + clazz + ", " : "")
				+ (desiredUniversity != null ? "desiredUniversity=" + desiredUniversity : "") + "]";
	}

	
	}	
}
