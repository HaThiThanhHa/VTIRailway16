
package assignment3;

import java.time.LocalDate;
import java.util.Date;
import java.util.Scanner;

public class A_Exercise2 {

public static void main(String[] args) {
	question1();
}

private static void question1() {
System.out.println("Khởi tạo mảng Account gồm 5 phần tử sử dụng For");

Account[] accArray = new Account[5];
for (int i = 0; i < accArray.length; i++) {
Account acc = new Account();
acc.email = "Email " + i;
acc.userName = "User name " + i;
acc.fullName = "Full name " + i;
acc.createDate = LocalDate.now();
accArray[i] = acc;
System.out.println("Thông tin Account " + i + " Email: " + accArray[i].email + " UserName: " 
+ accArray[i].userName + " FullName: " +accArray[i].fullName + " CreateDate: " + accArray[i].createDate);
}
}
}













//	
//	Sử dụng class:
//	private static void question1() {
//	System.out.println("Khởi tạo mảng Account gồm 5 phần tử sử dụng
//
//	For");
//
//	Account[] accArray = new Account[5];
//	for (int i = 0; i < accArray.length; i++) {
//	Account acc = new Account();
//	acc.email = "Email " + i;
//	acc.userName = "User name " + i;
//	acc.fullName = "Full name " + i;
//	acc.createDate = LocalDate.now();
//	accArray[i] = acc;
//	System.out.println(
//
//	"Thông tin Account " + i + " Email: " +
//
//	accArray[i].email + " UserName: " + accArray[i].userName
//	+ " FullName: " +
//	accArray[i].fullName + " CreateDate: " + accArray[i].createDate);
//
//	}
//	}
//	Exercise 3(Optional): Boxing & Unboxing
//	Question 1:
//	Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
//	Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
//	float có 2 số sau dấu thập phân)
//	private static void question1() {
//	Integer salary = 5000;
//	System.out.printf("%2.2f", (float) salary);
//	}
//	Question 2:
//	Khai báo 1 String có value = "1234567"
//	Hãy convert String đó ra số int
//	private static void Question2() {
//	System.out.println("-------------Question2--------------");
//	String s = "1234567";
//	int i = Integer.parseInt(s);
//	System.out.println(i);
//	}
//	Question 3:
//	Khởi tạo 1 số Integer có value là chữ "1234567"
//	Sau đó convert số trên thành datatype int
//	private static void question3() {
//	System.out.println("-------------Question3--------------");
//	Integer i = 1234567;
//	int i1 = i.intValue();
//	System.out.println(i1);
//	}
//}
