package com.vti.entity2;

public class Security extends Person {
public Security(String name , int age) {
	super(name,age);
	
}
@Override
public void rollUp() {
System.out.println("Security rolling up ");
	
}
@Override
public void collectTicket() {
System.out.println("Security is colecting tickers ");
	
}
@Override
public void teach() {
	// TODO Auto-generated method stub
	
}
}
