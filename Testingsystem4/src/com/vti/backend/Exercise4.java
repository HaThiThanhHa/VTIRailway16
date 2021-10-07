package com.vti.backend;

	import com.vti.entity2.Account;
	import com.vti.entity2.Circle;
	import com.vti.entity2.Date;
	import com.vti.entity2.Student;

	public class Exercise4 {
				
		public void printStudent() {
		Student st1 = new Student("Studen1", "Hometown1");
		st1.plusScore(10f);
		Student st2 = new Student("Studen2", "Hometown2");
		st2.plusScore(5f);
		Student st3 = new Student("Studen3", "Hometown3");
		st3.plusScore(9f);
		System.out.println(st1);
		System.out.println(st2);
		System.out.println(st3);
	}

		public void printCircle() {
	
		System.out.println("---Demo Circle ----");
		Circle circle = new Circle(2.0, "red");
		System.out.println("Diện tích hình tròn là: " + circle.getArea());
		System.out.println("---- Demo AccountQues2 -----");
		Account accQues1 = new Account("1", "accQues1", 10);
		Account accQues2 = new Account("2", "accQues2", 20);
		
		System.out.println(	"Số tiền ban đầu của: accQues1: " 
		+ accQues1.getBalance() + " accQues2: " + accQues2.getBalance());

		accQues1.credit(50);
		System.out.println("Balace của accQues1 sau khi Credit 50: " 
		+ accQues1.getBalance());

		accQues1.debit(20);
		System.out.println("Balace của accQues1 sau khi debit 20: " 
		+accQues1.getBalance());
		
		System.out.println("accQues1 chuyển 20 cho accQues2: ");
		accQues1.tranfer(accQues2, 20);
		
		System.out.println("Sau khi chuyển số tiền của accQues1: " 
		+accQues1.getBalance() + " accQues2: " + accQues2.getBalance());
		

		}
		public void printDate() {
	
		System.out.println("---- Demo Date -----");
		Date date1 = new Date(25, 04, 1988);
		System.out.println("Bạn vừa tạo ngày: " + date1);
		System.out.println("Check năm nhuận: ");
		if (date1.isLeapYear()) {
			System.out.println("Đây là năm nhuận");
		} else {
			System.out.println("Đây không phải là năm nhuận");
		}
	}

}
