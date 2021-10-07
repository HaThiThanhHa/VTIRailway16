package assignment3;

public class A_Exercise3 {

	public static void main(String[] args) {
		question1();question2();question3();   
	}


//	Question 1:
//	Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
//	Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
//	float có 2 số sau dấu thập phân)
	
	private static void question1() {
		System.out.println(">>>>>>>>				Exercise 3(Optional): Boxing & Unboxing		<<<<<<<<");
		System.out.println("***	Question 1:");
		Integer salary = 5000;
		System.out.printf("%2.2f", (float) salary);
		System.out.println("");
	}
;
//		Question 2:
//		Khai báo 1 String có value = "1234567"
//		Hãy convert String đó ra số int

	private static void question2() {
		System.out.println("***	Question 2:");
		String s = "1234567";
		int i = Integer.parseInt(s);
		System.out.println(i);
		}
	;
//		Question 3:
//		Khởi tạo 1 số Integer có value là chữ "1234567"
//		Sau đó convert số trên thành datatype int

	private static void question3() {
		System.out.println("***	Question 3:");
		Integer i = 1234567;
		int i1 = i.intValue();
		System.out.println(i1);
	}

}
