package Exercise6;

import java.time.LocalDate;

import Assignment2.Account;

public class Exercise6 {

//		Exercise 6 (Optional): Method
//		Question 1: Tạo method để in ra các số chẵn nguyên dương nhỏ hơn 10

		private static void question1() {

		System.out.println(">>>>>>>>		Exercise 6 (Optional): Method		<<<<<<<<");
		System.out.println("***	Question 1:");
		System.out.println("	 Tạo method để in ra các số chẵn nguyên dương nhỏ hơn 10 ");
			
		for (int i = 0; i < 10; i++) {
		if (i % 2 == 0) {
		System.out.print(i + " ");
		}
		}
		System.out.println("");
		}
//		Question 2:
//		Tạo method để in thông tin các account
	
		private static void question2() {
		System.out.println("***	Question 2:");
		System.out.println("	 Tạo method để in thông tin các account ");

		Account acc10 = new Account();
		acc10.accountID = 10;
		acc10.email = "Nguynkihsia@gmail.com";
		acc10.userName = "NhatKim";
		acc10.fullName = "Nhat Kim Hong";
		acc10.createDateEx5 = LocalDate.now();
		
		Account acc12 = new Account();
		acc12.accountID = 12;
		acc12.email = "phanhuyvinhgmail.com";
		acc12.userName = "Phan Huy Vinh";
		acc12.fullName = "Phan Huy Vinh";
		acc12.createDateEx5 = LocalDate.of(2021, 03, 17);
		
		Account acc13 = new Account();
		acc13.accountID = 3;
		acc13.email = "daonq3";
		acc13.userName = "daonq3";
		acc13.fullName = "Dao Nguyen 3";
		acc13.createDateEx5 = LocalDate.now();
		
		printAccount(acc10);
		printAccount(acc12);
		printAccount(acc13);
		}
		
		private static void printAccount(Account account) {
		System.out.println("ID: " + account.accountID + " Email: " + account.email + " Username: " + account.userName + " FullName: " + account.fullName + " CreareDate: "+ account.createDateEx5);
		}
		
		
//		Question 3:
//		Tạo method để in ra các số nguyên dương nhỏ hơn 10
		
		private static void question3() {
		System.out.println("***	Question 3:");
		System.out.println("	 Tạo method để in ra các số nguyên dương nhỏ hơn 10 ");

		for (int i = 0; i < 10; i++) {
		System.out.print(i + " ");
			}
		}
	
	}

