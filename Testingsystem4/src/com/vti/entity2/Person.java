package com.vti.entity2;

public class Person implements IRollUp{

	public String name;
	public int age;
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	@Override
	public void rollUp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void collectTicket() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void teach() {
		// TODO Auto-generated method stub
		
	}
	

	}
