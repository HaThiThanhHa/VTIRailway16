package com.vti.entity2;

public class Student implements IStudy {

	private String clazz;
	private float fee;
	private int id;
	private String name;
	private String hometown;
	private Float score;
	

	public Student(String name , int age , float fee) {
		super();
		this.setFee(fee);
		
	}
	
	public Student(String name, String hometown) {
		this.name = name;
		this.hometown = hometown;
		this.score = (float) 0;
		}
	public void plusScore(Float score) {
		this.score = this.score + score;
		}
	@Override
	public void doHomework() {
		System.out.println("Doing Homework ");
		
	}

	@Override
	public void copyHomework() {
		System.out.println("Copying Homework ");
		
	}

	@Override
	public void rollUp() {
		System.out.println("Student Rolling up ");
		
	}
	@Override
	public String toString() {
	String rank = null;
	if (this.score < 4.0) {
	rank = "Yếu";
	} else if (this.score < 6.0) {
	rank = "Trung Bình";
	} else if (this.score < 8.0) {
	rank = "Khá";
	}else {
	rank = "Giỏi";
	}
	return "Student [id=" + id + ", name=" + name + ", hometown=" +

	hometown + ", score=" + score + ", Xếp loại=" + rank + "]";
	}
	public float getFee() {
		return fee;
	}

	public void setFee(float fee) {
		this.fee = fee;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getHometown() {
		return hometown;
	}


	public void setHometown(String hometown) {
		this.hometown = hometown;
	}


	public Float getScore() {
		return score;
	}


	public void setScore(Float score) {
		this.score = score;
	}
}