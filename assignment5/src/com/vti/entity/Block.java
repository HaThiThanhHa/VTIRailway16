package com.vti.entity;

public class Block {
	private String name;
	private String subject;

	public Block(String name) {
		this.name = name;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	public String getSubject() {
		switch (this.name) {
		case "A":
			this.subject = "Toán, Lý, Hóa";
			break;
		case "B":
			this.subject = "Toán, Hóa, Sinh";
			break;
		case "C":
			this.subject = "Văn, Sử, Địa";
			break;
		}
		return this.subject;
	}
}
