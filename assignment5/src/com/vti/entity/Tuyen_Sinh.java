package com.vti.entity;

import java.util.ArrayList;
import java.util.Scanner;

public class Tuyen_Sinh implements ITuyen_Sinh {
	private ArrayList<Contestant> listContestant;
	private Scanner sc;

	public Tuyen_Sinh() {
		listContestant = new ArrayList<Contestant>();
		sc = new Scanner(System.in);
	}

	@Override
	public void addContestant() {
		System.out.println("Nhập vào tên thí sinh:");
		String name = sc.next();
		System.out.println("Nhập vào địa chỉ thí sinh:");
		String address = sc.next();
		System.out.println("Nhập vào mức ưu tiên thí sinh:");
		int priority = sc.nextInt();
		System.out.println("Nhập vào khối thí sinh chọn các khối A, B, C:");

		String block = sc.next();
		Contestant contestant = new Contestant(name, address, priority,

				new Block(block));

		listContestant.add(contestant);
	}

	@Override
	public void showInfoContestant() {

		for (Contestant contestant : listContestant) {
			System.out.println(contestant);
		}
	}

	@Override
	public void findByIdNum(int id) {
		for (Contestant contestant : listContestant) {
			if (contestant.getIdNum() == id) {
				System.out.println(contestant);
			}
		}
	}
}