package com.vti.entity;

public class Rectange {
	private Float a;
	private Float b;

	public Float tinhChuvi() {
		return 2 * (a + b);
	}

	public Float diệnTich() {
		return a * b;
	}

	public Rectange(Float a, Float b) {
		super();
		this.a = a;
		this.b = b;
	}
}
