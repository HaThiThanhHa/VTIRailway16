package com.vti.entity2;

public class StudentAbstract extends PersonAbstract {
	private int id;
	public StudentAbstract(String name, int id) {
	super(name);
	this.id = id;
	}
	public int getId() {
	return id;
	}
	public void setId(int id) {
	this.id = id;
	}
	}