package assignment3;

import java.util.Scanner;

public class A_Exercise1 {

	public static void main(String[] args) {
		question1();question2();question3();question4();   
	}
//		Exercise 1 (Optional): Datatype Casting
//		Question 1:
//		Khai báo 2 số lương có kiểu dữ liệu là float.
//		Khởi tạo Lương của Account 1 là 5240.5 $
//		Khởi tạo Lương của Account 2 là 10970.055$
//		Khai báo 1 số int để làm tròn Lương của Account 1 và in số int đó ra
//		Khai báo 1 số int để làm tròn Lương của Account 2 và in số int đó ra
		
		private static void question1() {
			System.out.println();
			System.out.println(">>>>>>>>		Exercise 1:  (Optional): Datatype Casting		<<<<<<<<");
			System.out.println("***	Question 1:");
			System.out.println("	 Lam tron luong : ");			
			float salary1  		=	 (float) 5240.5;
			float salary2 		= 	(float) 10970.055;		
		      System.out.print("Salary1 la ");
		      System.out.print(Math.round(+salary1));
		      System.out.println(" $ ");
		      System.out.print("Salary2 la ");
		      System.out.print(Math.round(salary2));
		      System.out.println(" $ ");
		}		

//		Question 2:
//		Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm
//		có số 0 ở đầu cho đủ 5 chữ số)
		private static void question2() {
		System.out.println("***	Question 2:");
		System.out.println("	Lấy ngẫu nhiên 1 số có 5 chữ số  : ");		
		int min = 0;
		int max = 99999;
		int a = (int) (Math.random() * max) + min;
		while (a < 10000) {
		a = a * 10;
		}
		System.out.println("Số ngẫu nhiên: " + a);
		}
		
//		Question 3:
//		Lấy 2 số cuối của số ở Question 2 và in ra.
//		Gợi ý:
//		Cách 1: convert số có 5 chữ số ra String, sau đó lấy 2 số cuối
//		Cách 2: chia lấy dư số đó cho 100
		private static void question3() {
		System.out.println("***	Question 3:");
		System.out.println("	Lấy 2 số cuối của số ở Question 2 và in ra ");		
	
		int min = 0;
		int max = 99999;
		int a = (int) (Math.random() * max) + min;
		while (a < 10000) {
		
		a = a * 10;
		}
		System.out.println("Số ngẫu nhiên of Question2 : " + a);
		String b = String.valueOf(a);
		System.out.println("Hai số cuối of Question2 : " + b.substring(3));
		}
		
//		Question 4:
//		Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
		
		private static void question4() {
		System.out.println("***	Question 4:");
		System.out.println("	nhập vào 2 số nguyên a và b và trả về thương của chúng ");	
		
		int a, b;
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhập so nguyen thu nhat ");
		a = scanner.nextInt();
		do {
		System.out.print("Nhập so nguyen thu hai ");

		b = scanner.nextInt();
		if (b == 0) {
		System.out.print("Vui lòng nhập so nguyen khác 0");
		}
		} while (b == 0);
		scanner.close();
		System.out.println("Thương: " + (float) a / (float) b);
		}
}

